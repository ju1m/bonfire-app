{ writeTextDir, ... }:
finalMixPkgs: previousMixPkgs: {
  phoenix_test = (
    previousMixPkgs.phoenix_test.override {
      # Explanation: workaround:
      # == Compilation error in file lib/phoenix_test/live.ex ==
      # ** (RuntimeError) module attribute @endpoint not set for socket/2
      #
      # See  https://github.com/germsvel/phoenix_test/issues/255
      appConfigPath = writeTextDir "config.exs" ''
        import Config
        config :phoenix_test, :endpoint, PhoenixTest.Endpoint
      '';
    }
  );
}
