{
  rustPlatform,
  writeTextDir,
  runCommand,
  ...
}:
let
  libName = "mdex";
  nif = "comrak_nif";
in
finalMixPkgs: previousMixPkgs: {
  ${libName} =
    (previousMixPkgs.${libName}.override {
      appConfigPath = writeTextDir "config.exs" ''
        import Config
        config :${libName}, MDEx.Native, skip_compilation?: true
      '';
    }).overrideAttrs
      (
        finalAttrs: previousAttrs: {
          # Explanation: nix replaces Erlang's rustler and rustler_precompiled
          # by providing the Rust library lib${nif}.so.
          env.MDEX_BUILD = "true";
          preConfigure = previousAttrs.preConfigure or "" + ''
            mkdir -p _build/prod/lib/${libName}/priv/native/
            ln -s ${finalAttrs.passthru.${nif}}/lib/lib${nif}.so \
              _build/prod/lib/${libName}/priv/native/${nif}.so
          '';

          passthru = {
            ${nif} = rustPlatform.buildRustPackage {
              pname = nif;
              version = finalAttrs.version;
              src = "${finalAttrs.src}/native/${nif}";
              cargoHash = "sha256-/YMCBU+WK2Ui51luE/xwxOuEXcgpTwhnI+x+WTyqRoU=";
            };
          };
        }
      );
}
