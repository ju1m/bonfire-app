{
  rustPlatform,
  writeTextDir,
  ...
}:
let
  libName = "mjml";
  nif = "${libName}_nif";
in
finalMixPkgs: previousMixPkgs: {
  ${libName} =
    (previousMixPkgs.${libName}.override {
      appConfigPath = writeTextDir "config.exs" ''
        import Config
        config :${libName}, Mjml.Native, skip_compilation?: true
      '';
    }).overrideAttrs
      (
        finalAttrs: previousAttrs: {
          # Explanation: nix replaces Erlang's rustler and rustler_precompiled
          # by providing the Rust library lib${nif}.so, before buildPhase.
          env.RUSTLER_PRECOMPILED_FORCE_BUILD_ALL = "true";
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
              cargoHash = "sha256-8cgpTJKFFa35Gv4N9BjNaMFsLsKLVBW5FqBbqY22r9I=";
            };
          };
        }
      );
}
