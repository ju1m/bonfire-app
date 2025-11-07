{ lib, beamPackages, overrides ? (x: y: {}) }:

let
  buildRebar3 = lib.makeOverridable beamPackages.buildRebar3;
  buildMix = lib.makeOverridable beamPackages.buildMix;
  buildErlangMk = lib.makeOverridable beamPackages.buildErlangMk;

  self = packages // (overrides self packages);

  packages = with beamPackages; with self; {
    absinthe = buildMix rec {
      name = "absinthe";
      version = "1.7.10";

      src = fetchHex {
        pkg = "absinthe";
        version = "${version}";
        sha256 = "ffda95735364c041a65a4b0e02ffb04eabb1e52ab664fa7eeecefb341449e8c2";
      };

      beamDeps = [ dataloader decimal nimble_parsec opentelemetry_process_propagator telemetry ];
    };

    absinthe_error_payload = buildMix rec {
      name = "absinthe_error_payload";
      version = "1.2.0";

      src = fetchHex {
        pkg = "absinthe_error_payload";
        version = "${version}";
        sha256 = "d9b9201a2710a2c09da7a5a35a2d8aff0b0c9253875ab629c45747e13f4b1e4a";
      };

      beamDeps = [ absinthe ecto ];
    };

    absinthe_phoenix = buildMix rec {
      name = "absinthe_phoenix";
      version = "2.0.3";

      src = fetchHex {
        pkg = "absinthe_phoenix";
        version = "${version}";
        sha256 = "caffaea03c17ea7419fe07e4bc04c2399c47f0d8736900623dbf4749a826fd2c";
      };

      beamDeps = [ absinthe absinthe_plug decimal phoenix phoenix_html phoenix_pubsub ];
    };

    absinthe_plug = buildMix rec {
      name = "absinthe_plug";
      version = "1.5.9";

      src = fetchHex {
        pkg = "absinthe_plug";
        version = "${version}";
        sha256 = "dcdc84334b0e9e2cd439bd2653678a822623f212c71088edf0a4a7d03f1fa225";
      };

      beamDeps = [ absinthe plug ];
    };

    absinthe_relay = buildMix rec {
      name = "absinthe_relay";
      version = "1.5.2";

      src = fetchHex {
        pkg = "absinthe_relay";
        version = "${version}";
        sha256 = "0587ee913afa31512e1457a5064ee88427f8fe7bcfbeeecd41c71d9cff0b62b6";
      };

      beamDeps = [ absinthe ecto ];
    };

    acceptor_pool = buildRebar3 rec {
      name = "acceptor_pool";
      version = "1.0.0";

      src = fetchHex {
        pkg = "acceptor_pool";
        version = "${version}";
        sha256 = "0cbcd83fdc8b9ad2eee2067ef8b91a14858a5883cb7cd800e6fcd5803e158788";
      };

      beamDeps = [];
    };

    accessible = buildMix rec {
      name = "accessible";
      version = "0.3.0";

      src = fetchHex {
        pkg = "accessible";
        version = "${version}";
        sha256 = "13a11b0611ab82f7b9098a88465b5674f729c02bd613216243c123c65f90f296";
      };

      beamDeps = [];
    };

    appsignal = buildMix rec {
      name = "appsignal";
      version = "2.15.11";

      src = fetchHex {
        pkg = "appsignal";
        version = "${version}";
        sha256 = "5218b0816fcf71b3800157de1e76a49a75bca0622726ac5cb0fe3b79efb2b0c4";
      };

      beamDeps = [ castore certifi decimal decorator finch jason telemetry ];
    };

    appsignal_phoenix = buildMix rec {
      name = "appsignal_phoenix";
      version = "2.7.0";

      src = fetchHex {
        pkg = "appsignal_phoenix";
        version = "${version}";
        sha256 = "b4df4ffce4c37e85a20e0e37e1a10e65b096f97608cec1dd5bd58dc365111a44";
      };

      beamDeps = [ appsignal appsignal_plug phoenix phoenix_html phoenix_live_view telemetry ];
    };

    appsignal_plug = buildMix rec {
      name = "appsignal_plug";
      version = "2.1.1";

      src = fetchHex {
        pkg = "appsignal_plug";
        version = "${version}";
        sha256 = "bbcaf3f888f019d088123c843583daf81dd97c8a9bd3cad0df7858a0a85e065d";
      };

      beamDeps = [ appsignal plug telemetry ];
    };

    archeometer = buildMix rec {
      name = "archeometer";
      version = "0.5.0";

      src = fetchHex {
        pkg = "archeometer";
        version = "${version}";
        sha256 = "6dfc82198709c6a916795b779c801560c14b591770b34feeff04778a8f712187";
      };

      beamDeps = [ credo css_colors elixir_uuid exqlite memoize temp wild ];
    };

    argon2_elixir = buildMix rec {
      name = "argon2_elixir";
      version = "4.1.3";

      src = fetchHex {
        pkg = "argon2_elixir";
        version = "${version}";
        sha256 = "7c295b8d8e0eaf6f43641698f962526cdf87c6feb7d14bd21e599271b510608c";
      };

      beamDeps = [ comeonin elixir_make ];
    };

    arrows = buildMix rec {
      name = "arrows";
      version = "0.2.1";

      src = fetchHex {
        pkg = "arrows";
        version = "${version}";
        sha256 = "c3de1ba8f2fd79782bce66d601e6aeded1bcb67e4190858e51da4fe3684ffb9d";
      };

      beamDeps = [];
    };

    assert_value = buildMix rec {
      name = "assert_value";
      version = "0.10.5";

      src = fetchHex {
        pkg = "assert_value";
        version = "${version}";
        sha256 = "ba89aecb2e886e55b2c7ef9973a153838976b2abd10a931fa2d41b74dfb27de6";
      };

      beamDeps = [];
    };

    astro = buildMix rec {
      name = "astro";
      version = "1.1.2";

      src = fetchHex {
        pkg = "astro";
        version = "${version}";
        sha256 = "b82204ade17ec730b13b4d7a163bf204ec9ddeff77147afda032726539644c7f";
      };

      beamDeps = [ geo tz_world tzdata ];
    };

    autumn = buildMix rec {
      name = "autumn";
      version = "0.5.2";

      src = fetchHex {
        pkg = "autumn";
        version = "${version}";
        sha256 = "83dd42823f91ff97ea91fba3dac62f1ffce384b2b43c8db3b5a73108d6a8cad3";
      };

      beamDeps = [ nimble_options rustler rustler_precompiled ];
    };

    bamboo = buildMix rec {
      name = "bamboo";
      version = "2.5.0";

      src = fetchHex {
        pkg = "bamboo";
        version = "${version}";
        sha256 = "35c8635ff6677a81ab7258944ff15739280f3254a041b6f0229dddeb9b90ad3d";
      };

      beamDeps = [ hackney jason mime plug ];
    };

    bamboo_campaign_monitor = buildMix rec {
      name = "bamboo_campaign_monitor";
      version = "0.1.0";

      src = fetchHex {
        pkg = "bamboo_campaign_monitor";
        version = "${version}";
        sha256 = "5b60a27ab2b8596f274f22d3cb8bd8d8f3865667f1ec181bfa6635aa7646d79a";
      };

      beamDeps = [ bamboo hackney plug ];
    };

    bamboo_mailjet = buildMix rec {
      name = "bamboo_mailjet";
      version = "0.1.0";

      src = fetchHex {
        pkg = "bamboo_mailjet";
        version = "${version}";
        sha256 = "cb213439a14dfe0f8a54dbcb7b40790399d5207025378b64d9717271072e8427";
      };

      beamDeps = [ bamboo ];
    };

    bamboo_postmark = buildMix rec {
      name = "bamboo_postmark";
      version = "1.0.0";

      src = fetchHex {
        pkg = "bamboo_postmark";
        version = "${version}";
        sha256 = "443b3fb9e00a5d092ccfc91cfe3dbecab2a931114d4dc5e1e70f28f6c640c63d";
      };

      beamDeps = [ bamboo hackney plug ];
    };

    bamboo_sendcloud = buildMix rec {
      name = "bamboo_sendcloud";
      version = "0.2.0";

      src = fetchHex {
        pkg = "bamboo_sendcloud";
        version = "${version}";
        sha256 = "37e35b408394f1be2f3cefb3fd3064527e92bfd8e6e5a546aaad705f105b405a";
      };

      beamDeps = [ bamboo hackney plug poison ];
    };

    bamboo_ses = buildMix rec {
      name = "bamboo_ses";
      version = "0.4.5";

      src = fetchHex {
        pkg = "bamboo_ses";
        version = "${version}";
        sha256 = "ea3e82b35a7a255690753824392e8eb25f5bf884cfec416deb9a81bbeb1b503b";
      };

      beamDeps = [ bamboo ex_aws gen_smtp jason ];
    };

    bamboo_smtp = buildMix rec {
      name = "bamboo_smtp";
      version = "4.2.2";

      src = fetchHex {
        pkg = "bamboo_smtp";
        version = "${version}";
        sha256 = "28cac2ec8adaae02aed663bf68163992891a3b44cfd7ada0bebe3e09bed7207f";
      };

      beamDeps = [ bamboo gen_smtp ];
    };

    bamboo_sparkpost = buildMix rec {
      name = "bamboo_sparkpost";
      version = "2.0.0";

      src = fetchHex {
        pkg = "bamboo_sparkpost";
        version = "${version}";
        sha256 = "a89a1c29e122270e50c53c77e091d885c40bebb689f8904572c38b299649bebf";
      };

      beamDeps = [ bamboo ];
    };

    bandit = buildMix rec {
      name = "bandit";
      version = "1.8.0";

      src = fetchHex {
        pkg = "bandit";
        version = "${version}";
        sha256 = "8458ff4eed20ff2a2ea69d4854883a077c33ea42b51f6811b044ceee0fa15422";
      };

      beamDeps = [ hpax plug telemetry thousand_island websock ];
    };

    beam_file = buildMix rec {
      name = "beam_file";
      version = "0.6.2";

      src = fetchHex {
        pkg = "beam_file";
        version = "${version}";
        sha256 = "09a99e8e5aad674edcad7213b0d7602375dfd3c7d02f8e3136e3efae0bcc9c56";
      };

      beamDeps = [];
    };

    benchee = buildMix rec {
      name = "benchee";
      version = "1.4.0";

      src = fetchHex {
        pkg = "benchee";
        version = "${version}";
        sha256 = "299cd10dd8ce51c9ea3ddb74bb150f93d25e968f93e4c1fa31698a8e4fa5d715";
      };

      beamDeps = [ deep_merge statistex ];
    };

    benchee_html = buildMix rec {
      name = "benchee_html";
      version = "1.0.1";

      src = fetchHex {
        pkg = "benchee_html";
        version = "${version}";
        sha256 = "b00a181af7152431901e08f3fc9f7197ed43ff50421a8347b0c80bf45d5b3fef";
      };

      beamDeps = [ benchee benchee_json ];
    };

    benchee_json = buildMix rec {
      name = "benchee_json";
      version = "1.0.0";

      src = fetchHex {
        pkg = "benchee_json";
        version = "${version}";
        sha256 = "da05d813f9123505f870344d68fb7c86a4f0f9074df7d7b7e2bb011a63ec231c";
      };

      beamDeps = [ benchee jason ];
    };

    blurhash = buildMix rec {
      name = "blurhash";
      version = "0.1.0";

      src = fetchHex {
        pkg = "rinpatch_blurhash";
        version = "${version}";
        sha256 = "19911a5dcbb0acb9710169a72f702bce6cb048822b12de566ccd82b2cc42b907";
      };

      beamDeps = [ mogrify ];
    };

    boltx = buildMix rec {
      name = "boltx";
      version = "0.0.6";

      src = fetchHex {
        pkg = "boltx";
        version = "${version}";
        sha256 = "576b8f21a2021674130d04cd1fc79a4829a23d2cdf50641b3d7a00ce31b98ead";
      };

      beamDeps = [ db_connection jason poison ];
    };

    brex_result = buildMix rec {
      name = "brex_result";
      version = "0.4.0";

      src = fetchHex {
        pkg = "brex_result";
        version = "${version}";
        sha256 = "c221aac71c48727ef55dc56cf845772a54e1db538564280c868eb0595e1e44f8";
      };

      beamDeps = [];
    };

    bunt = buildMix rec {
      name = "bunt";
      version = "1.0.0";

      src = fetchHex {
        pkg = "bunt";
        version = "${version}";
        sha256 = "dc5f86aa08a5f6fa6b8096f0735c4e76d54ae5c9fa2c143e5a1fc7c1cd9bb6b5";
      };

      beamDeps = [];
    };

    bypass = buildMix rec {
      name = "bypass";
      version = "2.1.0";

      src = fetchHex {
        pkg = "bypass";
        version = "${version}";
        sha256 = "d9b5df8fa5b7a6efa08384e9bbecfe4ce61c77d28a4282f79e02f1ef78d96b80";
      };

      beamDeps = [ plug plug_cowboy ranch ];
    };

    cachex = buildMix rec {
      name = "cachex";
      version = "4.0.4";

      src = fetchHex {
        pkg = "cachex";
        version = "${version}";
        sha256 = "a0417593fcca4b6bd0330bb3bbd507c379d5287213ab990dbc0dd704cedede0a";
      };

      beamDeps = [ eternal ex_hash_ring jumper sleeplocks unsafe ];
    };

    castore = buildMix rec {
      name = "castore";
      version = "1.0.15";

      src = fetchHex {
        pkg = "castore";
        version = "${version}";
        sha256 = "96ce4c69d7d5d7a0761420ef743e2f4096253931a3ba69e5ff8ef1844fe446d3";
      };

      beamDeps = [];
    };

    cc_precompiler = buildMix rec {
      name = "cc_precompiler";
      version = "0.1.11";

      src = fetchHex {
        pkg = "cc_precompiler";
        version = "${version}";
        sha256 = "3427232caf0835f94680e5bcf082408a70b48ad68a5f5c0b02a3bea9f3a075b9";
      };

      beamDeps = [ elixir_make ];
    };

    certifi = buildRebar3 rec {
      name = "certifi";
      version = "2.15.0";

      src = fetchHex {
        pkg = "certifi";
        version = "${version}";
        sha256 = "b147ed22ce71d72eafdad94f055165c1c182f61a2ff49df28bcc71d1d5b94a60";
      };

      beamDeps = [];
    };

    chameleon = buildMix rec {
      name = "chameleon";
      version = "2.5.0";

      src = fetchHex {
        pkg = "chameleon";
        version = "${version}";
        sha256 = "f3559827d8b4fe53a44e19e56ae94bedd36a355e0d33e18067b8abc37ec428db";
      };

      beamDeps = [];
    };

    chatterbox = buildRebar3 rec {
      name = "chatterbox";
      version = "0.15.1";

      src = fetchHex {
        pkg = "ts_chatterbox";
        version = "${version}";
        sha256 = "4f75b91451338bc0da5f52f3480fa6ef6e3a2aeecfc33686d6b3d0a0948f31aa";
      };

      beamDeps = [ hpack ];
    };

    circular_buffer = buildMix rec {
      name = "circular_buffer";
      version = "0.4.2";

      src = fetchHex {
        pkg = "circular_buffer";
        version = "${version}";
        sha256 = "bc5f4ba112bce88aa4692427a8b23aa5baddf7c810d5dc3e7696f398194f104e";
      };

      beamDeps = [];
    };

    cldr_utils = buildMix rec {
      name = "cldr_utils";
      version = "2.28.3";

      src = fetchHex {
        pkg = "cldr_utils";
        version = "${version}";
        sha256 = "40083cd9a5d187f12d675cfeeb39285f0d43e7b7f2143765161b72205d57ffb5";
      };

      beamDeps = [ castore certifi decimal ];
    };

    combine = buildMix rec {
      name = "combine";
      version = "0.10.0";

      src = fetchHex {
        pkg = "combine";
        version = "${version}";
        sha256 = "1b1dbc1790073076580d0d1d64e42eae2366583e7aecd455d1215b0d16f2451b";
      };

      beamDeps = [];
    };

    comeonin = buildMix rec {
      name = "comeonin";
      version = "5.5.1";

      src = fetchHex {
        pkg = "comeonin";
        version = "${version}";
        sha256 = "65aac8f19938145377cee73973f192c5645873dcf550a8a6b18187d17c13ccdb";
      };

      beamDeps = [];
    };

    complex = buildMix rec {
      name = "complex";
      version = "0.6.0";

      src = fetchHex {
        pkg = "complex";
        version = "${version}";
        sha256 = "0a5fa95580dcaf30fcd60fe1aaf24327c0fe401e98c24d892e172e79498269f9";
      };

      beamDeps = [];
    };

    corsica = buildMix rec {
      name = "corsica";
      version = "2.1.3";

      src = fetchHex {
        pkg = "corsica";
        version = "${version}";
        sha256 = "616c08f61a345780c2cf662ff226816f04d8868e12054e68963e95285b5be8bc";
      };

      beamDeps = [ plug telemetry ];
    };

    cowboy = buildErlangMk rec {
      name = "cowboy";
      version = "2.13.0";

      src = fetchHex {
        pkg = "cowboy";
        version = "${version}";
        sha256 = "e724d3a70995025d654c1992c7b11dbfea95205c047d86ff9bf1cda92ddc5614";
      };

      beamDeps = [ cowlib ranch ];
    };

    cowboy_telemetry = buildRebar3 rec {
      name = "cowboy_telemetry";
      version = "0.4.0";

      src = fetchHex {
        pkg = "cowboy_telemetry";
        version = "${version}";
        sha256 = "7d98bac1ee4565d31b62d59f8823dfd8356a169e7fcbb83831b8a5397404c9de";
      };

      beamDeps = [ cowboy telemetry ];
    };

    cowlib = buildRebar3 rec {
      name = "cowlib";
      version = "2.15.0";

      src = fetchHex {
        pkg = "cowlib";
        version = "${version}";
        sha256 = "4f00c879a64b4fe7c8fcb42a4281925e9ffdb928820b03c3ad325a617e857532";
      };

      beamDeps = [];
    };

    credo = buildMix rec {
      name = "credo";
      version = "1.7.12";

      src = fetchHex {
        pkg = "credo";
        version = "${version}";
        sha256 = "8493d45c656c5427d9c729235b99d498bd133421f3e0a683e5c1b561471291e5";
      };

      beamDeps = [ bunt file_system jason ];
    };

    crypto_rand = buildMix rec {
      name = "crypto_rand";
      version = "1.0.4";

      src = fetchHex {
        pkg = "crypto_rand";
        version = "${version}";
        sha256 = "ad1862fd3e1c938f60982902632474868ea96901d75dd53f0ec32dd55e123549";
      };

      beamDeps = [];
    };

    css_colors = buildMix rec {
      name = "css_colors";
      version = "0.2.2";

      src = fetchHex {
        pkg = "css_colors";
        version = "${version}";
        sha256 = "20375fba1657ad6a5ccfa5c056471bd1e251c93a865663752b88c1b182b8228f";
      };

      beamDeps = [ ecto ];
    };

    ctx = buildRebar3 rec {
      name = "ctx";
      version = "0.6.0";

      src = fetchHex {
        pkg = "ctx";
        version = "${version}";
        sha256 = "a14ed2d1b67723dbebbe423b28d7615eb0bdcba6ff28f2d1f1b0a7e1d4aa5fc2";
      };

      beamDeps = [];
    };

    dataloader = buildMix rec {
      name = "dataloader";
      version = "2.0.2";

      src = fetchHex {
        pkg = "dataloader";
        version = "${version}";
        sha256 = "4c6cabc0b55e96e7de74d14bf37f4a5786f0ab69aa06764a1f39dda40079b098";
      };

      beamDeps = [ ecto opentelemetry_process_propagator telemetry ];
    };

    db_connection = buildMix rec {
      name = "db_connection";
      version = "2.8.1";

      src = fetchHex {
        pkg = "db_connection";
        version = "${version}";
        sha256 = "a61a3d489b239d76f326e03b98794fb8e45168396c925ef25feb405ed09da8fd";
      };

      beamDeps = [ telemetry ];
    };

    decimal = buildMix rec {
      name = "decimal";
      version = "2.3.0";

      src = fetchHex {
        pkg = "decimal";
        version = "${version}";
        sha256 = "a4d66355cb29cb47c3cf30e71329e58361cfcb37c34235ef3bf1d7bf3773aeac";
      };

      beamDeps = [];
    };

    decorator = buildMix rec {
      name = "decorator";
      version = "1.4.0";

      src = fetchHex {
        pkg = "decorator";
        version = "${version}";
        sha256 = "0a07cedd9083da875c7418dea95b78361197cf2bf3211d743f6f7ce39656597f";
      };

      beamDeps = [];
    };

    deep_merge = buildMix rec {
      name = "deep_merge";
      version = "1.0.0";

      src = fetchHex {
        pkg = "deep_merge";
        version = "${version}";
        sha256 = "ce708e5f094b9cd4e8f2be4f00d2f4250c4095be93f8cd6d018c753894885430";
      };

      beamDeps = [];
    };

    digital_token = buildMix rec {
      name = "digital_token";
      version = "1.0.0";

      src = fetchHex {
        pkg = "digital_token";
        version = "${version}";
        sha256 = "8ed6f5a8c2fa7b07147b9963db506a1b4c7475d9afca6492136535b064c9e9e6";
      };

      beamDeps = [ cldr_utils jason ];
    };

    dog_sketch = buildMix rec {
      name = "dog_sketch";
      version = "0.1.3";

      src = fetchHex {
        pkg = "dog_sketch";
        version = "${version}";
        sha256 = "be6d172a3d3809a0acbc85421a5d25a794841560b6f930540c345342c591d0df";
      };

      beamDeps = [];
    };

    earmark_parser = buildMix rec {
      name = "earmark_parser";
      version = "1.4.44";

      src = fetchHex {
        pkg = "earmark_parser";
        version = "${version}";
        sha256 = "4778ac752b4701a5599215f7030989c989ffdc4f6df457c5f36938cc2d2a2750";
      };

      beamDeps = [];
    };

    ecto = buildMix rec {
      name = "ecto";
      version = "3.13.4";

      src = fetchHex {
        pkg = "ecto";
        version = "${version}";
        sha256 = "5ad7d1505685dfa7aaf86b133d54f5ad6c42df0b4553741a1ff48796736e88b2";
      };

      beamDeps = [ decimal jason telemetry ];
    };

    ecto_dev_logger = buildMix rec {
      name = "ecto_dev_logger";
      version = "0.14.1";

      src = fetchHex {
        pkg = "ecto_dev_logger";
        version = "${version}";
        sha256 = "14a64ebae728b3c45db6ba8bb185979c8e01fc1b0d3d1d9c01c7a2b798e8c698";
      };

      beamDeps = [ ecto geo jason ];
    };

    ecto_erd = buildMix rec {
      name = "ecto_erd";
      version = "0.6.4";

      src = fetchHex {
        pkg = "ecto_erd";
        version = "${version}";
        sha256 = "a6771fe7665db57fb07114802f76827d8ffad13d298e7d8317a68c381327743b";
      };

      beamDeps = [ ecto html_entities ];
    };

    ecto_psql_extras = buildMix rec {
      name = "ecto_psql_extras";
      version = "0.8.8";

      src = fetchHex {
        pkg = "ecto_psql_extras";
        version = "${version}";
        sha256 = "04c63d92b141723ad6fed2e60a4b461ca00b3594d16df47bbc48f1f4534f2c49";
      };

      beamDeps = [ ecto_sql postgrex table_rex ];
    };

    ecto_ranked = buildMix rec {
      name = "ecto_ranked";
      version = "0.6.1";

      src = fetchHex {
        pkg = "ecto_ranked";
        version = "${version}";
        sha256 = "39504f290103950448926637660cb91f02b936e75bb6ae307cbcf80bf487962d";
      };

      beamDeps = [ ecto_sql ];
    };

    ecto_sql = buildMix rec {
      name = "ecto_sql";
      version = "3.13.2";

      src = fetchHex {
        pkg = "ecto_sql";
        version = "${version}";
        sha256 = "539274ab0ecf1a0078a6a72ef3465629e4d6018a3028095dc90f60a19c371717";
      };

      beamDeps = [ db_connection ecto postgrex telemetry ];
    };

    ecto_vista = buildMix rec {
      name = "ecto_vista";
      version = "0.2.0";

      src = fetchHex {
        pkg = "ecto_vista";
        version = "${version}";
        sha256 = "a1beb25e78e418b6437ed1d2e3f299b1822390926e58a02954be9c4718377a12";
      };

      beamDeps = [ ecto ecto_sql postgrex ];
    };

    elbat = buildMix rec {
      name = "elbat";
      version = "0.0.6";

      src = fetchHex {
        pkg = "elbat";
        version = "${version}";
        sha256 = "74bbac013afe869123833273e5f26826fad453e17c09aeabcb7d8d0a74baf868";
      };

      beamDeps = [];
    };

    elixir_make = buildMix rec {
      name = "elixir_make";
      version = "0.9.0";

      src = fetchHex {
        pkg = "elixir_make";
        version = "${version}";
        sha256 = "db23d4fd8b757462ad02f8aa73431a426fe6671c80b200d9710caf3d1dd0ffdb";
      };

      beamDeps = [];
    };

    elixir_uuid = buildMix rec {
      name = "elixir_uuid";
      version = "1.2.1";

      src = fetchHex {
        pkg = "elixir_uuid";
        version = "${version}";
        sha256 = "f7eba2ea6c3555cea09706492716b0d87397b88946e6380898c2889d68585752";
      };

      beamDeps = [];
    };

    email_checker = buildMix rec {
      name = "email_checker";
      version = "0.2.4";

      src = fetchHex {
        pkg = "email_checker";
        version = "${version}";
        sha256 = "e4ac0e5eb035dce9c8df08ebffdb525a5d82e61dde37390ac2469222f723e50a";
      };

      beamDeps = [];
    };

    emote = buildMix rec {
      name = "emote";
      version = "0.1.1";

      src = fetchHex {
        pkg = "emote";
        version = "${version}";
        sha256 = "d11219eb76966b0f38adb5ad12eef8dc6c7bb3929cfcdcd4ce9deb2bf784a0ce";
      };

      beamDeps = [ phoenix_html ];
    };

    eqrcode = buildMix rec {
      name = "eqrcode";
      version = "0.2.1";

      src = fetchHex {
        pkg = "eqrcode";
        version = "${version}";
        sha256 = "d5828a222b904c68360e7dc2a40c3ef33a1328b7c074583898040f389f928025";
      };

      beamDeps = [];
    };

    eternal = buildMix rec {
      name = "eternal";
      version = "1.2.2";

      src = fetchHex {
        pkg = "eternal";
        version = "${version}";
        sha256 = "2c9fe32b9c3726703ba5e1d43a1d255a4f3f2d8f8f9bc19f094c7cb1a7a9e782";
      };

      beamDeps = [];
    };

    evision = buildMix rec {
      name = "evision";
      version = "0.2.14";

      src = fetchHex {
        pkg = "evision";
        version = "${version}";
        sha256 = "630714395f2c242e488944b4c9c75a5de96cbb95d3cbb69f0525bdb3e0a88775";
      };

      beamDeps = [ castore elixir_make nx ];
    };

    ex2ms = buildMix rec {
      name = "ex2ms";
      version = "1.7.0";

      src = fetchHex {
        pkg = "ex2ms";
        version = "${version}";
        sha256 = "2589eee51f81f1b1caa6d08c990b1ad409215fe6f64c73f73c67d36ed10be827";
      };

      beamDeps = [];
    };

    ex_aws = buildMix rec {
      name = "ex_aws";
      version = "2.5.11";

      src = fetchHex {
        pkg = "ex_aws";
        version = "${version}";
        sha256 = "7e16100ff93a118ef01c916d945969535cbe8d4ab6593fcf01d1cf854eb75345";
      };

      beamDeps = [ hackney jason mime req sweet_xml telemetry ];
    };

    ex_aws_s3 = buildMix rec {
      name = "ex_aws_s3";
      version = "2.5.8";

      src = fetchHex {
        pkg = "ex_aws_s3";
        version = "${version}";
        sha256 = "84e512ca2e0ae6a6c497036dff06d4493ffb422cfe476acc811d7c337c16691c";
      };

      beamDeps = [ ex_aws sweet_xml ];
    };

    ex_aws_sts = buildMix rec {
      name = "ex_aws_sts";
      version = "2.3.0";

      src = fetchHex {
        pkg = "ex_aws_sts";
        version = "${version}";
        sha256 = "f14e4c7da3454514bf253b331e9422d25825485c211896ab3b81d2a4bdbf62f5";
      };

      beamDeps = [ ex_aws ];
    };

    ex_cldr = buildMix rec {
      name = "ex_cldr";
      version = "2.43.2";

      src = fetchHex {
        pkg = "ex_cldr";
        version = "${version}";
        sha256 = "095137a7bd081166f77d23291b0649db2136ca013245cb73955fb0515031272a";
      };

      beamDeps = [ cldr_utils decimal gettext jason nimble_parsec ];
    };

    ex_cldr_calendars = buildMix rec {
      name = "ex_cldr_calendars";
      version = "2.3.1";

      src = fetchHex {
        pkg = "ex_cldr_calendars";
        version = "${version}";
        sha256 = "42d24fe2ff5316b4d2425f14aeae320886dccdf42060493d6ddfa05f518caf53";
      };

      beamDeps = [ ex_cldr_lists ex_cldr_numbers ex_cldr_units ex_doc jason ];
    };

    ex_cldr_currencies = buildMix rec {
      name = "ex_cldr_currencies";
      version = "2.16.5";

      src = fetchHex {
        pkg = "ex_cldr_currencies";
        version = "${version}";
        sha256 = "4397179028f0a7389de278afd0239771f39ba8d1984ce072bc9b715fa28f30d3";
      };

      beamDeps = [ ex_cldr jason ];
    };

    ex_cldr_dates_times = buildMix rec {
      name = "ex_cldr_dates_times";
      version = "2.24.0";

      src = fetchHex {
        pkg = "ex_cldr_dates_times";
        version = "${version}";
        sha256 = "d30ef69a4953dc987a2055c040122507695490ba7d8b88e16e28a27e40e6ff03";
      };

      beamDeps = [ ex_cldr ex_cldr_calendars ex_cldr_numbers ex_cldr_units jason ];
    };

    ex_cldr_languages = buildMix rec {
      name = "ex_cldr_languages";
      version = "0.3.3";

      src = fetchHex {
        pkg = "ex_cldr_languages";
        version = "${version}";
        sha256 = "22fb1fef72b7b4b4872d243b34e7b83734247a78ad87377986bf719089cc447a";
      };

      beamDeps = [ ex_cldr jason ];
    };

    ex_cldr_lists = buildMix rec {
      name = "ex_cldr_lists";
      version = "2.11.1";

      src = fetchHex {
        pkg = "ex_cldr_lists";
        version = "${version}";
        sha256 = "00161c04510ccb3f18b19a6b8562e50c21f1e9c15b8ff4c934bea5aad0b4ade2";
      };

      beamDeps = [ ex_cldr_numbers ex_doc jason ];
    };

    ex_cldr_locale_display = buildMix rec {
      name = "ex_cldr_locale_display";
      version = "1.6.1";

      src = fetchHex {
        pkg = "ex_cldr_locale_display";
        version = "${version}";
        sha256 = "d626c3270bc34a0792fb963777db0fa0bbf5d920767f4a6944cc8b0cc4107016";
      };

      beamDeps = [ ex_cldr ex_cldr_currencies ex_cldr_territories jason ];
    };

    ex_cldr_numbers = buildMix rec {
      name = "ex_cldr_numbers";
      version = "2.35.2";

      src = fetchHex {
        pkg = "ex_cldr_numbers";
        version = "${version}";
        sha256 = "6db5fc81a7de7efe9e9bd66fb2f436b5f82cdbf88deea38f513e8432533856dd";
      };

      beamDeps = [ decimal digital_token ex_cldr ex_cldr_currencies jason ];
    };

    ex_cldr_plugs = buildMix rec {
      name = "ex_cldr_plugs";
      version = "1.3.3";

      src = fetchHex {
        pkg = "ex_cldr_plugs";
        version = "${version}";
        sha256 = "23ebfa8d7a9991b71515c865ddf00099c9a23425767fb5dcbbca636df4aaeaab";
      };

      beamDeps = [ ex_cldr gettext jason plug ];
    };

    ex_cldr_territories = buildMix rec {
      name = "ex_cldr_territories";
      version = "2.10.0";

      src = fetchHex {
        pkg = "ex_cldr_territories";
        version = "${version}";
        sha256 = "13f084f9283f8ab1ba5bf3aead936f008341297a8291be6236efaffd1a200e95";
      };

      beamDeps = [ ex_cldr jason ];
    };

    ex_cldr_units = buildMix rec {
      name = "ex_cldr_units";
      version = "3.19.1";

      src = fetchHex {
        pkg = "ex_cldr_units";
        version = "${version}";
        sha256 = "63023b6e5c1ec159d9e50f50c2d271127a1263a2316dff5a08b7b4a0f82bf1f8";
      };

      beamDeps = [ cldr_utils decimal ex_cldr_lists ex_cldr_numbers ex_doc jason ];
    };

    ex_doc = buildMix rec {
      name = "ex_doc";
      version = "0.38.4";

      src = fetchHex {
        pkg = "ex_doc";
        version = "${version}";
        sha256 = "f7b62346408a83911c2580154e35613eb314e0278aeea72ed7fedef9c1f165b2";
      };

      beamDeps = [ earmark_parser makeup_elixir makeup_erlang makeup_html ];
    };

    ex_hash_ring = buildMix rec {
      name = "ex_hash_ring";
      version = "6.0.4";

      src = fetchHex {
        pkg = "ex_hash_ring";
        version = "${version}";
        sha256 = "89adabf31f7d3dfaa36802ce598ce918e9b5b33bae8909ac1a4d052e1e567d18";
      };

      beamDeps = [];
    };

    ex_json_schema = buildMix rec {
      name = "ex_json_schema";
      version = "0.11.1";

      src = fetchHex {
        pkg = "ex_json_schema";
        version = "${version}";
        sha256 = "32d651a575a6ce2fd613f140b0fef8dd0acc7cf8e8bcd29a3a1be5c945700dd5";
      };

      beamDeps = [ decimal ];
    };

    ex_machina = buildMix rec {
      name = "ex_machina";
      version = "2.8.0";

      src = fetchHex {
        pkg = "ex_machina";
        version = "${version}";
        sha256 = "79fe1a9c64c0c1c1fab6c4fa5d871682cb90de5885320c187d117004627a7729";
      };

      beamDeps = [ ecto ecto_sql ];
    };

    ex_marcel = buildMix rec {
      name = "ex_marcel";
      version = "0.1.0";

      src = fetchHex {
        pkg = "ex_marcel";
        version = "${version}";
        sha256 = "48dfc497435a9c52c0e90c1e07d8ce7316a095dcec0e04d182e8250e493b72fb";
      };

      beamDeps = [];
    };

    ex_unit_notifier = buildMix rec {
      name = "ex_unit_notifier";
      version = "1.3.1";

      src = fetchHex {
        pkg = "ex_unit_notifier";
        version = "${version}";
        sha256 = "87eb1cea911ed1753e1cc046cbf1c7f86af9058e30672a355f0699b41e5e119d";
      };

      beamDeps = [];
    };

    ex_unit_summary = buildMix rec {
      name = "ex_unit_summary";
      version = "0.1.0";

      src = fetchHex {
        pkg = "ex_unit_summary";
        version = "${version}";
        sha256 = "8c87d0deade3657102902251d2ec60b5b94560004ce0e2c2fa5b466232716bd6";
      };

      beamDeps = [];
    };

    excellent_migrations = buildMix rec {
      name = "excellent_migrations";
      version = "0.1.8";

      src = fetchHex {
        pkg = "excellent_migrations";
        version = "${version}";
        sha256 = "9b61cf287a8e50c5f4a7950bc684c4a2af05d40a14ffe46bd8ac522d084e5840";
      };

      beamDeps = [ credo ];
    };

    exdiff = buildMix rec {
      name = "exdiff";
      version = "0.1.5";

      src = fetchHex {
        pkg = "exdiff";
        version = "${version}";
        sha256 = "b1ccef642edc28ed3acf1b08c8dbc6e42852d18dfe51b453529588e53c733eba";
      };

      beamDeps = [];
    };

    expo = buildMix rec {
      name = "expo";
      version = "1.1.0";

      src = fetchHex {
        pkg = "expo";
        version = "${version}";
        sha256 = "fbadf93f4700fb44c331362177bdca9eeb8097e8b0ef525c9cc501cb9917c960";
      };

      beamDeps = [];
    };

    exqlite = buildMix rec {
      name = "exqlite";
      version = "0.33.0";

      src = fetchHex {
        pkg = "exqlite";
        version = "${version}";
        sha256 = "8a7c2792e567bbebb4dafe96f6397f1c527edd7039d74f508a603817fbad2844";
      };

      beamDeps = [ cc_precompiler db_connection elixir_make ];
    };

    exto = buildMix rec {
      name = "exto";
      version = "0.4.0";

      src = fetchHex {
        pkg = "exto";
        version = "${version}";
        sha256 = "447afd96c2190c861db9f6201dfb733175473347a23c0c9d3169e17686ec7fd6";
      };

      beamDeps = [ accessible ecto ];
    };

    faker = buildMix rec {
      name = "faker";
      version = "0.19.0-alpha.1";

      src = fetchHex {
        pkg = "faker";
        version = "${version}";
        sha256 = "b89d00c26712d473c6a0e2105da4dc2e3cdba14642e898a103d7271717daf0bb";
      };

      beamDeps = [ makeup makeup_elixir ];
    };

    fast_ngram = buildMix rec {
      name = "fast_ngram";
      version = "1.2.0";

      src = fetchHex {
        pkg = "fast_ngram";
        version = "${version}";
        sha256 = "90c949c5b00314d8117a5bf2fbf6a05ef945ce4cad66a47bc26f8d9ec30dc1bd";
      };

      beamDeps = [];
    };

    faviconic = buildMix rec {
      name = "faviconic";
      version = "0.2.1";

      src = fetchHex {
        pkg = "faviconic";
        version = "${version}";
        sha256 = "24f3628abd9b55d75e4f90edf6e8dfb97d0baf834345d40342232622d2094655";
      };

      beamDeps = [ floki req untangle ];
    };

    file_info = buildMix rec {
      name = "file_info";
      version = "0.0.4";

      src = fetchHex {
        pkg = "file_info";
        version = "${version}";
        sha256 = "50e7ad01c2c8b9339010675fe4dc4a113b8d6ca7eddce24d1d74fd0e762781a5";
      };

      beamDeps = [ mimetype_parser ];
    };

    file_system = buildMix rec {
      name = "file_system";
      version = "1.1.1";

      src = fetchHex {
        pkg = "file_system";
        version = "${version}";
        sha256 = "7a15ff97dfe526aeefb090a7a9d3d03aa907e100e262a0f8f7746b78f8f87a5d";
      };

      beamDeps = [];
    };

    finch = buildMix rec {
      name = "finch";
      version = "0.20.0";

      src = fetchHex {
        pkg = "finch";
        version = "${version}";
        sha256 = "2658131a74d051aabfcba936093c903b8e89da9a1b63e430bee62045fa9b2ee2";
      };

      beamDeps = [ mime mint nimble_options nimble_pool telemetry ];
    };

    fine = buildMix rec {
      name = "fine";
      version = "0.1.4";

      src = fetchHex {
        pkg = "fine";
        version = "${version}";
        sha256 = "be3324cc454a42d80951cf6023b9954e9ff27c6daa255483b3e8d608670303f5";
      };

      beamDeps = [];
    };

    floki = buildMix rec {
      name = "floki";
      version = "0.37.1";

      src = fetchHex {
        pkg = "floki";
        version = "${version}";
        sha256 = "673d040cb594d31318d514590246b6dd587ed341d3b67e17c1c0eb8ce7ca6f04";
      };

      beamDeps = [];
    };

    flow = buildMix rec {
      name = "flow";
      version = "0.15.0";

      src = fetchHex {
        pkg = "flow";
        version = "${version}";
        sha256 = "d7ecbd4dd38a188494bc996d5014ef8335f436a0b262140a1f6441ae94714581";
      };

      beamDeps = [ gen_stage ];
    };

    gen_smtp = buildRebar3 rec {
      name = "gen_smtp";
      version = "1.3.0";

      src = fetchHex {
        pkg = "gen_smtp";
        version = "${version}";
        sha256 = "0b73fbf069864ecbce02fe653b16d3f35fd889d0fdd4e14527675565c39d84e6";
      };

      beamDeps = [ ranch ];
    };

    gen_stage = buildMix rec {
      name = "gen_stage";
      version = "0.14.3";

      src = fetchHex {
        pkg = "gen_stage";
        version = "${version}";
        sha256 = "8453e2289d94c3199396eb517d65d6715ef26bcae0ee83eb5ff7a84445458d76";
      };

      beamDeps = [];
    };

    geo = buildMix rec {
      name = "geo";
      version = "4.1.0";

      src = fetchHex {
        pkg = "geo";
        version = "${version}";
        sha256 = "19edb2b3398ca9f701b573b1fb11bc90951ebd64f18b06bd1bf35abe509a2934";
      };

      beamDeps = [ jason ];
    };

    geo_postgis = buildMix rec {
      name = "geo_postgis";
      version = "3.7.1";

      src = fetchHex {
        pkg = "geo_postgis";
        version = "${version}";
        sha256 = "c20d823c600d35b7fe9ddd5be03052bb7136c57d6f1775dbd46871545e405280";
      };

      beamDeps = [ ecto geo jason poison postgrex ];
    };

    geocoder = buildMix rec {
      name = "geocoder";
      version = "2.2.2";

      src = fetchHex {
        pkg = "geocoder";
        version = "${version}";
        sha256 = "e01404586f246d95fd6affcac86b8454a442ac2d6774bf47ac67e6c79d5b9cb5";
      };

      beamDeps = [ geohash httpoison jason poolboy towel ];
    };

    geohash = buildMix rec {
      name = "geohash";
      version = "1.3.0";

      src = fetchHex {
        pkg = "geohash";
        version = "${version}";
        sha256 = "50a378ccf19fe5147ffa586ea2aa3608566bcefb5a8804ffb6eab7d4f7871403";
      };

      beamDeps = [];
    };

    gettext = buildMix rec {
      name = "gettext";
      version = "0.26.2";

      src = fetchHex {
        pkg = "gettext";
        version = "${version}";
        sha256 = "aa978504bcf76511efdc22d580ba08e2279caab1066b76bb9aa81c4a1e0a32a5";
      };

      beamDeps = [ expo ];
    };

    git_cli = buildMix rec {
      name = "git_cli";
      version = "0.3.0";

      src = fetchHex {
        pkg = "git_cli";
        version = "${version}";
        sha256 = "78cb952f4c86a41f4d3511f1d3ecb28edb268e3a7df278de2faa1bd4672eaf9b";
      };

      beamDeps = [];
    };

    git_diff = buildMix rec {
      name = "git_diff";
      version = "0.6.4";

      src = fetchHex {
        pkg = "git_diff";
        version = "${version}";
        sha256 = "9e05563c136c91e960a306fd296156b2e8d74e294ae60961e69a36e118023a5f";
      };

      beamDeps = [];
    };

    glob_ex = buildMix rec {
      name = "glob_ex";
      version = "0.1.11";

      src = fetchHex {
        pkg = "glob_ex";
        version = "${version}";
        sha256 = "342729363056e3145e61766b416769984c329e4378f1d558b63e341020525de4";
      };

      beamDeps = [];
    };

    gproc = buildRebar3 rec {
      name = "gproc";
      version = "0.9.1";

      src = fetchHex {
        pkg = "gproc";
        version = "${version}";
        sha256 = "905088e32e72127ed9466f0bac0d8e65704ca5e73ee5a62cb073c3117916d507";
      };

      beamDeps = [];
    };

    grpcbox = buildRebar3 rec {
      name = "grpcbox";
      version = "0.17.1";

      src = fetchHex {
        pkg = "grpcbox";
        version = "${version}";
        sha256 = "4a3b5d7111daabc569dc9cbd9b202a3237d81c80bf97212fbc676832cb0ceb17";
      };

      beamDeps = [ acceptor_pool chatterbox ctx gproc ];
    };

    grumble = buildMix rec {
      name = "grumble";
      version = "0.1.3";

      src = fetchHex {
        pkg = "grumble";
        version = "${version}";
        sha256 = "a7a089e5a145e072d0227012002970e85eeb52031f0d01be14c129f649283d0c";
      };

      beamDeps = [ recase ];
    };

    hackney = buildRebar3 rec {
      name = "hackney";
      version = "1.25.0";

      src = fetchHex {
        pkg = "hackney";
        version = "${version}";
        sha256 = "7209bfd75fd1f42467211ff8f59ea74d6f2a9e81cbcee95a56711ee79fd6b1d4";
      };

      beamDeps = [ certifi idna metrics mimerl parse_trans ssl_verify_fun unicode_util_compat ];
    };

    hammer = buildMix rec {
      name = "hammer";
      version = "6.2.1";

      src = fetchHex {
        pkg = "hammer";
        version = "${version}";
        sha256 = "b9476d0c13883d2dc0cc72e786bac6ac28911fba7cc2e04b70ce6a6d9c4b2bdc";
      };

      beamDeps = [ poolboy ];
    };

    hammer_plug = buildMix rec {
      name = "hammer_plug";
      version = "3.2.0";

      src = fetchHex {
        pkg = "hammer_plug";
        version = "${version}";
        sha256 = "1ee7084732414c7a32f467717d13e6fba95c60b70c3f56d51f7c08a4183aadfe";
      };

      beamDeps = [ hammer plug ];
    };

    hpack = buildRebar3 rec {
      name = "hpack";
      version = "0.3.0";

      src = fetchHex {
        pkg = "hpack_erl";
        version = "${version}";
        sha256 = "d6137d7079169d8c485c6962dfe261af5b9ef60fbc557344511c1e65e3d95fb0";
      };

      beamDeps = [];
    };

    hpax = buildMix rec {
      name = "hpax";
      version = "1.0.3";

      src = fetchHex {
        pkg = "hpax";
        version = "${version}";
        sha256 = "8eab6e1cfa8d5918c2ce4ba43588e894af35dbd8e91e6e55c817bca5847df34a";
      };

      beamDeps = [];
    };

    html_entities = buildMix rec {
      name = "html_entities";
      version = "0.5.2";

      src = fetchHex {
        pkg = "html_entities";
        version = "${version}";
        sha256 = "c53ba390403485615623b9531e97696f076ed415e8d8058b1dbaa28181f4fdcc";
      };

      beamDeps = [];
    };

    html_sanitize_ex = buildMix rec {
      name = "html_sanitize_ex";
      version = "1.4.3";

      src = fetchHex {
        pkg = "html_sanitize_ex";
        version = "${version}";
        sha256 = "87748d3c4afe949c7c6eb7150c958c2bcba43fc5b2a02686af30e636b74bccb7";
      };

      beamDeps = [ mochiweb ];
    };

    httpoison = buildMix rec {
      name = "httpoison";
      version = "2.2.3";

      src = fetchHex {
        pkg = "httpoison";
        version = "${version}";
        sha256 = "fa0f2e3646d3762fdc73edb532104c8619c7636a6997d20af4003da6cfc53e53";
      };

      beamDeps = [ hackney ];
    };

    idna = buildRebar3 rec {
      name = "idna";
      version = "6.1.1";

      src = fetchHex {
        pkg = "idna";
        version = "${version}";
        sha256 = "92376eb7894412ed19ac475e4a86f7b413c1b9fbb5bd16dccd57934157944cea";
      };

      beamDeps = [ unicode_util_compat ];
    };

    igniter = buildMix rec {
      name = "igniter";
      version = "0.6.28";

      src = fetchHex {
        pkg = "igniter";
        version = "${version}";
        sha256 = "ad9369d626aeca21079ef17661a2672fb32598610c5e5bccae2537efd36b27d4";
      };

      beamDeps = [ glob_ex jason owl req rewrite sourceror spitfire ];
    };

    image = buildMix rec {
      name = "image";
      version = "0.62.0";

      src = fetchHex {
        pkg = "image";
        version = "${version}";
        sha256 = "3c28dd98b1d14f5408b5d5c1d46258f54119468979286379033cc1efa87155ac";
      };

      beamDeps = [ evision jason nx phoenix_html plug req rustler sweet_xml vix ];
    };

    jason = buildMix rec {
      name = "jason";
      version = "1.4.4";

      src = fetchHex {
        pkg = "jason";
        version = "${version}";
        sha256 = "c5eb0cab91f094599f94d55bc63409236a8ec69a21a67814529e8d5f6cc90b3b";
      };

      beamDeps = [ decimal ];
    };

    joken = buildMix rec {
      name = "joken";
      version = "2.6.2";

      src = fetchHex {
        pkg = "joken";
        version = "${version}";
        sha256 = "5134b5b0a6e37494e46dbf9e4dad53808e5e787904b7c73972651b51cce3d72b";
      };

      beamDeps = [ jose ];
    };

    jose = buildMix rec {
      name = "jose";
      version = "1.11.10";

      src = fetchHex {
        pkg = "jose";
        version = "${version}";
        sha256 = "0d6cd36ff8ba174db29148fc112b5842186b68a90ce9fc2b3ec3afe76593e614";
      };

      beamDeps = [];
    };

    json_ptr = buildMix rec {
      name = "json_ptr";
      version = "1.2.0";

      src = fetchHex {
        pkg = "json_ptr";
        version = "${version}";
        sha256 = "e58704ac304cbf3832c0ac161e76479e7b05f75427991ddd57e19b307ae4aa05";
      };

      beamDeps = [ jason ];
    };

    json_serde = buildMix rec {
      name = "json_serde";
      version = "1.1.1";

      src = fetchHex {
        pkg = "json_serde";
        version = "${version}";
        sha256 = "0a7acdfac16efceb5337547e98418d3de083c066bbc05f3b5dd96c434d533922";
      };

      beamDeps = [ brex_result decimal jason ];
    };

    jumper = buildMix rec {
      name = "jumper";
      version = "1.0.2";

      src = fetchHex {
        pkg = "jumper";
        version = "${version}";
        sha256 = "9b7782409021e01ab3c08270e26f36eb62976a38c1aa64b2eaf6348422f165e1";
      };

      beamDeps = [];
    };

    lazy_html = buildMix rec {
      name = "lazy_html";
      version = "0.1.7";

      src = fetchHex {
        pkg = "lazy_html";
        version = "${version}";
        sha256 = "e115944e6ddb887c45cadfd660348934c318abec0341f7b7156e912b98d3eb95";
      };

      beamDeps = [ cc_precompiler elixir_make fine ];
    };

    live_debugger = buildMix rec {
      name = "live_debugger";
      version = "0.3.2";

      src = fetchHex {
        pkg = "live_debugger";
        version = "${version}";
        sha256 = "5050b37af05a2b84d429e7256a41d3612283c4c802edd23e6eeb4e0b6fc2a712";
      };

      beamDeps = [ igniter phoenix_live_view ];
    };

    live_select = buildMix rec {
      name = "live_select";
      version = "1.7.0";

      src = fetchHex {
        pkg = "live_select";
        version = "${version}";
        sha256 = "8e43c98e9adb7bc883845503b7a8388a37c23b98dfd3cd10bf310854bcf3a81c";
      };

      beamDeps = [ ecto phoenix phoenix_html phoenix_html_helpers phoenix_live_view ];
    };

    mail = buildMix rec {
      name = "mail";
      version = "0.4.4";

      src = fetchHex {
        pkg = "mail";
        version = "${version}";
        sha256 = "bd44bf3e253d8be9c7f2e59b3253aff1efc1c9fa7d8ab4430c96780683faa8e2";
      };

      beamDeps = [];
    };

    makeup = buildMix rec {
      name = "makeup";
      version = "1.2.1";

      src = fetchHex {
        pkg = "makeup";
        version = "${version}";
        sha256 = "d36484867b0bae0fea568d10131197a4c2e47056a6fbe84922bf6ba71c8d17ce";
      };

      beamDeps = [ nimble_parsec ];
    };

    makeup_diff = buildMix rec {
      name = "makeup_diff";
      version = "0.1.1";

      src = fetchHex {
        pkg = "makeup_diff";
        version = "${version}";
        sha256 = "fadb0bf014bd328badb7be986eadbce1a29955dd51c27a9e401c3045cf24184e";
      };

      beamDeps = [ makeup ];
    };

    makeup_eex = buildMix rec {
      name = "makeup_eex";
      version = "2.0.2";

      src = fetchHex {
        pkg = "makeup_eex";
        version = "${version}";
        sha256 = "30ac121dda580298ff3378324ffaec94aad5a5b67e0cc6af177c67d5f45629b9";
      };

      beamDeps = [ makeup makeup_elixir makeup_html nimble_parsec ];
    };

    makeup_elixir = buildMix rec {
      name = "makeup_elixir";
      version = "1.0.1";

      src = fetchHex {
        pkg = "makeup_elixir";
        version = "${version}";
        sha256 = "7284900d412a3e5cfd97fdaed4f5ed389b8f2b4cb49efc0eb3bd10e2febf9507";
      };

      beamDeps = [ makeup nimble_parsec ];
    };

    makeup_erlang = buildMix rec {
      name = "makeup_erlang";
      version = "1.0.2";

      src = fetchHex {
        pkg = "makeup_erlang";
        version = "${version}";
        sha256 = "af33ff7ef368d5893e4a267933e7744e46ce3cf1f61e2dccf53a111ed3aa3727";
      };

      beamDeps = [ makeup ];
    };

    makeup_graphql = buildMix rec {
      name = "makeup_graphql";
      version = "0.1.2";

      src = fetchHex {
        pkg = "makeup_graphql";
        version = "${version}";
        sha256 = "3390ab04ba388d52a94bbe64ef62aa4d7923ceaffac43ec948f58f631440e8fb";
      };

      beamDeps = [ makeup nimble_parsec ];
    };

    makeup_html = buildMix rec {
      name = "makeup_html";
      version = "0.2.0";

      src = fetchHex {
        pkg = "makeup_html";
        version = "${version}";
        sha256 = "0856f7beb9a6a642ab1307e06d990fe39f0ba58690d0b8e662aa2e027ba331b2";
      };

      beamDeps = [ makeup ];
    };

    makeup_js = buildMix rec {
      name = "makeup_js";
      version = "0.1.0";

      src = fetchHex {
        pkg = "makeup_js";
        version = "${version}";
        sha256 = "3f0c1a5eb52c9737b1679c926574e83bb260ccdedf08b58ee96cca7c685dea75";
      };

      beamDeps = [ makeup ];
    };

    makeup_json = buildMix rec {
      name = "makeup_json";
      version = "1.0.0";

      src = fetchHex {
        pkg = "makeup_json";
        version = "${version}";
        sha256 = "5c8c559e658c7f7e91b96c4b8c40f5912ea0adff44b7afe73e4639d9c3f53b94";
      };

      beamDeps = [ makeup nimble_parsec ];
    };

    makeup_sql = buildMix rec {
      name = "makeup_sql";
      version = "0.1.2";

      src = fetchHex {
        pkg = "makeup_sql";
        version = "${version}";
        sha256 = "46cda46d2857c050939d4dff9094313da79ffd7a0e0f29c76f7cb81a34cb4569";
      };

      beamDeps = [ makeup nimble_parsec ];
    };

    map_diff = buildMix rec {
      name = "map_diff";
      version = "1.3.4";

      src = fetchHex {
        pkg = "map_diff";
        version = "${version}";
        sha256 = "32fc0b8fc158683a00a58298440b8cb884e7e779f9459e598df61d022b5412e9";
      };

      beamDeps = [];
    };

    match_spec = buildMix rec {
      name = "match_spec";
      version = "0.3.3";

      src = fetchHex {
        pkg = "match_spec";
        version = "${version}";
        sha256 = "8c82719667c68be4acd24c03ab2f3351eb89a46f47ebd02ad7b80f3ce6365fb2";
      };

      beamDeps = [];
    };

    mdex = buildMix rec {
      name = "mdex";
      version = "0.8.4";

      src = fetchHex {
        pkg = "mdex";
        version = "${version}";
        sha256 = "7854a147557f725356f8774d43fea01ed44fe1bb6dee2247bfd19568c6e97048";
      };

      beamDeps = [ autumn jason nimble_options rustler rustler_precompiled ];
    };

    meck = buildRebar3 rec {
      name = "meck";
      version = "0.9.2";

      src = fetchHex {
        pkg = "meck";
        version = "${version}";
        sha256 = "81344f561357dc40a8344afa53767c32669153355b626ea9fcbc8da6b3045826";
      };

      beamDeps = [];
    };

    meilisearch_ex = buildMix rec {
      name = "meilisearch_ex";
      version = "1.2.2";

      src = fetchHex {
        pkg = "meilisearch_ex";
        version = "${version}";
        sha256 = "f87769390877c5fc7b0698c42e8508dd6e15fe03c0cb055f9acc2ac5b38618f3";
      };

      beamDeps = [ ecto jason tesla typed_ecto_schema ];
    };

    memoize = buildMix rec {
      name = "memoize";
      version = "1.4.3";

      src = fetchHex {
        pkg = "memoize";
        version = "${version}";
        sha256 = "a75176b84b9ce92faaf567c82fcbc584ef95727e0827cb38606b0a197f7e47ef";
      };

      beamDeps = [];
    };

    metrics = buildRebar3 rec {
      name = "metrics";
      version = "1.0.1";

      src = fetchHex {
        pkg = "metrics";
        version = "${version}";
        sha256 = "69b09adddc4f74a40716ae54d140f93beb0fb8978d8636eaded0c31b6f099f16";
      };

      beamDeps = [];
    };

    mime = buildMix rec {
      name = "mime";
      version = "2.0.7";

      src = fetchHex {
        pkg = "mime";
        version = "${version}";
        sha256 = "6171188e399ee16023ffc5b76ce445eb6d9672e2e241d2df6050f3c771e80ccd";
      };

      beamDeps = [];
    };

    mimerl = buildRebar3 rec {
      name = "mimerl";
      version = "1.4.0";

      src = fetchHex {
        pkg = "mimerl";
        version = "${version}";
        sha256 = "13af15f9f68c65884ecca3a3891d50a7b57d82152792f3e19d88650aa126b144";
      };

      beamDeps = [];
    };

    mimetype_parser = buildMix rec {
      name = "mimetype_parser";
      version = "0.1.3";

      src = fetchHex {
        pkg = "mimetype_parser";
        version = "${version}";
        sha256 = "7d8f80c567807ce78cd93c938e7f4b0a20b1aaaaab914bf286f68457d9f7a852";
      };

      beamDeps = [];
    };

    mint = buildMix rec {
      name = "mint";
      version = "1.7.1";

      src = fetchHex {
        pkg = "mint";
        version = "${version}";
        sha256 = "fceba0a4d0f24301ddee3024ae116df1c3f4bb7a563a731f45fdfeb9d39a231b";
      };

      beamDeps = [ castore hpax ];
    };

    mix_test_interactive = buildMix rec {
      name = "mix_test_interactive";
      version = "5.0.0";

      src = fetchHex {
        pkg = "mix_test_interactive";
        version = "${version}";
        sha256 = "8c721001810620d146b15f0e309737edfcaee957638912788788f7d10814f894";
      };

      beamDeps = [ file_system process_tree typed_struct ];
    };

    mix_test_watch = buildMix rec {
      name = "mix_test_watch";
      version = "1.3.0";

      src = fetchHex {
        pkg = "mix_test_watch";
        version = "${version}";
        sha256 = "f9e5edca976857ffac78632e635750d158df14ee2d6185a15013844af7570ffe";
      };

      beamDeps = [ file_system ];
    };

    mjml = buildMix rec {
      name = "mjml";
      version = "5.2.0";

      src = fetchHex {
        pkg = "mjml";
        version = "${version}";
        sha256 = "bf39d2e0041f1f08afd07694239be39a8c173b00649e3463c2bd959473092c2a";
      };

      beamDeps = [ rustler rustler_precompiled ];
    };

    mneme = buildMix rec {
      name = "mneme";
      version = "0.10.2";

      src = fetchHex {
        pkg = "mneme";
        version = "${version}";
        sha256 = "3b9493fc114c4bb0f6232e021620ffd7944819b9b9105a5b286b6dc907f7720a";
      };

      beamDeps = [ file_system igniter nimble_options owl rewrite sourceror text_diff ];
    };

    mochiweb = buildRebar3 rec {
      name = "mochiweb";
      version = "3.2.2";

      src = fetchHex {
        pkg = "mochiweb";
        version = "${version}";
        sha256 = "4114e51f1b44c270b3242d91294fe174ce1ed989100e8b65a1fab58e0cba41d5";
      };

      beamDeps = [];
    };

    mock = buildMix rec {
      name = "mock";
      version = "0.3.9";

      src = fetchHex {
        pkg = "mock";
        version = "${version}";
        sha256 = "9e1b244c4ca2551bb17bb8415eed89e40ee1308e0fbaed0a4fdfe3ec8a4adbd3";
      };

      beamDeps = [ meck ];
    };

    mogrify = buildMix rec {
      name = "mogrify";
      version = "0.9.3";

      src = fetchHex {
        pkg = "mogrify";
        version = "${version}";
        sha256 = "0189b1e1de27455f2b9ae8cf88239cefd23d38de9276eb5add7159aea51731e6";
      };

      beamDeps = [];
    };

    mox = buildMix rec {
      name = "mox";
      version = "1.2.0";

      src = fetchHex {
        pkg = "mox";
        version = "${version}";
        sha256 = "c7b92b3cc69ee24a7eeeaf944cd7be22013c52fcb580c1f33f50845ec821089a";
      };

      beamDeps = [ nimble_ownership ];
    };

    mua = buildMix rec {
      name = "mua";
      version = "0.2.5";

      src = fetchHex {
        pkg = "mua";
        version = "${version}";
        sha256 = "0e2b18024d0db8943a68e84fb5e2253d3225c8f61d8387cbfc581d66e34d8493";
      };

      beamDeps = [ castore ];
    };

    nebulex = buildMix rec {
      name = "nebulex";
      version = "2.6.5";

      src = fetchHex {
        pkg = "nebulex";
        version = "${version}";
        sha256 = "4eb4092058ba53289cb4d5a1b109de6fd094883dfc84a1c2f2ccc57e61a24935";
      };

      beamDeps = [ decorator shards telemetry ];
    };

    neuron = buildMix rec {
      name = "neuron";
      version = "5.1.0";

      src = fetchHex {
        pkg = "neuron";
        version = "${version}";
        sha256 = "23cddb0e0dd9c0eea247bc5b4bc3e1f8b52dbaf63f1637623920ec0b2385b6ce";
      };

      beamDeps = [ httpoison jason ];
    };

    nimble_csv = buildMix rec {
      name = "nimble_csv";
      version = "1.3.0";

      src = fetchHex {
        pkg = "nimble_csv";
        version = "${version}";
        sha256 = "41ccdc18f7c8f8bb06e84164fc51635321e80d5a3b450761c4997d620925d619";
      };

      beamDeps = [];
    };

    nimble_options = buildMix rec {
      name = "nimble_options";
      version = "1.1.1";

      src = fetchHex {
        pkg = "nimble_options";
        version = "${version}";
        sha256 = "821b2470ca9442c4b6984882fe9bb0389371b8ddec4d45a9504f00a66f650b44";
      };

      beamDeps = [];
    };

    nimble_ownership = buildMix rec {
      name = "nimble_ownership";
      version = "1.0.1";

      src = fetchHex {
        pkg = "nimble_ownership";
        version = "${version}";
        sha256 = "3825e461025464f519f3f3e4a1f9b68c47dc151369611629ad08b636b73bb22d";
      };

      beamDeps = [];
    };

    nimble_parsec = buildMix rec {
      name = "nimble_parsec";
      version = "1.4.2";

      src = fetchHex {
        pkg = "nimble_parsec";
        version = "${version}";
        sha256 = "4b21398942dda052b403bbe1da991ccd03a053668d147d53fb8c4e0efe09c973";
      };

      beamDeps = [];
    };

    nimble_pool = buildMix rec {
      name = "nimble_pool";
      version = "1.1.0";

      src = fetchHex {
        pkg = "nimble_pool";
        version = "${version}";
        sha256 = "af2e4e6b34197db81f7aad230c1118eac993acc0dae6bc83bac0126d4ae0813a";
      };

      beamDeps = [];
    };

    nx = buildMix rec {
      name = "nx";
      version = "0.10.0";

      src = fetchHex {
        pkg = "nx";
        version = "${version}";
        sha256 = "3db8892c124aeee091df0e6fbf8e5bf1b81f502eb0d4f5ba63e6378ebcae7da4";
      };

      beamDeps = [ complex telemetry ];
    };

    oban = buildMix rec {
      name = "oban";
      version = "2.20.1";

      src = fetchHex {
        pkg = "oban";
        version = "${version}";
        sha256 = "17a45277dbeb41a455040b41dd8c467163fad685d1366f2f59207def3bcdd1d8";
      };

      beamDeps = [ ecto_sql igniter jason postgrex telemetry ];
    };

    oban_met = buildMix rec {
      name = "oban_met";
      version = "1.0.3";

      src = fetchHex {
        pkg = "oban_met";
        version = "${version}";
        sha256 = "23db1a0ee58b93afe324b221530594bdf3647a9bd4e803af762c3e00ad74b9cf";
      };

      beamDeps = [ oban ];
    };

    oban_web = buildMix rec {
      name = "oban_web";
      version = "2.11.4";

      src = fetchHex {
        pkg = "oban_web";
        version = "${version}";
        sha256 = "deb38825311f53cee5fc89c3ea78e0a2a60095b63643517649f76fb5563031db";
      };

      beamDeps = [ jason oban oban_met phoenix phoenix_html phoenix_live_view phoenix_pubsub ];
    };

    observer_cli = buildMix rec {
      name = "observer_cli";
      version = "1.8.4";

      src = fetchHex {
        pkg = "observer_cli";
        version = "${version}";
        sha256 = "0fcd71ac723bcd2d91266d99b3c3ccd9465c71c9f392d900cea8effdc1a1485c";
      };

      beamDeps = [ recon ];
    };

    openid_connect = buildMix rec {
      name = "openid_connect";
      version = "1.0.0";

      src = fetchHex {
        pkg = "openid_connect";
        version = "${version}";
        sha256 = "1abc2009fad37321996b64ac4b36d8113b309b697707c0774ed6d3dbad9a5005";
      };

      beamDeps = [ finch jason jose ];
    };

    opentelemetry = buildRebar3 rec {
      name = "opentelemetry";
      version = "1.5.1";

      src = fetchHex {
        pkg = "opentelemetry";
        version = "${version}";
        sha256 = "27c6775b2b609bb28bd9c1c0cb2dee907bfed2e31fcf0afd9b8e3fad27ef1382";
      };

      beamDeps = [ opentelemetry_api ];
    };

    opentelemetry_api = buildMix rec {
      name = "opentelemetry_api";
      version = "1.4.1";

      src = fetchHex {
        pkg = "opentelemetry_api";
        version = "${version}";
        sha256 = "39bdb6ad740bc13b16215cb9f233d66796bbae897f3bf6eb77abb712e87c3c26";
      };

      beamDeps = [];
    };

    opentelemetry_exporter = buildRebar3 rec {
      name = "opentelemetry_exporter";
      version = "1.8.1";

      src = fetchHex {
        pkg = "opentelemetry_exporter";
        version = "${version}";
        sha256 = "0a64b2889aa87f38f0b3afcebe1f0a50c52b7e956fe6e535668741561c753e97";
      };

      beamDeps = [ grpcbox opentelemetry opentelemetry_api tls_certificate_check ];
    };

    opentelemetry_process_propagator = buildMix rec {
      name = "opentelemetry_process_propagator";
      version = "0.3.0";

      src = fetchHex {
        pkg = "opentelemetry_process_propagator";
        version = "${version}";
        sha256 = "7243cb6de1523c473cba5b1aefa3f85e1ff8cc75d08f367104c1e11919c8c029";
      };

      beamDeps = [ opentelemetry_api ];
    };

    opentelemetry_semantic_conventions = buildMix rec {
      name = "opentelemetry_semantic_conventions";
      version = "1.27.0";

      src = fetchHex {
        pkg = "opentelemetry_semantic_conventions";
        version = "${version}";
        sha256 = "9681ccaa24fd3d810b4461581717661fd85ff7019b082c2dff89c7d5b1fc2864";
      };

      beamDeps = [];
    };

    orion = buildMix rec {
      name = "orion";
      version = "1.0.7";

      src = fetchHex {
        pkg = "orion";
        version = "${version}";
        sha256 = "e8096ac94d684c0b80d3fbeb704243bb4b349831755bbe145f7814bba186aab4";
      };

      beamDeps = [ dog_sketch jason orion_collector phoenix_html_helpers phoenix_live_view ];
    };

    orion_collector = buildMix rec {
      name = "orion_collector";
      version = "1.2.0";

      src = fetchHex {
        pkg = "orion_collector";
        version = "${version}";
        sha256 = "f6eb4687123c5845da2bb82002babdaf87ccb8ddb3762cde304aa09f24832422";
      };

      beamDeps = [ dog_sketch ex2ms ];
    };

    owl = buildMix rec {
      name = "owl";
      version = "0.13.0";

      src = fetchHex {
        pkg = "owl";
        version = "${version}";
        sha256 = "59bf9d11ce37a4db98f57cb68fbfd61593bf419ec4ed302852b6683d3d2f7475";
      };

      beamDeps = [];
    };

    pane = buildMix rec {
      name = "pane";
      version = "0.5.0";

      src = fetchHex {
        pkg = "pane";
        version = "${version}";
        sha256 = "71ad875092bff3c249195881a56df836ca5f9f2dcd668a21dd2b1b5d9549b7b9";
      };

      beamDeps = [];
    };

    parse_trans = buildRebar3 rec {
      name = "parse_trans";
      version = "3.4.1";

      src = fetchHex {
        pkg = "parse_trans";
        version = "${version}";
        sha256 = "620a406ce75dada827b82e453c19cf06776be266f5a67cff34e1ef2cbb60e49a";
      };

      beamDeps = [];
    };

    patch = buildMix rec {
      name = "patch";
      version = "0.15.0";

      src = fetchHex {
        pkg = "patch";
        version = "${version}";
        sha256 = "e8dadf9b57b30e92f6b2b1ce2f7f57700d14c66d4ed56ee27777eb73fb77e58d";
      };

      beamDeps = [];
    };

    pathex = buildMix rec {
      name = "pathex";
      version = "2.6.1";

      src = fetchHex {
        pkg = "pathex";
        version = "${version}";
        sha256 = "159f8e4b5fa2eaa887777070f7a5d3006601f7085efb4d76c0cef0f2ec9c4be9";
      };

      beamDeps = [];
    };

    pbkdf2_elixir = buildMix rec {
      name = "pbkdf2_elixir";
      version = "2.3.1";

      src = fetchHex {
        pkg = "pbkdf2_elixir";
        version = "${version}";
        sha256 = "ab4da7db8aeb2db20e02a1d416cbb46d0690658aafb4396878acef8748c9c319";
      };

      beamDeps = [ comeonin ];
    };

    periscope = buildMix rec {
      name = "periscope";
      version = "0.7.0";

      src = fetchHex {
        pkg = "periscope";
        version = "${version}";
        sha256 = "4be52f4adef8f60051b9d362453a387f3b0a2e57601a33061c7e3d586feccaaa";
      };

      beamDeps = [];
    };

    phoenix = buildMix rec {
      name = "phoenix";
      version = "1.8.1";

      src = fetchHex {
        pkg = "phoenix";
        version = "${version}";
        sha256 = "84d77d2b2e77c3c7e7527099bd01ef5c8560cd149c036d6b3a40745f11cd2fb2";
      };

      beamDeps = [ bandit jason phoenix_pubsub phoenix_template phoenix_view plug plug_cowboy plug_crypto telemetry websock_adapter ];
    };

    phoenix_ecto = buildMix rec {
      name = "phoenix_ecto";
      version = "4.6.5";

      src = fetchHex {
        pkg = "phoenix_ecto";
        version = "${version}";
        sha256 = "26ec3208eef407f31b748cadd044045c6fd485fbff168e35963d2f9dfff28d4b";
      };

      beamDeps = [ ecto phoenix_html plug postgrex ];
    };

    phoenix_html = buildMix rec {
      name = "phoenix_html";
      version = "4.2.1";

      src = fetchHex {
        pkg = "phoenix_html";
        version = "${version}";
        sha256 = "cff108100ae2715dd959ae8f2a8cef8e20b593f8dfd031c9cba92702cf23e053";
      };

      beamDeps = [];
    };

    phoenix_html_helpers = buildMix rec {
      name = "phoenix_html_helpers";
      version = "1.0.1";

      src = fetchHex {
        pkg = "phoenix_html_helpers";
        version = "${version}";
        sha256 = "cffd2385d1fa4f78b04432df69ab8da63dc5cf63e07b713a4dcf36a3740e3090";
      };

      beamDeps = [ phoenix_html plug ];
    };

    phoenix_live_dashboard = buildMix rec {
      name = "phoenix_live_dashboard";
      version = "0.8.7";

      src = fetchHex {
        pkg = "phoenix_live_dashboard";
        version = "${version}";
        sha256 = "3a8625cab39ec261d48a13b7468dc619c0ede099601b084e343968309bd4d7d7";
      };

      beamDeps = [ ecto ecto_psql_extras mime phoenix_live_view telemetry_metrics ];
    };

    phoenix_live_favicon = buildMix rec {
      name = "phoenix_live_favicon";
      version = "0.2.0";

      src = fetchHex {
        pkg = "phoenix_live_favicon";
        version = "${version}";
        sha256 = "136121d68b30f9344214d37feebf88ee63f1a1948a33251ac80c706cfa7da79e";
      };

      beamDeps = [ phoenix_live_head ];
    };

    phoenix_live_head = buildMix rec {
      name = "phoenix_live_head";
      version = "0.2.2";

      src = fetchHex {
        pkg = "phoenix_live_head";
        version = "${version}";
        sha256 = "fdfe3dc85499f7cc277b8d2c973fb50fbde9748cc56664fbe7b9ada8712dba19";
      };

      beamDeps = [ ex_doc jason phoenix phoenix_html phoenix_live_view ];
    };

    phoenix_live_reload = buildMix rec {
      name = "phoenix_live_reload";
      version = "1.6.1";

      src = fetchHex {
        pkg = "phoenix_live_reload";
        version = "${version}";
        sha256 = "74273843d5a6e4fef0bbc17599f33e3ec63f08e69215623a0cd91eea4288e5a0";
      };

      beamDeps = [ file_system phoenix ];
    };

    phoenix_live_view = buildMix rec {
      name = "phoenix_live_view";
      version = "1.1.11";

      src = fetchHex {
        pkg = "phoenix_live_view";
        version = "${version}";
        sha256 = "266823602e11a54e562ac03a25b3d232d79de12514262db7cfcbb83fdfd8fd57";
      };

      beamDeps = [ igniter jason lazy_html phoenix phoenix_html phoenix_template phoenix_view plug telemetry ];
    };

    phoenix_pubsub = buildMix rec {
      name = "phoenix_pubsub";
      version = "2.1.3";

      src = fetchHex {
        pkg = "phoenix_pubsub";
        version = "${version}";
        sha256 = "bba06bc1dcfd8cb086759f0edc94a8ba2bc8896d5331a1e2c2902bf8e36ee502";
      };

      beamDeps = [];
    };

    phoenix_seo = buildMix rec {
      name = "phoenix_seo";
      version = "0.1.11";

      src = fetchHex {
        pkg = "phoenix_seo";
        version = "${version}";
        sha256 = "4cafd9bbe471306dff7905482b7f9c50698790fdb80a2f1e24b2f0dbca7af448";
      };

      beamDeps = [ phoenix_live_view ];
    };

    phoenix_template = buildMix rec {
      name = "phoenix_template";
      version = "1.0.4";

      src = fetchHex {
        pkg = "phoenix_template";
        version = "${version}";
        sha256 = "2c0c81f0e5c6753faf5cca2f229c9709919aba34fab866d3bc05060c9c444206";
      };

      beamDeps = [ phoenix_html ];
    };

    phoenix_test = buildMix rec {
      name = "phoenix_test";
      version = "0.7.1";

      src = fetchHex {
        pkg = "phoenix_test";
        version = "${version}";
        sha256 = "e5de115d48f22af9d9e9a31ffcf063407adf07163a20abb02d61180975f46622";
      };

      beamDeps = [ floki jason mime phoenix phoenix_live_view ];
    };

    phoenix_view = buildMix rec {
      name = "phoenix_view";
      version = "2.0.4";

      src = fetchHex {
        pkg = "phoenix_view";
        version = "${version}";
        sha256 = "4e992022ce14f31fe57335db27a28154afcc94e9983266835bb3040243eb620b";
      };

      beamDeps = [ phoenix_html phoenix_template ];
    };

    plug = buildMix rec {
      name = "plug";
      version = "1.18.1";

      src = fetchHex {
        pkg = "plug";
        version = "${version}";
        sha256 = "57a57db70df2b422b564437d2d33cf8d33cd16339c1edb190cd11b1a3a546cc2";
      };

      beamDeps = [ mime plug_crypto telemetry ];
    };

    plug_attack = buildMix rec {
      name = "plug_attack";
      version = "0.4.3";

      src = fetchHex {
        pkg = "plug_attack";
        version = "${version}";
        sha256 = "9ed6fb8a6f613a36040f2875130a21187126c5625092f24bc851f7f12a8cbdc1";
      };

      beamDeps = [ plug ];
    };

    plug_cowboy = buildMix rec {
      name = "plug_cowboy";
      version = "2.7.4";

      src = fetchHex {
        pkg = "plug_cowboy";
        version = "${version}";
        sha256 = "9b85632bd7012615bae0a5d70084deb1b25d2bcbb32cab82d1e9a1e023168aa3";
      };

      beamDeps = [ cowboy cowboy_telemetry plug ];
    };

    plug_crypto = buildMix rec {
      name = "plug_crypto";
      version = "2.1.1";

      src = fetchHex {
        pkg = "plug_crypto";
        version = "${version}";
        sha256 = "6470bce6ffe41c8bd497612ffde1a7e4af67f36a15eea5f921af71cf3e11247c";
      };

      beamDeps = [];
    };

    plug_early_hints = buildMix rec {
      name = "plug_early_hints";
      version = "0.1.0";

      src = fetchHex {
        pkg = "plug_early_hints";
        version = "${version}";
        sha256 = "f4167b2daecbe39af40718fe0907899f34ef9f19ea11fb184a4732b18dc70e3c";
      };

      beamDeps = [ plug ];
    };

    poison = buildMix rec {
      name = "poison";
      version = "6.0.0";

      src = fetchHex {
        pkg = "poison";
        version = "${version}";
        sha256 = "bb9064632b94775a3964642d6a78281c07b7be1319e0016e1643790704e739a2";
      };

      beamDeps = [ decimal ];
    };

    poolboy = buildRebar3 rec {
      name = "poolboy";
      version = "1.5.2";

      src = fetchHex {
        pkg = "poolboy";
        version = "${version}";
        sha256 = "dad79704ce5440f3d5a3681c8590b9dc25d1a561e8f5a9c995281012860901e3";
      };

      beamDeps = [];
    };

    postgrex = buildMix rec {
      name = "postgrex";
      version = "0.20.0";

      src = fetchHex {
        pkg = "postgrex";
        version = "${version}";
        sha256 = "d36ef8b36f323d29505314f704e21a1a038e2dc387c6409ee0cd24144e187c0f";
      };

      beamDeps = [ db_connection decimal jason ];
    };

    process_tree = buildMix rec {
      name = "process_tree";
      version = "0.2.1";

      src = fetchHex {
        pkg = "process_tree";
        version = "${version}";
        sha256 = "68eee6bf0514351aeeda7037f1a6003c0e25de48fe6b7d15a1b0aebb4b35e713";
      };

      beamDeps = [];
    };

    puid = buildMix rec {
      name = "puid";
      version = "1.1.2";

      src = fetchHex {
        pkg = "puid";
        version = "${version}";
        sha256 = "fbd1691e29e576c4fbf23852f4d256774702ad1f2a91b37e4344f7c278f1ffaa";
      };

      beamDeps = [ crypto_rand ];
    };

    ranch = buildRebar3 rec {
      name = "ranch";
      version = "1.8.1";

      src = fetchHex {
        pkg = "ranch";
        version = "${version}";
        sha256 = "aed58910f4e21deea992a67bf51632b6d60114895eb03bb392bb733064594dd0";
      };

      beamDeps = [];
    };

    recase = buildMix rec {
      name = "recase";
      version = "0.9.0";

      src = fetchHex {
        pkg = "recase";
        version = "${version}";
        sha256 = "efa7549ebd128988d1723037a6f6a61948055aec107db6288f1c52830cb6501c";
      };

      beamDeps = [];
    };

    recon = buildMix rec {
      name = "recon";
      version = "2.5.6";

      src = fetchHex {
        pkg = "recon";
        version = "${version}";
        sha256 = "96c6799792d735cc0f0fd0f86267e9d351e63339cbe03df9d162010cefc26bb0";
      };

      beamDeps = [];
    };

    redirect = buildMix rec {
      name = "redirect";
      version = "0.4.0";

      src = fetchHex {
        pkg = "redirect";
        version = "${version}";
        sha256 = "dfa29a8ecbad066ed0b73b34611cf24c78101719737f37bdf750f39197d67b97";
      };

      beamDeps = [ phoenix plug ];
    };

    remote_ip = buildMix rec {
      name = "remote_ip";
      version = "1.2.0";

      src = fetchHex {
        pkg = "remote_ip";
        version = "${version}";
        sha256 = "2ff91de19c48149ce19ed230a81d377186e4412552a597d6a5137373e5877cb7";
      };

      beamDeps = [ combine plug ];
    };

    repatch = buildMix rec {
      name = "repatch";
      version = "1.6.1";

      src = fetchHex {
        pkg = "repatch";
        version = "${version}";
        sha256 = "486f80b503fad097ae9ff33f3c7ad3a24c2bad85e694d76ff214e15d13cf9d25";
      };

      beamDeps = [ ex2ms ];
    };

    req = buildMix rec {
      name = "req";
      version = "0.5.15";

      src = fetchHex {
        pkg = "req";
        version = "${version}";
        sha256 = "a6513a35fad65467893ced9785457e91693352c70b58bbc045b47e5eb2ef0c53";
      };

      beamDeps = [ finch jason mime nimble_csv plug ];
    };

    rewrite = buildMix rec {
      name = "rewrite";
      version = "1.1.2";

      src = fetchHex {
        pkg = "rewrite";
        version = "${version}";
        sha256 = "7f8b94b1e3528d0a47b3e8b7bfeca559d2948a65fa7418a9ad7d7712703d39d4";
      };

      beamDeps = [ glob_ex sourceror text_diff ];
    };

    rustler = buildMix rec {
      name = "rustler";
      version = "0.37.1";

      src = fetchHex {
        pkg = "rustler";
        version = "${version}";
        sha256 = "24547e9b8640cf00e6a2071acb710f3e12ce0346692e45098d84d45cdb54fd79";
      };

      beamDeps = [ jason ];
    };

    rustler_precompiled = buildMix rec {
      name = "rustler_precompiled";
      version = "0.8.3";

      src = fetchHex {
        pkg = "rustler_precompiled";
        version = "${version}";
        sha256 = "c23f5f33cb6608542de4d04faf0f0291458c352a4648e4d28d17ee1098cddcc4";
      };

      beamDeps = [ castore rustler ];
    };

    scribe = buildMix rec {
      name = "scribe";
      version = "0.11.0";

      src = fetchHex {
        pkg = "scribe";
        version = "${version}";
        sha256 = "fff15704b6a400125b4200b0bc052e589e831092991140ddb178cc0deb0e7885";
      };

      beamDeps = [ pane ];
    };

    secure_random = buildMix rec {
      name = "secure_random";
      version = "0.5.1";

      src = fetchHex {
        pkg = "secure_random";
        version = "${version}";
        sha256 = "1b9754f15e3940a143baafd19da12293f100044df69ea12db5d72878312ae6ab";
      };

      beamDeps = [];
    };

    sentry = buildMix rec {
      name = "sentry";
      version = "11.0.3";

      src = fetchHex {
        pkg = "sentry";
        version = "${version}";
        sha256 = "a73d405b50fc619b3d65a8f87caae044d6794e2233e56b0cb1c1ea331a9bec94";
      };

      beamDeps = [ hackney igniter jason nimble_options nimble_ownership opentelemetry opentelemetry_api opentelemetry_exporter opentelemetry_semantic_conventions phoenix phoenix_live_view plug telemetry ];
    };

    shards = buildRebar3 rec {
      name = "shards";
      version = "1.1.1";

      src = fetchHex {
        pkg = "shards";
        version = "${version}";
        sha256 = "169a045dae6668cda15fbf86d31bf433d0dbbaec42c8c23ca4f8f2d405ea8eda";
      };

      beamDeps = [];
    };

    simple_slug = buildMix rec {
      name = "simple_slug";
      version = "0.1.1";

      src = fetchHex {
        pkg = "simple_slug";
        version = "${version}";
        sha256 = "477c19c7bc8755a1378bdd4ec591e4819071c72353b7e470b90329e63ef67a72";
      };

      beamDeps = [];
    };

    sizeable = buildMix rec {
      name = "sizeable";
      version = "1.0.2";

      src = fetchHex {
        pkg = "sizeable";
        version = "${version}";
        sha256 = "4bab548e6dfba777b400ca50830a9e3a4128e73df77ab1582540cf5860601762";
      };

      beamDeps = [];
    };

    sleeplocks = buildRebar3 rec {
      name = "sleeplocks";
      version = "1.1.3";

      src = fetchHex {
        pkg = "sleeplocks";
        version = "${version}";
        sha256 = "d3b3958552e6eb16f463921e70ae7c767519ef8f5be46d7696cc1ed649421321";
      };

      beamDeps = [];
    };

    sobelow = buildMix rec {
      name = "sobelow";
      version = "0.14.0";

      src = fetchHex {
        pkg = "sobelow";
        version = "${version}";
        sha256 = "7ecf91e298acfd9b24f5d761f19e8f6e6ac585b9387fb6301023f1f2cd5eed5f";
      };

      beamDeps = [ jason ];
    };

    solid = buildMix rec {
      name = "solid";
      version = "0.18.0";

      src = fetchHex {
        pkg = "solid";
        version = "${version}";
        sha256 = "7704681c11c880308fe1337acf7690083f884076b612d38b7dccb5a1bd016068";
      };

      beamDeps = [ nimble_parsec ];
    };

    sourceror = buildMix rec {
      name = "sourceror";
      version = "1.6.0";

      src = fetchHex {
        pkg = "sourceror";
        version = "${version}";
        sha256 = "e90aef8c82dacf32c89c8ef83d1416fc343cd3e5556773eeffd2c1e3f991f699";
      };

      beamDeps = [];
    };

    spitfire = buildMix rec {
      name = "spitfire";
      version = "0.2.1";

      src = fetchHex {
        pkg = "spitfire";
        version = "${version}";
        sha256 = "6eeed75054a38341b2e1814d41bb0a250564092358de2669fdb57ff88141d91b";
      };

      beamDeps = [];
    };

    ssl_verify_fun = buildRebar3 rec {
      name = "ssl_verify_fun";
      version = "1.1.7";

      src = fetchHex {
        pkg = "ssl_verify_fun";
        version = "${version}";
        sha256 = "fe4c190e8f37401d30167c8c405eda19469f34577987c76dde613e838bbc67f8";
      };

      beamDeps = [];
    };

    statistex = buildMix rec {
      name = "statistex";
      version = "1.1.0";

      src = fetchHex {
        pkg = "statistex";
        version = "${version}";
        sha256 = "f5950ea26ad43246ba2cce54324ac394a4e7408fdcf98b8e230f503a0cba9cf5";
      };

      beamDeps = [];
    };

    surface = buildMix rec {
      name = "surface";
      version = "0.12.1";

      src = fetchHex {
        pkg = "surface";
        version = "${version}";
        sha256 = "133242252537f9c41533388607301f3d01755a338482e4288f42343dc20cd413";
      };

      beamDeps = [ phoenix_live_view sourceror ];
    };

    surface_form_helpers = buildMix rec {
      name = "surface_form_helpers";
      version = "0.2.0";

      src = fetchHex {
        pkg = "surface_form_helpers";
        version = "${version}";
        sha256 = "3491b2c5e5e2f6f1d004bd989557d8df750bf48cc4660671c31b8b07c44dfc22";
      };

      beamDeps = [ phoenix_html phoenix_html_helpers surface ];
    };

    sweet_xml = buildMix rec {
      name = "sweet_xml";
      version = "0.7.5";

      src = fetchHex {
        pkg = "sweet_xml";
        version = "${version}";
        sha256 = "193b28a9b12891cae351d81a0cead165ffe67df1b73fe5866d10629f4faefb12";
      };

      beamDeps = [];
    };

    swoosh = buildMix rec {
      name = "swoosh";
      version = "1.19.5";

      src = fetchHex {
        pkg = "swoosh";
        version = "${version}";
        sha256 = "c953f51ee0a8b237e0f4307c9cefd3eb1eb751c35fcdda2a8bccb991766473be";
      };

      beamDeps = [ bandit cowboy ex_aws finch gen_smtp hackney jason mail mime mua plug plug_cowboy req telemetry ];
    };

    table_rex = buildMix rec {
      name = "table_rex";
      version = "3.1.1";

      src = fetchHex {
        pkg = "table_rex";
        version = "${version}";
        sha256 = "678a23aba4d670419c23c17790f9dcd635a4a89022040df7d5d772cb21012490";
      };

      beamDeps = [];
    };

    telemetry = buildRebar3 rec {
      name = "telemetry";
      version = "1.3.0";

      src = fetchHex {
        pkg = "telemetry";
        version = "${version}";
        sha256 = "7015fc8919dbe63764f4b4b87a95b7c0996bd539e0d499be6ec9d7f3875b79e6";
      };

      beamDeps = [];
    };

    telemetry_metrics = buildMix rec {
      name = "telemetry_metrics";
      version = "1.1.0";

      src = fetchHex {
        pkg = "telemetry_metrics";
        version = "${version}";
        sha256 = "e7b79e8ddfde70adb6db8a6623d1778ec66401f366e9a8f5dd0955c56bc8ce67";
      };

      beamDeps = [ telemetry ];
    };

    telemetry_poller = buildRebar3 rec {
      name = "telemetry_poller";
      version = "1.3.0";

      src = fetchHex {
        pkg = "telemetry_poller";
        version = "${version}";
        sha256 = "51f18bed7128544a50f75897db9974436ea9bfba560420b646af27a9a9b35211";
      };

      beamDeps = [ telemetry ];
    };

    temp = buildMix rec {
      name = "temp";
      version = "0.4.9";

      src = fetchHex {
        pkg = "temp";
        version = "${version}";
        sha256 = "bc8bf7b27d9105bef933ef4bf4ba37ac6b899dbeba329deaa88c60b62d6b4b6d";
      };

      beamDeps = [];
    };

    tesla = buildMix rec {
      name = "tesla";
      version = "1.15.3";

      src = fetchHex {
        pkg = "tesla";
        version = "${version}";
        sha256 = "98bb3d4558abc67b92fb7be4cd31bb57ca8d80792de26870d362974b58caeda7";
      };

      beamDeps = [ castore finch hackney jason mime mint mox poison telemetry ];
    };

    text = buildMix rec {
      name = "text";
      version = "0.2.0";

      src = fetchHex {
        pkg = "text";
        version = "${version}";
        sha256 = "5ca265ba24bd2f00ab647dd524305e24cc17224b4f0052f169ff488013888bc3";
      };

      beamDeps = [ flow ];
    };

    text_corpus_udhr = buildMix rec {
      name = "text_corpus_udhr";
      version = "0.1.0";

      src = fetchHex {
        pkg = "text_corpus_udhr";
        version = "${version}";
        sha256 = "056a0b6a804ef03070f89b9b2e09d3271539654f4e2c30bb7d229730262f3fb8";
      };

      beamDeps = [ text ];
    };

    text_diff = buildMix rec {
      name = "text_diff";
      version = "0.1.0";

      src = fetchHex {
        pkg = "text_diff";
        version = "${version}";
        sha256 = "d1ffaaecab338e49357b6daa82e435f877e0649041ace7755583a0ea3362dbd7";
      };

      beamDeps = [];
    };

    thousand_island = buildMix rec {
      name = "thousand_island";
      version = "1.4.1";

      src = fetchHex {
        pkg = "thousand_island";
        version = "${version}";
        sha256 = "204a8640e5d2818589b87286ae66160978628d7edf6095181cbe0440765fb6c1";
      };

      beamDeps = [ telemetry ];
    };

    tidewave = buildMix rec {
      name = "tidewave";
      version = "0.5.0";

      src = fetchHex {
        pkg = "tidewave";
        version = "${version}";
        sha256 = "9a1eb5d2f12ff4912328dfbfe652c27fded462c6ed6fd11814ee28d3e9d016b4";
      };

      beamDeps = [ circular_buffer igniter jason phoenix_live_reload plug req ];
    };

    timex = buildMix rec {
      name = "timex";
      version = "3.7.13";

      src = fetchHex {
        pkg = "timex";
        version = "${version}";
        sha256 = "09588e0522669328e973b8b4fd8741246321b3f0d32735b589f78b136e6d4c54";
      };

      beamDeps = [ combine gettext tzdata ];
    };

    tls_certificate_check = buildRebar3 rec {
      name = "tls_certificate_check";
      version = "1.29.0";

      src = fetchHex {
        pkg = "tls_certificate_check";
        version = "${version}";
        sha256 = "5b0d0e5cb0f928bc4f210df667304ed91c5bff2a391ce6bdedfbfe70a8f096c5";
      };

      beamDeps = [ ssl_verify_fun ];
    };

    towel = buildMix rec {
      name = "towel";
      version = "0.2.2";

      src = fetchHex {
        pkg = "towel";
        version = "${version}";
        sha256 = "a7b3d16a63f4ccdb66388f2cf61e6701bfc190e0f0afaefbf246c909263725c2";
      };

      beamDeps = [];
    };

    typed_ecto_schema = buildMix rec {
      name = "typed_ecto_schema";
      version = "0.4.3";

      src = fetchHex {
        pkg = "typed_ecto_schema";
        version = "${version}";
        sha256 = "dcbd9b35b9fda5fa9258e0ae629a99cf4473bd7adfb85785d3f71dfe7a9b2bc0";
      };

      beamDeps = [ ecto ];
    };

    typed_struct = buildMix rec {
      name = "typed_struct";
      version = "0.3.0";

      src = fetchHex {
        pkg = "typed_struct";
        version = "${version}";
        sha256 = "c50bd5c3a61fe4e198a8504f939be3d3c85903b382bde4865579bc23111d1b6d";
      };

      beamDeps = [];
    };

    tz_world = buildMix rec {
      name = "tz_world";
      version = "1.4.1";

      src = fetchHex {
        pkg = "tz_world";
        version = "${version}";
        sha256 = "9173ba7aa7c5e627e23adfc0c8d001a56a7072d5bdc8d3a94e4cd44e25decba1";
      };

      beamDeps = [ castore certifi geo jason ];
    };

    tzdata = buildMix rec {
      name = "tzdata";
      version = "1.1.3";

      src = fetchHex {
        pkg = "tzdata";
        version = "${version}";
        sha256 = "d4ca85575a064d29d4e94253ee95912edfb165938743dbf002acdf0dcecb0c28";
      };

      beamDeps = [ hackney ];
    };

    unicode_util_compat = buildRebar3 rec {
      name = "unicode_util_compat";
      version = "0.7.1";

      src = fetchHex {
        pkg = "unicode_util_compat";
        version = "${version}";
        sha256 = "b3a917854ce3ae233619744ad1e0102e05673136776fb2fa76234f3e03b23642";
      };

      beamDeps = [];
    };

    uniq = buildMix rec {
      name = "uniq";
      version = "0.6.1";

      src = fetchHex {
        pkg = "uniq";
        version = "${version}";
        sha256 = "6426c34d677054b3056947125b22e0daafd10367b85f349e24ac60f44effb916";
      };

      beamDeps = [ ecto ];
    };

    unsafe = buildMix rec {
      name = "unsafe";
      version = "1.0.2";

      src = fetchHex {
        pkg = "unsafe";
        version = "${version}";
        sha256 = "b485231683c3ab01a9cd44cb4a79f152c6f3bb87358439c6f68791b85c2df675";
      };

      beamDeps = [];
    };

    versioce = buildMix rec {
      name = "versioce";
      version = "2.0.0";

      src = fetchHex {
        pkg = "versioce";
        version = "${version}";
        sha256 = "b2112ce621cd40fe23ad957a3dd82bccfdfa33c9a7f1e710a44b75ae772186cc";
      };

      beamDeps = [ git_cli ];
    };

    vix = buildMix rec {
      name = "vix";
      version = "0.35.0";

      src = fetchHex {
        pkg = "vix";
        version = "${version}";
        sha256 = "a3e80067a89d0631b6cf2b93594e03c1b303a2c7cddbbdd28040750d521984e5";
      };

      beamDeps = [ cc_precompiler elixir_make ];
    };

    waffle = buildMix rec {
      name = "waffle";
      version = "1.1.9";

      src = fetchHex {
        pkg = "waffle";
        version = "${version}";
        sha256 = "307c63cfdfb4624e7c423868a128ccfcb0e5291ae73a9deecb3a10b7a3eb277c";
      };

      beamDeps = [ ex_aws ex_aws_s3 hackney sweet_xml ];
    };

    wallaby = buildMix rec {
      name = "wallaby";
      version = "0.30.10";

      src = fetchHex {
        pkg = "wallaby";
        version = "${version}";
        sha256 = "a8f89b92d8acce37a94b5dfae6075c2ef00cb3689d6333f5f36c04b381c077b2";
      };

      beamDeps = [ ecto_sql httpoison jason phoenix_ecto web_driver_client ];
    };

    want = buildMix rec {
      name = "want";
      version = "1.18.0";

      src = fetchHex {
        pkg = "want";
        version = "${version}";
        sha256 = "b9ac94ca249924f16f545ff6f128af53fa401349214f69788f360a3835bb9c9a";
      };

      beamDeps = [];
    };

    web_driver_client = buildMix rec {
      name = "web_driver_client";
      version = "0.2.0";

      src = fetchHex {
        pkg = "web_driver_client";
        version = "${version}";
        sha256 = "83cc6092bc3e74926d1c8455f0ce927d5d1d36707b74d9a65e38c084aab0350f";
      };

      beamDeps = [ hackney jason tesla ];
    };

    websock = buildMix rec {
      name = "websock";
      version = "0.5.3";

      src = fetchHex {
        pkg = "websock";
        version = "${version}";
        sha256 = "6105453d7fac22c712ad66fab1d45abdf049868f253cf719b625151460b8b453";
      };

      beamDeps = [];
    };

    websock_adapter = buildMix rec {
      name = "websock_adapter";
      version = "0.5.8";

      src = fetchHex {
        pkg = "websock_adapter";
        version = "${version}";
        sha256 = "315b9a1865552212b5f35140ad194e67ce31af45bcee443d4ecb96b5fd3f3782";
      };

      beamDeps = [ bandit plug plug_cowboy websock ];
    };

    wild = buildMix rec {
      name = "wild";
      version = "1.0.1";

      src = fetchHex {
        pkg = "wild";
        version = "${version}";
        sha256 = "fd399dad2a2787b64fa7fb7e5e9b73cfe8cdcfa80dfe41ed15aba14b890da6be";
      };

      beamDeps = [];
    };

    zest = buildMix rec {
      name = "zest";
      version = "0.1.2";

      src = fetchHex {
        pkg = "zest";
        version = "${version}";
        sha256 = "ebe2d6acf615de286e45846a3d6daf72d7c20f2c5eefada6d8a1729256a3974a";
      };

      beamDeps = [];
    };

    zstream = buildMix rec {
      name = "zstream";
      version = "0.6.7";

      src = fetchHex {
        pkg = "zstream";
        version = "${version}";
        sha256 = "48c43ae0f00cfcda1ccb69c1d044755663d43b2ee8a0a65763648bf2078d634d";
      };

      beamDeps = [];
    };
  };
in self

