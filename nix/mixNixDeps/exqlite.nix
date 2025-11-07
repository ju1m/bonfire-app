{ ... }:
finalMixPkgs: previousMixPkgs: {
  exqlite = previousMixPkgs.exqlite.overrideAttrs (_: {
    # Explanation: workaround:
    # (File.Error) could not make directory (with -p) "/homeless-shelter/.cache/elixir_make":
    # no such file or directory
    preConfigure = ''
      export ELIXIR_MAKE_CACHE_DIR="$TMPDIR/.cache"
    '';
  });
}
