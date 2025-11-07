{
  fetchFromGitHub,
  beamPackages,
  ...
}:
finalMixPkgs: previousMixPkgs: {
  untangle = beamPackages.buildMix {
    name = "untangle";
    version = "0.3.3-unstable-2025-10-16";

    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "untangle";
      rev = "00c4aea4f8261bd9030a1585c60601b1a43cb5d9";
      hash = "sha256-RB3r3YOlHTzdylN+fwjnXpoOe/7QjKQ0sqHsEEPY/vk=";
    };

    beamDeps = with finalMixPkgs; [ decorator ];
  };
}
