#!/usr/bin/env -S nix -L shell nixpkgs#beamPackages.elixir nixpkgs#gitMinimal --command bash
# shellcheck disable=SC2016
set -eux
flake=$(realpath "${0%/*}/../..")
pkg="$1"
export LANG=C
nix 3>&1 >/dev/null -L develop "$flake"#mixNixDeps."$pkg" --command bash -e <<EOF
source \$stdenv/setup
PATH=\$PATH:$PATH
cd "\$NIX_BUILD_TOP"
runPhase unpackPhase
runPhase patchPhase
runPhase configurePhase
rm mix.lock
unset HEX_OFFLINE
mix deps.get
>&3 sed mix.lock -ne 's/^ *"\([^ "]*\)".*/\1/p'
EOF
