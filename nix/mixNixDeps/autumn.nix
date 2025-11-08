{
  rustPlatform,
  writeTextDir,
  ...
}:
let
  libName = "autumn";
  nif = "${libName}us_nif";
in
finalMixPkgs: previousMixPkgs: {

  ${libName} =
    (previousMixPkgs.${libName}.override {
      appConfigPath = writeTextDir "config.exs" ''
        import Config
        config :${libName}, Autumn.Native, skip_compilation?: true
      '';
    }).overrideAttrs
      (
        finalAttrs: previousAttrs: {
          # Explanation: nix replaces Erlang's rustler and rustler_precompiled
          # by providing the Rust library lib${nif}.so, before buildPhase.
          env.AUTUMN_BUILD = "true";
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
              # Explanation(+maintenance/update +functional/correctness):
              # finalAttrs.version being part of the `name`,
              # when it will change the fixed-output derivation will be rebuilt
              # to get the new correct cargoHash.
              cargoHash = "sha256-kPdFdWhMbSrNnl6woQrZ6PqcQl+rSWbQ2kENZZxxjEE=";
            };
          };
        }
      );
}
