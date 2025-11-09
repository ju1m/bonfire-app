{ pkg-config, vips, ... }:
finalMixPkgs: previousMixPkgs: {
  vix = previousMixPkgs.vix.overrideAttrs (previousAttrs: {
    env.VIX_COMPILATION_MODE = "PLATFORM_PROVIDED_LIBVIPS";
    buildInputs = previousAttrs.buildInputs or [ ] ++ [
      pkg-config
      vips
    ];
  });
}
