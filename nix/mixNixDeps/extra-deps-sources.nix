{
  lib,
  beamPackages,
  fetchFromGitHub,
  fetchgit,
  ...
}:
let
  # FixMe: can some of those packages be using buildRebar3?
  buildRebar3 = lib.makeOverridable beamPackages.buildRebar3;
  buildMix = lib.makeOverridable beamPackages.buildMix;
  buildErlangMk = lib.makeOverridable beamPackages.buildErlangMk;
in
finalMixPkgs: previousMixPkgs: {
  absinthe_client = buildMix {
    name = "absinthe_client";
    version = "ceeb7c3bb8ac5348c399653a06eaaee3bbd47d8f";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "absinthe_client";
      rev = "ceeb7c3bb8ac5348c399653a06eaaee3bbd47d8f";
      hash = "sha256-WBMtr2d56eYc3FdTtljzo9IzBPGVllVsOyYe+oqxoaI=";
    };
    beamDeps = with finalMixPkgs; [
      absinthe
      absinthe_plug
      decimal
      ex_doc
      jason
      phoenix
      phoenix_html
      phoenix_live_view
      phoenix_pubsub
    ];
  };
  activity_pub = buildMix {
    name = "activity_pub";
    version = "db1cdf2b3fff8956e182b8088804cd53321b3079";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "activity_pub";
      rev = "db1cdf2b3fff8956e182b8088804cd53321b3079";
      hash = "sha256-BwmDBg+QTnWWX5wEzZ2EKPVBNrIbpnIvp7uLrpwOSy0=";
    };
    beamDeps = with finalMixPkgs; [
      arrows
      cachex
      ecto_sql
      ex_doc
      ex_machina
      excoveralls
      hammer_plug
      http_signatures
      jason
      mfm_parser
      mime
      mock
      needle_uid
      oban
      phoenix
      phoenix_ecto
      phoenix_html_helpers
      phoenix_live_dashboard
      plug_cowboy
      plug_http_validator
      postgrex
      remote_ip
      telemetry_metrics
      telemetry_poller
      tesla
      untangle
    ];
  };
  bonfire_api_graphql = buildMix {
    name = "bonfire_api_graphql";
    version = "75727b997ca820010541bc4e488762ccaccb5f91";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_api_graphql";
      rev = "75727b997ca820010541bc4e488762ccaccb5f91";
      hash = "sha256-bagP0fsjNrU6heJg/N/0K+mrAtGzSQFWE0mil/boz50=";
    };
    beamDeps = with finalMixPkgs; [
      absinthe
      absinthe_client
      absinthe_error_payload
      absinthe_phoenix
      absinthe_plug
      absinthe_relay
      bonfire_common
      bonfire_ui_common
      dataloader
      geo
      grumble
      jason
      phoenix_live_reload
      redirect
      zest
    ];
  };
  bonfire_boundaries = buildMix {
    name = "bonfire_boundaries";
    version = "ef582b71e14d7b0f93d854e97e18cb14627aef05";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_boundaries";
      rev = "ef582b71e14d7b0f93d854e97e18cb14627aef05";
      hash = "sha256-zf6qRAWzrjxjVQAT9g40SjFn1kvMBUE1jIKAPrMqV0o=";
    };
    beamDeps = with finalMixPkgs; [
      bonfire_common
      bonfire_data_access_control
      bonfire_epics
      ecto_vista
      faker
      igniter
      jason
      needle
      scribe
    ];
  };
  bonfire_classify = buildMix {
    name = "bonfire_classify";
    version = "86d23fab2aad8d08618068237f3aa01231a67a3f";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_classify";
      rev = "86d23fab2aad8d08618068237f3aa01231a67a3f";
      hash = "sha256-b5C9+Bnrd8oIVNDc0f2XNho6GVE6wimnzNgKF7Pptjs=";
    };
    beamDeps = with finalMixPkgs; [
      absinthe
      bonfire_api_graphql
      bonfire_common
      bonfire_me
      bonfire_search
      bonfire_tag
      faker
      floki
      jason
      needle
      telemetry_metrics
      telemetry_poller
    ];
  };
  bonfire_common = buildMix {
    name = "bonfire_common";
    version = "cdc02193667443c2dfc72c0437fb0cc0c40665c7";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_common";
      rev = "cdc02193667443c2dfc72c0437fb0cc0c40665c7";
      hash = "sha256-4ZQQEwNbbwHEIRKXl2UH9pYL9aToHweaIv61934DSCE=";
    };
    beamDeps = with finalMixPkgs; [
      appsignal_phoenix
      arrows
      assert_value
      beam_file
      bonfire_data_identity
      bumblebee
      cloak
      dataloader
      ecto_shorts
      ecto_sparkles
      ecto_sql
      emote
      ex_cldr
      ex_cldr_dates_times
      ex_cldr_languages
      ex_cldr_locale_display
      ex_cldr_numbers
      ex_cldr_plugs
      ex_cldr_territories
      ex_cldr_units
      exkismet
      faker
      floki
      gettext
      git_diff
      html_sanitize_ex
      igniter
      jason
      json_serde
      lazy_html
      mdex
      nebulex
      needle
      needle_uid
      needle_ulid
      neuron
      opentelemetry_api
      paginator
      pathex
      postgrex
      process_tree
      recase
      repatch
      sentry
      simple_slug
      sizeable
      telemetry_metrics
      tesla
      text
      text_corpus_udhr
      timex
      untangle
      versioce
      want
      zest
    ];
  };
  bonfire_data_access_control = buildMix {
    name = "bonfire_data_access_control";
    version = "9994601d8256aaf3cd35aabdeded94f2366b84ea";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_data_access_control";
      rev = "9994601d8256aaf3cd35aabdeded94f2366b84ea";
      hash = "sha256-z1cLKd8zZxmaPaVzH4UsWpZ4VmXYvzxMwOuvWyga/fc=";
    };
    beamDeps = with finalMixPkgs; [
      ex_doc
      needle
    ];
  };
  bonfire_data_activity_pub = buildMix {
    name = "bonfire_data_activity_pub";
    version = "3cf9cc7db3fc229c6949ee3fb415aa5524633daa";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_data_activity_pub";
      rev = "3cf9cc7db3fc229c6949ee3fb415aa5524633daa";
      hash = "sha256-PS9w5D1kY95S1WVSJi+JDfrQc6txW1Xd0ud9KgWyzfU=";
    };
    beamDeps = with finalMixPkgs; [
      ex_doc
      needle
      untangle
    ];
  };
  bonfire_data_assort = buildMix {
    name = "bonfire_data_assort";
    version = "e3457b7048eb659c226a89142edaeb19f31fcb25";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_data_assort";
      rev = "e3457b7048eb659c226a89142edaeb19f31fcb25";
      hash = "sha256-hmqkug0NJwVJfIRUy3eeiZnLrk2JQOH92b2PMmD2yiQ=";
    };
    beamDeps = with finalMixPkgs; [
      ecto_ranked
      ex_doc
      needle
    ];
  };
  bonfire_data_edges = buildMix {
    name = "bonfire_data_edges";
    version = "bb581f89e1a03cd3a74766676c3eebb2d56cee58";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_data_edges";
      rev = "bb581f89e1a03cd3a74766676c3eebb2d56cee58";
      hash = "sha256-ypB+w0ByB3vkNpmcecW22QdAFYjrxUXpU6RpXdh2w2U=";
    };
    beamDeps = with finalMixPkgs; [
      needle
    ];
  };
  bonfire_data_identity = buildMix {
    name = "bonfire_data_identity";
    version = "6207885e94c7426a2b5295aeaf85223eacc71078";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_data_identity";
      rev = "6207885e94c7426a2b5295aeaf85223eacc71078";
      hash = "sha256-S0qaRCRx/HiC+xn3qzKTWugChbJZwBnCgk8/E4afNPU=";
    };
    beamDeps = with finalMixPkgs; [
      bonfire_data_edges
      ecto_sparkles
      ex_doc
      json_serde
      needle
      nimble_totp
      pbkdf2_elixir
      untangle
    ];
  };
  bonfire_data_shared_user = buildMix {
    name = "bonfire_data_shared_user";
    version = "dafbbe2ea65bb55599d774ef0f8a375179ac81b0";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_data_shared_user";
      rev = "dafbbe2ea65bb55599d774ef0f8a375179ac81b0";
      hash = "sha256-ksr6Hn2JKxBU6Zxoyr0Z/f1z/8Ow/jl/nblKIxAkmZY=";
    };
    beamDeps = with finalMixPkgs; [
      bonfire_data_identity
      ex_doc
      needle
    ];
  };
  bonfire_data_social = buildMix {
    name = "bonfire_data_social";
    version = "deaddb549a4313a2bad412b23c4f5249be7a07d6";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_data_social";
      rev = "deaddb549a4313a2bad412b23c4f5249be7a07d6";
      hash = "sha256-MHPlq4XLw8fvlUwaxAZ3kyIbzGisz9IAAzWzDNF4ZGs=";
    };
    beamDeps = with finalMixPkgs; [
      arrows
      bonfire_data_edges
      ecto_materialized_path
      ex_doc
      needle
      untangle
    ];
  };
  bonfire_ecto = buildMix {
    name = "bonfire_ecto";
    version = "91ef6d0d322ec8ceb4588a8e45575f94ed0e44ca";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_ecto";
      rev = "91ef6d0d322ec8ceb4588a8e45575f94ed0e44ca";
      hash = "sha256-3H6r9HZtDe0gRLq4yD4yi9ObRDAra2Cw0jhOHT3O7YE=";
    };
    beamDeps = with finalMixPkgs; [
      bonfire_common
      bonfire_epics
    ];
  };
  bonfire_editor_milkdown = buildMix {
    name = "bonfire_editor_milkdown";
    version = "7cf6333de05801d789370f6e8f22ce9d72e86b20";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_editor_milkdown";
      rev = "7cf6333de05801d789370f6e8f22ce9d72e86b20";
      hash = "sha256-TK3Tv2WYphV8or1ZiDOSeerOjLna4KdtbACt+GrE2tY=";
    };
    beamDeps = with finalMixPkgs; [
      bonfire_common
      bonfire_ui_common
      floki
      phoenix_live_reload
      surface
      untangle
    ];
  };
  bonfire_epics = buildMix {
    name = "bonfire_epics";
    version = "365fc195158b33d19aa386ceb7d0b1e25237049a";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_epics";
      rev = "365fc195158b33d19aa386ceb7d0b1e25237049a";
      hash = "sha256-FzMyhqhMzHKsqsQ6Ujb/i6wOn7lNETvPfC/SJH3xCfg=";
    };
    beamDeps = with finalMixPkgs; [
      arrows
      bonfire_common
      untangle
    ];
  };
  bonfire_fail = buildMix {
    name = "bonfire_fail";
    version = "80282fcdad3bdf8b4cdce347bc344aa5776c697d";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_fail";
      rev = "80282fcdad3bdf8b4cdce347bc344aa5776c697d";
      hash = "sha256-/vWb6RP3l1oR5AM+mzvEFhgHgj81uBRGSIHJbjNvU44=";
    };
    beamDeps = with finalMixPkgs; [
      bonfire_common
      phoenix_live_reload
      untangle
    ];
  };
  bonfire_federate_activitypub = buildMix {
    name = "bonfire_federate_activitypub";
    version = "17dbbc58abdcee24865c56e2b9ca3a25e6c0b3e3";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_federate_activitypub";
      rev = "17dbbc58abdcee24865c56e2b9ca3a25e6c0b3e3";
      hash = "sha256-Ai9TdbtnUg+jVF1H4oQk7KRc+it3I6i0AlX9LSlGhZk=";
    };
    beamDeps = with finalMixPkgs; [
      activity_pub
      bonfire_boundaries
      bonfire_common
      bonfire_me
      bonfire_social
      faker
      floki
      gettext
      jason
      needle
      nodeinfo
      oban
      telemetry_metrics
      telemetry_poller
      untangle
    ];
  };
  bonfire_files = buildMix {
    name = "bonfire_files";
    version = "22d2ce1ded99a7a3d7066220704cea3be0a64086";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_files";
      rev = "22d2ce1ded99a7a3d7066220704cea3be0a64086";
      hash = "sha256-m5fe46k0NyzoYPVE+5M07ztxwX29WqlnHCGgAzgmcgg=";
    };
    beamDeps = with finalMixPkgs; [
      blurhash
      bonfire_api_graphql
      bonfire_common
      bonfire_epics
      bonfire_ui_common
      entrepot
      entrepot_ecto
      evision
      ex_aws_s3
      ex_aws_sts
      faviconic
      hackney
      image
      mogrify
      needle
      sizeable
      sweet_xml
      twinkle_star
      unfurl
      untangle
      waffle
    ];
  };
  bonfire_geolocate = buildMix {
    name = "bonfire_geolocate";
    version = "a3a379f05d46a69617a3f9461a11312b7bc6bf26";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_geolocate";
      rev = "a3a379f05d46a69617a3f9461a11312b7bc6bf26";
      hash = "sha256-NUEOiHWtZPEBrROLashbP0xNoHqtYl5udCj6LIdmOUc=";
    };
    beamDeps = with finalMixPkgs; [
      absinthe
      astro
      bonfire_api_graphql
      bonfire_common
      bonfire_tag
      faker
      floki
      geo_postgis
      geocoder
      grumble
      jason
      needle
      phoenix_gon
      telemetry_metrics
      telemetry_poller
      tz_world
      untangle
    ];
  };
  bonfire_invite_links = buildMix {
    name = "bonfire_invite_links";
    version = "cdacf1f5938248f1193a2d29e9154e77f0d792ad";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_invite_links";
      rev = "cdacf1f5938248f1193a2d29e9154e77f0d792ad";
      hash = "sha256-SDb9bcJSJmddrEgTsVgGnaKE42n90d29od3sET7OiVw=";
    };
    beamDeps = with finalMixPkgs; [
      bonfire_common
      bonfire_ui_common
      faker
      floki
      jason
      needle
      phoenix_live_reload
      untangle
    ];
  };
  bonfire_mailer = buildMix {
    name = "bonfire_mailer";
    version = "30448cb3ac78c822cf34ad3695a2779a7b52f5fc";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_mailer";
      rev = "30448cb3ac78c822cf34ad3695a2779a7b52f5fc";
      hash = "sha256-7cN15K4XZmKnMz8b0RFYpXSD478fuyJwJ+eBUIGquSE=";
    };
    beamDeps = with finalMixPkgs; [
      bamboo
      bamboo_campaign_monitor
      bamboo_mailjet
      bamboo_postmark
      bamboo_sendcloud
      bamboo_ses
      bamboo_smtp
      bamboo_sparkpost
      bonfire_common
      email_checker
      faker
      gen_smtp
      gettext
      jason
      mail
      mjml
      mua
      phoenix_live_reload
      swoosh
    ];
  };
  bonfire_me = buildMix {
    name = "bonfire_me";
    version = "f55bf339027ad0374cb68908ecf43f75943099c5";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_me";
      rev = "f55bf339027ad0374cb68908ecf43f75943099c5";
      hash = "sha256-GyjqBj4iqwlzgXVADS4vW0KNjiJUlp5E0QM5cH3OGKQ=";
    };
    beamDeps = with finalMixPkgs; [
      absinthe
      activity_pub
      arrows
      bonfire_api_graphql
      bonfire_boundaries
      bonfire_common
      bonfire_data_activity_pub
      bonfire_data_identity
      bonfire_data_shared_user
      bonfire_data_social
      bonfire_epics
      bonfire_files
      bonfire_mailer
      eqrcode
      faker
      floki
      needle
      needle_ulid
      nimble_totp
      phoenix_live_reload
      telemetry
      telemetry_metrics
      telemetry_poller
      untangle
    ];
  };
  bonfire_messages = buildMix {
    name = "bonfire_messages";
    version = "892b0542139d2c1b14136056225c973ce27dd223";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_messages";
      rev = "892b0542139d2c1b14136056225c973ce27dd223";
      hash = "sha256-XmWt9a2pDTTTe3cj98PpDa5/v9YsiovuX2hOkJRQGps=";
    };
    beamDeps = with finalMixPkgs; [
      absinthe
      arrows
      bonfire_api_graphql
      bonfire_common
      bonfire_data_social
      bonfire_ecto
      bonfire_epics
      bonfire_me
      bonfire_posts
      exto
      faker
      jason
      needle
      untangle
      verbs
    ];
  };
  bonfire_open_id = buildMix {
    name = "bonfire_open_id";
    version = "97198a2a0fee32d5749cef801ec80d000806bbee";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_open_id";
      rev = "97198a2a0fee32d5749cef801ec80d000806bbee";
      hash = "sha256-Danr8p883Mtqspy+AEqUBG2M6vP4xnQ9BXJgOB4/xcw=";
    };
    beamDeps = with finalMixPkgs; [
      bonfire_common
      bonfire_me
      bonfire_ui_common
      boruta
      faker
      floki
      jason
      mox
      openid_connect
      phoenix_live_reload
      plug_crypto
      untangle
    ];
  };
  bonfire_open_science = buildMix {
    name = "bonfire_open_science";
    version = "2d8433a05b24f1a8bbda4492af11b9c92d1b2041";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_open_science";
      rev = "2d8433a05b24f1a8bbda4492af11b9c92d1b2041";
      hash = "sha256-OUPXnhifv5CcA2gZGcWJkaYQciC2Qa+WPS8I/CYCamQ=";
    };
    beamDeps = with finalMixPkgs; [
      bonfire_common
      bonfire_ui_common
      faker
      floki
      jason
      needle
      oban
      phoenix_live_reload
      untangle
    ];
  };
  bonfire_posts = buildMix {
    name = "bonfire_posts";
    version = "665cb858fc9372a323933a5e6591fbc455162a01";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_posts";
      rev = "665cb858fc9372a323933a5e6591fbc455162a01";
      hash = "sha256-xIzXpXxgQKCylUFVckVe+O3+cNQIkbxGPgSyfCp3EnA=";
    };
    beamDeps = with finalMixPkgs; [
      absinthe
      arrows
      bonfire_api_graphql
      bonfire_common
      bonfire_data_social
      bonfire_ecto
      bonfire_epics
      bonfire_me
      bonfire_social
      exto
      faker
      jason
      needle
      untangle
      verbs
    ];
  };
  bonfire_search = buildMix {
    name = "bonfire_search";
    version = "892feec0bf2957d937ef70898f50d3de1513b92d";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_search";
      rev = "892feec0bf2957d937ef70898f50d3de1513b92d";
      hash = "sha256-bW54UEGoHutie6P/IsY2Qq7nNQkQWaHzbW7tJV9GtaM=";
    };
    beamDeps = with finalMixPkgs; [
      bonfire_common
      bonfire_epics
      bonfire_ui_common
      fast_ngram
      floki
      gettext
      jason
      meilisearch_ex
      recase
      telemetry_metrics
      telemetry_poller
      tesla
    ];
  };
  bonfire_social = buildMix {
    name = "bonfire_social";
    version = "997d0046324f4fbff3ccaf05c75fb250f2db9d53";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_social";
      rev = "997d0046324f4fbff3ccaf05c75fb250f2db9d53";
      hash = "sha256-ZGPYVYFoCa/PFfbLVsifmjv+gBCZnNAQLvZ5iAuhsns=";
    };
    beamDeps = with finalMixPkgs; [
      absinthe
      arrows
      bonfire_api_graphql
      bonfire_boundaries
      bonfire_common
      bonfire_data_social
      bonfire_ecto
      bonfire_epics
      bonfire_files
      bonfire_me
      exto
      faker
      jason
      lazy_html
      needle
      nimble_csv
      typed_ecto_schema
      untangle
      verbs
    ];
  };
  bonfire_social_graph = buildMix {
    name = "bonfire_social_graph";
    version = "6b50e508f32cb9fcc7f498b9b17673b7a191bb03";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_social_graph";
      rev = "6b50e508f32cb9fcc7f498b9b17673b7a191bb03";
      hash = "sha256-+cwxSDTIs6HGkSjtlWdbAz4hv00hfjPr0iFqDNdDemQ=";
    };
    beamDeps = with finalMixPkgs; [
      absinthe
      arrows
      boltx
      bonfire_api_graphql
      bonfire_common
      bonfire_data_social
      bonfire_ecto
      bonfire_epics
      bonfire_me
      bonfire_social
      exto
      faker
      jason
      needle
      nimble_csv
      untangle
      verbs
    ];
  };
  bonfire_tag = buildMix {
    name = "bonfire_tag";
    version = "0e19805226b357739d785c10ee40f6ee88d738e0";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_tag";
      rev = "0e19805226b357739d785c10ee40f6ee88d738e0";
      hash = "sha256-uyxMrWo6f6Z3Kbb8MO+D5tWNnElA9YLyRgaOw6CFf2Y=";
    };
    beamDeps = with finalMixPkgs; [
      absinthe
      arrows
      bonfire_api_graphql
      bonfire_common
      bonfire_epics
      bonfire_ui_common
      faker
      floki
      html_entities
      jason
      linkify
      needle
      telemetry_metrics
      telemetry_poller
      untangle
    ];
  };
  bonfire_ui_boundaries = buildMix {
    name = "bonfire_ui_boundaries";
    version = "0798b287006e08db87079a88f10c99feec394062";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_ui_boundaries";
      rev = "0798b287006e08db87079a88f10c99feec394062";
      hash = "sha256-tShLcMZUHG1rK6DqDcG4HQ26GnqwjRhqTW0m/5+DPcA=";
    };
    beamDeps = with finalMixPkgs; [
      bonfire_boundaries
      bonfire_common
      bonfire_ui_common
      faker
      floki
      jason
      needle
      phoenix_live_reload
      untangle
    ];
  };
  bonfire_ui_common = buildMix {
    name = "bonfire_ui_common";
    version = "d433da546e8bd7d5239ae8256612be8622ef531f";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_ui_common";
      rev = "d433da546e8bd7d5239ae8256612be8622ef531f";
      hash = "sha256-G1Wac68FlqqVRW/W23ZIFhGnSPQoeOmgIIHibqwQPH4=";
    };
    beamDeps = with finalMixPkgs; [
      appsignal_phoenix
      arrows
      bonfire_common
      bonfire_fail
      chameleon
      faker
      floki
      iconify_ex
      jason
      live_select
      makeup_diff
      makeup_eex
      makeup_elixir
      makeup_erlang
      makeup_graphql
      makeup_html
      makeup_js
      makeup_json
      makeup_sql
      oban
      phoenix_ecto
      phoenix_gon
      phoenix_live_dashboard
      phoenix_live_favicon
      phoenix_live_reload
      phoenix_live_view
      phoenix_seo
      phoenix_test
      phoenix_view
      plug_attack
      plug_cowboy
      plug_early_hints
      remote_ip
      solid
      surface
      surface_form_helpers
      untangle
      zest
    ];
  };
  bonfire_ui_me = buildMix {
    name = "bonfire_ui_me";
    version = "9ab8d3dc5bf6c7a58890035b7d4a41b92d8e17cd";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_ui_me";
      rev = "9ab8d3dc5bf6c7a58890035b7d4a41b92d8e17cd";
      hash = "sha256-oAtQi83ExCfbjXvTJItpqcvE7m3vC36938xk2biTq0w=";
    };
    beamDeps = with finalMixPkgs; [
      arrows
      bonfire_common
      bonfire_files
      bonfire_me
      bonfire_ui_common
      faker
      floki
      gettext
      jason
      mneme
      needle
      phoenix
      phoenix_live_view
      recase
      repatch
      surface
      telemetry_metrics
      telemetry_poller
      untangle
      verbs
      zest
      zstream
    ];
  };
  bonfire_ui_messages = buildMix {
    name = "bonfire_ui_messages";
    version = "6bffd9c36e52f62c92a544911d2c3621be0042a5";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_ui_messages";
      rev = "6bffd9c36e52f62c92a544911d2c3621be0042a5";
      hash = "sha256-LnabHAgUl/6PpbZqsFNQgLT8YpAAV09CjqeTTxmyvTw=";
    };
    beamDeps = with finalMixPkgs; [
      arrows
      bonfire_boundaries
      bonfire_common
      bonfire_messages
      bonfire_tag
      bonfire_ui_common
      exdiff
      faker
      floki
      gettext
      jason
      phoenix_live_reload
      recase
      untangle
      verbs
    ];
  };
  bonfire_ui_moderation = buildMix {
    name = "bonfire_ui_moderation";
    version = "9dd6b8aa15c4bb9c41bdd8a9a273a84d32bd3a79";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_ui_moderation";
      rev = "9dd6b8aa15c4bb9c41bdd8a9a273a84d32bd3a79";
      hash = "sha256-Mp9+310a/3KYbpUeC5kvUZLkiz/MaC9EkKVRlrLFqYw=";
    };
    beamDeps = with finalMixPkgs; [
      arrows
      bonfire_common
      bonfire_social
      bonfire_tag
      bonfire_ui_common
      exdiff
      faker
      floki
      gettext
      jason
      phoenix_live_reload
      recase
      untangle
      verbs
    ];
  };
  bonfire_ui_posts = buildMix {
    name = "bonfire_ui_posts";
    version = "6e51854f7c3543de4a99bfc3d20cf66c2f615a87";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_ui_posts";
      rev = "6e51854f7c3543de4a99bfc3d20cf66c2f615a87";
      hash = "sha256-m4RYJLZ1HZsldE52zl/VaJyefyWwyOdio3GNWRN55Fw=";
    };
    beamDeps = with finalMixPkgs; [
      arrows
      bonfire_common
      bonfire_posts
      bonfire_tag
      bonfire_ui_common
      exdiff
      faker
      floki
      gettext
      jason
      phoenix_live_reload
      recase
      untangle
      verbs
    ];
  };
  bonfire_ui_reactions = buildMix {
    name = "bonfire_ui_reactions";
    version = "ae3d27eea98e68c782588ecb5e73c73712d3620b";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_ui_reactions";
      rev = "ae3d27eea98e68c782588ecb5e73c73712d3620b";
      hash = "sha256-PVaUHuSnakOHMnw7eI0DlNskXY9nTkDvjO5Vuotw2Ns=";
    };
    beamDeps = with finalMixPkgs; [
      arrows
      bonfire_common
      bonfire_social
      bonfire_tag
      bonfire_ui_common
      exdiff
      faker
      floki
      gettext
      jason
      phoenix_live_reload
      recase
      surface
      untangle
      verbs
    ];
  };
  bonfire_ui_social = buildMix {
    name = "bonfire_ui_social";
    version = "6c0e020c557ff2f7d9a7979370a3b3c67be81163";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_ui_social";
      rev = "6c0e020c557ff2f7d9a7979370a3b3c67be81163";
      hash = "sha256-yf9LWj5n75UQIxh2G7ays3rsjealBnHsw7x/MVs2uNM=";
    };
    beamDeps = with finalMixPkgs; [
      arrows
      bonfire_common
      bonfire_social
      bonfire_tag
      bonfire_ui_common
      bonfire_ui_me
      exdiff
      faker
      floki
      gettext
      jason
      phoenix_live_reload
      recase
      surface
      untangle
      verbs
    ];
  };
  bonfire_ui_social_graph = buildMix {
    name = "bonfire_ui_social_graph";
    version = "14d7c4e1d1c13f6dae53248b3edcb06ea19b9662";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "bonfire_ui_social_graph";
      rev = "14d7c4e1d1c13f6dae53248b3edcb06ea19b9662";
      hash = "sha256-1kSqxB+uC73ShUYFQGJrDojXnR34g+woFrmU7+LotdE=";
    };
    beamDeps = with finalMixPkgs; [
      arrows
      bonfire_common
      bonfire_social_graph
      bonfire_tag
      exdiff
      faker
      floki
      gettext
      jason
      phoenix_live_reload
      recase
      untangle
      verbs
    ];
  };
  boruta = buildMix {
    name = "boruta";
    version = "35191e336f49bc5c52b2e2400c563a92c2732dd5";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "boruta";
      rev = "35191e336f49bc5c52b2e2400c563a92c2732dd5";
      hash = "sha256-FT/ITPvH0J2aleBqm4H9Xp21xzy4TsNlH5C0x0Ctgco=";
    };
    beamDeps = with finalMixPkgs; [
      bypass
      credo
      dialyxir
      ecto_sql
      ex_doc
      ex_json_schema
      ex_machina
      excoveralls
      finch
      jason
      joken
      jose
      mox
      nebulex
      owl
      phoenix
      plug
      postgrex
      puid
      secure_random
      shards
    ];
  };
  ecto_materialized_path = buildMix {
    name = "ecto_materialized_path";
    version = "5400b058d7ddd24379db3662c29b51d0cec82756";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "ecto_materialized_path";
      rev = "5400b058d7ddd24379db3662c29b51d0cec82756";
      hash = "sha256-RSvgcL7X5Gvlej5axsl8WLltGHzaMcRfdiEPUlufcas=";
    };
    beamDeps = with finalMixPkgs; [
      ecto
      ex_doc
      ex_machina
      needle_uid
      untangle
    ];
  };
  ecto_shorts = buildMix {
    name = "ecto_shorts";
    version = "34ac78036b249aec833ae357f69195e46306f817";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "ecto_shorts";
      rev = "34ac78036b249aec833ae357f69195e46306f817";
      hash = "sha256-4OxxcNE5N5xn9OcO3GiA0hitnyLnej5lupfsRZ2It/0=";
    };
    beamDeps = with finalMixPkgs; [
      ecto_sql
      ex_doc
    ];
  };
  ecto_sparkles = buildMix {
    name = "ecto_sparkles";
    version = "542fa562aa6d03689ea4119896f5c20224dcd724";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "ecto_sparkles";
      rev = "542fa562aa6d03689ea4119896f5c20224dcd724";
      hash = "sha256-ETKbMd6y8Wa1XZq1EPDktN6rtMie/PKUIJKchxGNLmk=";
    };
    beamDeps = with finalMixPkgs; [
      ecto
      ecto_dev_logger
      ecto_sql
      ex_doc
      html_sanitize_ex
      json_serde
      recase
      untangle
    ];
  };
  ember = buildMix {
    name = "ember";
    version = "79fcd7ba7db280a2e2fb739b5399390035159d3b";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "ember";
      rev = "79fcd7ba7db280a2e2fb739b5399390035159d3b";
      hash = "sha256-8NePnSGTP/BjzYX56W73kljwWp5KTKrMEw+cUWlxhUI=";
    };
    beamDeps = with finalMixPkgs; [
      absinthe
      absinthe_client
      activity_pub
      arrows
      bandit
      bonfire_api_graphql
      bonfire_boundaries
      bonfire_classify
      bonfire_common
      bonfire_data_access_control
      bonfire_data_activity_pub
      bonfire_data_assort
      bonfire_data_edges
      bonfire_data_identity
      bonfire_data_social
      bonfire_ecto
      bonfire_editor_milkdown
      bonfire_epics
      bonfire_federate_activitypub
      bonfire_mailer
      bonfire_me
      bonfire_posts
      bonfire_social
      bonfire_social_graph
      bonfire_tag
      bonfire_ui_boundaries
      bonfire_ui_common
      bonfire_ui_me
      bonfire_ui_moderation
      bonfire_ui_posts
      bonfire_ui_social
      bonfire_ui_social_graph
      cachex
      corsica
      cowboy
      db_connection
      decimal
      ecto
      ecto_psql_extras
      ecto_sparkles
      ecto_sql
      emote
      entrepot
      entrepot_ecto
      ex_aws_s3
      ex_doc
      ex_marcel
      ex_ulid
      exto
      faker
      finch
      floki
      geo
      gettext
      hackney
      httpoison
      jason
      mime
      mneme
      mogrify
      needle
      needle_uid
      needle_ulid
      nodeinfo
      oban
      oban_web
      opentelemetry_exporter
      opentelemetry_process_propagator
      opentelemetry_semantic_conventions
      orion
      owl
      paginator
      pbkdf2_elixir
      phoenix
      phoenix_live_reload
      phoenix_live_view
      phoenix_view
      plug_cowboy
      plug_crypto
      poison
      postgrex
      recase
      req
      rustler_precompiled
      sentry
      sizeable
      solid
      sourceror
      surface
      telemetry
      telemetry_metrics
      telemetry_poller
      text
      text_corpus_udhr
      timex
      uniq
      untangle
      voodoo
    ];
  };
  entrepot = buildMix {
    name = "entrepot";
    version = "c75704d8b4b76dbd2277b52822fa77ec8dc207aa";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "entrepot";
      rev = "c75704d8b4b76dbd2277b52822fa77ec8dc207aa";
      hash = "sha256-sFLvmdAThsdTpVs+ThhwxR7zuZgMbye+pQSE2Y+80do=";
    };
    beamDeps = with finalMixPkgs; [
      bypass
      dialyxir
      ex_aws
      ex_aws_s3
      ex_doc
      mox
    ];
  };
  entrepot_ecto = buildMix {
    name = "entrepot_ecto";
    version = "5ea4af9af6b648e2cf58a2ceb2eb8e9c36c2b226";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "entrepot_ecto";
      rev = "5ea4af9af6b648e2cf58a2ceb2eb8e9c36c2b226";
      hash = "sha256-yOdb7S7FwOaslvxR4b2naxlOnYGMx0CI7jf5DmPHaUw=";
    };
    beamDeps = with finalMixPkgs; [
      ecto
      entrepot
      ex_doc
    ];
  };
  ex_ulid = buildMix {
    name = "ex_ulid";
    version = "b07e0410b9d683385de081cfd5af0e3225b270f9";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "ex_ulid";
      rev = "b07e0410b9d683385de081cfd5af0e3225b270f9";
      hash = "sha256-9G6o63auGDcrKGFRc0DLROLbBu3CiwKPlJ7Pt7vF8Hg=";
    };
    beamDeps = with finalMixPkgs; [
      benchee
      ex_doc
    ];
  };
  exkismet = buildMix {
    name = "exkismet";
    version = "68830454608d315f69d5fe1061ac1bf31c1a856e";
    src = fetchFromGitHub {
      owner = "tcitworld";
      repo = "exkismet";
      rev = "68830454608d315f69d5fe1061ac1bf31c1a856e";
      hash = "sha256-mwLRQjAZoZSRLIQ7Xzp5SgSXu4JRXmgtgUcN+EteSsU=";
    };
    beamDeps = with finalMixPkgs; [
      credo
      dialyxir
      doctor
      ex_doc
      httpoison
    ];
  };
  forecastr = buildMix {
    name = "forecastr";
    version = "96b97b3acac6b7b9185bcca9e1b69cf9256673ca";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "forecastr";
      rev = "96b97b3acac6b7b9185bcca9e1b69cf9256673ca";
      hash = "sha256-miMkI2DXBcAFtVsAGXTybuxUypuZE+ZD2vOHiJw+4qw=";
    };
    beamDeps = with finalMixPkgs; [
      credo
      dialyxir
      elbat
      ex_doc
      excoveralls
      exvcr
      httpoison
      jason
      mogrify
    ];
  };
  http_signatures = buildMix {
    name = "http_signatures";
    version = "276839e90e8d2fb17d415502c6c5f0e3f744e88f";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "http_signatures";
      rev = "276839e90e8d2fb17d415502c6c5f0e3f744e88f";
      hash = "sha256-v/OiMkpHL1ytbf8JSsgIzbZMT8Qoffptmt29y+mmjFo=";
    };
    beamDeps = with finalMixPkgs; [
      credo
      dialyxir
      ex_doc
      untangle
    ];
  };
  iconify_ex = buildMix {
    name = "iconify_ex";
    version = "5d1c2ca0c65377ef88b80f05cc89c3fcef423bf9";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "iconify_ex";
      rev = "5d1c2ca0c65377ef88b80f05cc89c3fcef423bf9";
      hash = "sha256-TgOLXgkB/VffErBsZLe0CS6Eg1HPQyYtHMvNC/1L2bE=";
    };
    beamDeps = with finalMixPkgs; [
      arrows
      emote
      ex_doc
      floki
      jason
      phoenix_live_favicon
      phoenix_live_view
      recase
      surface
      untangle
    ];
  };
  jungle = buildMix {
    name = "jungle";
    version = "cb530870f04cf09f581aa7dda527753d2e9bd82e";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "jungle";
      rev = "cb530870f04cf09f581aa7dda527753d2e9bd82e";
      hash = "sha256-xcCnSsjFkgRAn5FSI0L6d+1H+clfxgPJ7H1CxyyiLZw=";
    };
    beamDeps = with finalMixPkgs; [
    ];
  };
  linkify = buildMix {
    name = "linkify";
    version = "a8c14b67616e63326f901b25f80147a9dbaffd6b";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "linkify";
      rev = "a8c14b67616e63326f901b25f80147a9dbaffd6b";
      hash = "sha256-KTkFPVzgTpB4TIw6IVWidsHJ/bviC674nproky6FouM=";
    };
    beamDeps = with finalMixPkgs; [
      ex_doc
      untangle
    ];
  };
  mess = buildMix {
    name = "mess";
    version = "b213682c9adf58c1fa1ad7a9314cdbf2cbf1feab";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "mess";
      rev = "b213682c9adf58c1fa1ad7a9314cdbf2cbf1feab";
      hash = "sha256-yDN0CF5UTxKbddm3pFQjXLuOhgIKo7VR+Xh5JEQ8IoM=";
    };
    beamDeps = with finalMixPkgs; [
      igniter
      jungle
    ];
  };
  mfm_parser = buildMix {
    name = "mfm_parser";
    version = "360a30267a847810a63ab48f606ba227b2ca05f0";
    src = fetchgit {
      url = "https://akkoma.dev/AkkomaGang/mfm-parser";
      rev = "360a30267a847810a63ab48f606ba227b2ca05f0";
      hash = "sha256-VJn9/i3peMhA+F/LyuPa3biZx0LXBPH+GbDsOWIxYE0=";
    };
    beamDeps = with finalMixPkgs; [
    ];
  };
  needle = buildMix {
    name = "needle";
    version = "f8dfa30265e0d1b6e2a31dc0688fdbce36044a3b";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "needle";
      rev = "f8dfa30265e0d1b6e2a31dc0688fdbce36044a3b";
      hash = "sha256-GAfThwv//AqGBahzp8f1A70g5rKDdNX1WHvucfae6Ww=";
    };
    beamDeps = with finalMixPkgs; [
      ecto_sql
      ex_doc
      exto
      needle_uid
      telemetry
      typed_ecto_schema
    ];
  };
  needle_uid = buildMix {
    name = "needle_uid";
    version = "3ec02ce42d96498db286a619a31a40eda2df7fa7";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "needle_uid";
      rev = "3ec02ce42d96498db286a619a31a40eda2df7fa7";
      hash = "sha256-jf6PNnv74hx4GKQgmdThY1Sn4yet4DIPkeN4yVk6scw=";
    };
    beamDeps = with finalMixPkgs; [
      ecto
      needle_ulid
      pride
      untangle
    ];
  };
  needle_ulid = buildMix {
    name = "needle_ulid";
    version = "f26b7c782633e373bc61354d263b0eb7ba0151a4";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "needle_ulid";
      rev = "f26b7c782633e373bc61354d263b0eb7ba0151a4";
      hash = "sha256-1fvRtaIui9e8li+ZxbyZC1Aqo8UDX0jCEfEINPKbAJQ=";
    };
    beamDeps = with finalMixPkgs; [
      ecto
      ecto_sql
      ex_doc
      ex_ulid
    ];
  };
  nodeinfo = buildMix {
    name = "nodeinfo";
    version = "0b2521e3d2559253b6133ba31c7c86a858587cc4";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "nodeinfo";
      rev = "0b2521e3d2559253b6133ba31c7c86a858587cc4";
      hash = "sha256-H7Np3mWsbuZDxEbDIZayMX+hRLuOq4Z58QKZyEEZ6Ig=";
    };
    beamDeps = with finalMixPkgs; [
      gettext
      jason
      phoenix
      plug_cowboy
      postgrex
    ];
  };
  open_science = buildMix {
    name = "open_science";
    version = "aada2ae4c81a5fb9e1ae56ec081f3852f63f82a8";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "open_science";
      rev = "aada2ae4c81a5fb9e1ae56ec081f3852f63f82a8";
      hash = "sha256-Pq9ohmGyfLqoRY7KY358Qto4Hqh+IQpc4qEASsfu0ZI=";
    };
    beamDeps = with finalMixPkgs; [
      absinthe
      bonfire_open_science
      ember
      eqrcode
      ex_doc
      geo
      geo_postgis
      hackney
      httpoison
      owl
      phoenix
      phoenix_live_reload
      phoenix_live_view
      poison
      rustler_precompiled
      social
    ];
  };
  paginator = buildMix {
    name = "paginator";
    version = "faa9909568c86b74838ef5d036fecb003ea77c1f";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "paginator";
      rev = "faa9909568c86b74838ef5d036fecb003ea77c1f";
      hash = "sha256-wDsBGnGV4wqI02YBlZGlBEffKIMHU/ANtgzoKIWj+nU=";
    };
    beamDeps = with finalMixPkgs; [
      ecto
      ecto_sql
      ex_doc
      ex_machina
      inch_ex
      needle_uid
      plug_crypto
      postgrex
      untangle
    ];
  };
  phoenix_gon = buildMix {
    name = "phoenix_gon";
    version = "47db70596e42077f67b4b7a1df158322e65ee0ed";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "phoenix_gon";
      rev = "47db70596e42077f67b4b7a1df158322e65ee0ed";
      hash = "sha256-7ASitDGIJCmDjaE3q9Z7dyaR76BR4k7tU0GHYOyzUHE=";
    };
    beamDeps = with finalMixPkgs; [
      ex_doc
      jason
      phoenix_html
      phoenix_html_helpers
      plug
      recase
    ];
  };
  plug_http_validator = buildMix {
    name = "plug_http_validator";
    version = "dbc277f8a328bc44107174fb1770b1376337697a";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "plug_http_validator";
      rev = "dbc277f8a328bc44107174fb1770b1376337697a";
      hash = "sha256-6O8jq0YQdT3sGN59xie5RAuGLoHtLl3Qsw3SaXccw1Y=";
    };
    beamDeps = with finalMixPkgs; [
      dialyxir
      ex_doc
      plug
    ];
  };
  pseudo_gettext = buildMix {
    name = "pseudo_gettext";
    version = "295afac289d1bf3d4e0fe5cbe8490a5a7f2eebb1";
    src = fetchFromGitHub {
      owner = "tmbb";
      repo = "pseudo_gettext";
      rev = "295afac289d1bf3d4e0fe5cbe8490a5a7f2eebb1";
      hash = "sha256-nGw04np+LcUy1CdCwzHujOYazAv9Sx3Ec33yZ6/EW2w=";
    };
    beamDeps = with finalMixPkgs; [
      ex_doc
      floki
      gettext
      jason
      nimble_parsec
    ];
  };
  social = buildMix {
    name = "social";
    version = "275347990722ed939865f123b50ed3ba8718d2fe";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "social";
      rev = "275347990722ed939865f123b50ed3ba8718d2fe";
      hash = "sha256-5+ixOxdigifDNnXjy9gIuQNFG1N3bxj8+txgRavOLEE=";
    };
    beamDeps = with finalMixPkgs; [
      absinthe
      activity_pub
      bonfire_api_graphql
      bonfire_classify
      bonfire_data_shared_user
      bonfire_geolocate
      bonfire_invite_links
      bonfire_messages
      bonfire_open_id
      bonfire_search
      bonfire_ui_messages
      bonfire_ui_reactions
      ecto_sparkles
      ember
      eqrcode
      ex_doc
      ex_ulid
      forecastr
      geo
      geo_postgis
      hackney
      httpoison
      igniter
      mfm_parser
      needle
      needle_uid
      needle_ulid
      owl
      phoenix
      phoenix_live_reload
      phoenix_live_view
      poison
      rustler_precompiled
    ];
  };
  twinkle_star = buildMix {
    name = "twinkle_star";
    version = "476f464e38c5409438246ca15e42e44b527ca257";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "twinkle_star";
      rev = "476f464e38c5409438246ca15e42e44b527ca257";
      hash = "sha256-8IwnJkG3ML4v2yCCB8bo/0HpyA2EYKrbtnPg14aGuxY=";
    };
    beamDeps = with finalMixPkgs; [
      ex_marcel
      file_info
      hackney
      tree_magic
    ];
  };
  unfurl = buildMix {
    name = "unfurl";
    version = "30d8de8383ba3de71b796dc72aa80865d7ea5421";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "unfurl";
      rev = "30d8de8383ba3de71b796dc72aa80865d7ea5421";
      hash = "sha256-b70hkVUsa7WkzImGvCTdrDBZylQiHPPbC89yL1voTe0=";
    };
    beamDeps = with finalMixPkgs; [
      arrows
      benchee
      bypass
      ex_doc
      faviconic
      floki
      hackney
      jason
      plug_cowboy
      tesla
      untangle
    ];
  };
  untangle = buildMix {
    name = "untangle";
    version = "00c4aea4f8261bd9030a1585c60601b1a43cb5d9";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "untangle";
      rev = "00c4aea4f8261bd9030a1585c60601b1a43cb5d9";
      hash = "sha256-RB3r3YOlHTzdylN+fwjnXpoOe/7QjKQ0sqHsEEPY/vk=";
    };
    beamDeps = with finalMixPkgs; [
      decorator
      ex_doc
      process_tree
    ];
  };
  verbs = buildMix {
    name = "verbs";
    version = "afa4693964dae0d9aceb60a73f1766c6d4f68d25";
    src = fetchFromGitHub {
      owner = "shannonwells";
      repo = "verbs_ex";
      rev = "afa4693964dae0d9aceb60a73f1766c6d4f68d25";
      hash = "sha256-6edAt/lw4MMny8UsPmqJMEu0zrpF+9Halx4QXTUN3Ik=";
    };
    beamDeps = with finalMixPkgs; [
      ex_doc
    ];
  };
  voodoo = buildMix {
    name = "voodoo";
    version = "5488fecad465ede4e7e775e45010fa8cec118060";
    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "voodoo";
      rev = "5488fecad465ede4e7e775e45010fa8cec118060";
      hash = "sha256-532HMCwhEdWDFlU69x2tVt6EVvZ0inknh/PrCITfUv0=";
    };
    beamDeps = with finalMixPkgs; [
    ];
  };
}
