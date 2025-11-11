{
  beamPackages,
  rustPlatform,
  writeTextDir,
  ...
}:
finalMixPkgs: previousMixPkgs: {
  # For `pride`
  uuidv7 =
    let
      libName = "uuidv7";
      nif = libName;
    in
    (beamPackages.buildMix rec {
      name = libName;
      version = "0.2.1"; # From `pride`'s freshly-regenerated mix.lock

      src = beamPackages.fetchHex {
        pkg = "uuidv7";
        version = "${version}";
        sha256 = "a7ec15522c7796399469ad3e8a00190d5fe4a02839944bea61dfbde35fea12e5";
      };

      beamDeps = with finalMixPkgs; [
        ecto
        rustler_precompiled
      ];

      appConfigPath = writeTextDir "config.exs" ''
        import Config
        config :${libName}, UUIDv7, skip_compilation?: true
      '';
    }).overrideAttrs
      (
        finalAttrs: previousAttrs: {
          # Explanation: nix replaces Erlang's rustler and rustler_precompiled
          # by providing the Rust library lib${nif}.so, before buildPhase.
          env.FORCE_BUILD = "true";
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
              cargoHash = "sha256-Wge/H+3vqmpWfUchHHG9KOizt9Gen6t47/17zDCrOW0=";
            };
          };
        }
      );
}
