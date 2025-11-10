#!/usr/bin/env -S nix -L shell nixpkgs#beamPackages.elixir nixpkgs#jq nixpkgs#nixfmt-rfc-style --command bash
# shellcheck disable=SC2154
#
# Usage: ./extra-deps-update.sh generates ./extra-deps-sources.nix
# and then beamDeps must be manually added in ./extra-deps-fixes.nix
#
# Explanation: this script addresses a shortcoming of mix2nix
# causing dependencies in mix.exs pinned using :git (instead of :hex)
# to not be included in the generated deps.nix
# The mix.lock pins each :git with a revision,
# but does not list its dependencies,
# so they have to be manually filled in ./extra-deps-fixes.nix
# to build and provision them in topological order.
#
# This involves unpacking the pinned version,
# regenerating the mix.lock often out of sync with mix.exs
# and extracting the dependencies names from that mix.lock
# to put them into beamDeps.
#
# Relevant: https://github.com/ydlr/mix2nix/issues/10
# Relevant: https://github.com/code-supply/deps_nix
#
# ToDo: sponsor ydlr to implement that properly in mix2nix?
set -eux
out="${0%/*}"/extra-deps-sources.nix
{
  cat <<EOF
{
  lib,
  beamPackages,
  fetchFromGitHub,
  fetchgit,
  ...
}:
let
  # FixMe: can some of those packages be using buildRebar3?
  buildRebar3 = lib.makeOverridable beamPackages.buildRebar3;
  buildMix = lib.makeOverridable beamPackages.buildMix;
  buildErlangMk = lib.makeOverridable beamPackages.buildErlangMk;
in
finalMixPkgs: previousMixPkgs: {
EOF
  while IFS= read -r line; do
    {
      : "$line"
      unset src domain pkg owner repo rev repoURL cloneDir
      case "$line" in
      "%{") continue ;;
      "}") continue ;;
      *":hex,"*) continue ;;
      "}") continue ;;
      *:git,*://github.com/*)
        eval "$(printf %s "$line" | sed -ne 's~"\([^"]*\)": *{:git, *"https://github.com/\([^/]*\)/\([^/"]*\)", *"\([^/"]*\)",.*~pkg="\1"; owner="\2"; repo="\3"; rev="\4"~p')"
        repoURL="https://github.com/$owner/$repo"
        hash=$(nix flake prefetch --json "github:$owner/$repo?allRefs=1&rev=$rev&submodules=1" | jq -r .hash)
        src=$(
          printf 'fetchFromGitHub { owner = "%s"; repo = "%s"; rev = "%s"; hash = "%s"; }' \
            "$owner" \
            "$repo" \
            "$rev" \
            "$hash"
        )
        ;;
      *:git,*://akkoma.dev/*)
        eval "$(printf %s "$line" | sed -ne 's~"\([^"]*\)": *{:git, *"https://\([^/]*\)/\([^/]*\)/\([^./"]*\)\(\.git\)\?", *"\([^/"]*\)",.*~pkg="\1"; domain="\2"; owner="\3"; repo="\4"; rev="\6"~p')"
        repoURL="https://$domain/$owner/$repo"
        hash=$(nix flake prefetch --json "git+https://$domain/$owner/$repo?allRefs=1&rev=$rev&submodules=1" | jq -r .hash)
        src=$(
          # Explanation: akkoma.dev returns an error 500 when using fetchFromGitea
          # 'fetchFromGitea { domain = "%s"; owner = "%s"; repo = "%s"; rev = "%s"; hash = "%s"; }' \
          printf 'fetchgit { url = "https://%s/%s/%s"; rev = "%s"; hash = "%s"; }' \
            "$domain" \
            "$owner" \
            "$repo" \
            "$rev" \
            "$hash"
        )
        ;;
      esac
      if [ -z "${src:+set}" ]; then
        : "$(tput rev)FixMe: unsupported src$(tput sgr0)"
        exit 1
      fi
      cat <<CAT
$pkg = buildMix {
  name = "$pkg";
  version = "$rev";
  src = $src;
  beamDeps = with finalMixPkgs; [
CAT
      mixPkg="
        let pkgs = import <nixpkgs> {};
            inherit (pkgs) fetchFromGitHub fetchgit;
            inherit (pkgs.beamPackages) buildMix;
        in
        buildMix {
          name=\"$pkg\";
          version=\"$rev\";
          src = $src;
          postPatch = ''
            # Explanation: some mess.exs are outdated wrt. bonfire-app/lib/mix/mess.exs
            # causing mix deps.tree to fail…
            ln -fns \${lib/mix/mess.exs} mess.exs
            # Explanation: some mix.exs depend on mess.exs but do not load it…
            sed -i mix.exs -e 's/^ *# *Code.eval_file(\"mess.exs\"/Code.eval_file(\"mess.exs\"/'
            rm -rf config
            mkdir config
          '';
          removeConfig = true;
          nativeBuildInputs = [
            pkgs.gnused
          ];
        }
      "
      nix 3>&1 >&2 -L develop --ignore-env --impure --expr "$mixPkg" --command bash -xe <<SCRIPT
        source \$stdenv/setup
        cd "\$NIX_BUILD_TOP"
        runPhase unpackPhase
        runPhase patchPhase
        runPhase configurePhase
        export HOME="\$NIX_BUILD_TOP/home"
        unset HEX_OFFLINE
        mix deps.tree | sed >&3 -ne "s/^[├└]── *\([^ ]*\).*/\1/p"
        #mix deps.get </dev/null
        #sed >&3 mix.lock -ne 's/^ *"\([^ "]*\)".*/\1/p'
SCRIPT
      cat <<CAT
  ];
};
CAT
    } </dev/null
  done <mix.lock
  printf "}\n"
} >"$out".tmp.nix
nixfmt "$out".tmp.nix
cp -vf "$out".tmp.nix "$out"
