{
  lib,
  beamPackages,
  fetchFromGitHub,
  writeTextDir,
  rustPlatform,
  ...
}:
# Explanation: so far, dependencies are extracted in each repository with:
# 1. rm -f mix.lock; HEX_OFFLINE= mix deps.get
# 2. sed mix.lock -ne 's/^ *"\([^ "]*\)".*/\1/p'
# where:
# 1. Ensure mix.lock is not out of sync with mix.exs.
# 2. Extract the names of the dependencies.
#
# ToDo: more troubles ahead with repositories using mess.exs
let
  buildMix = lib.makeOverridable beamPackages.buildMix;
  fetchHex = beamPackages.fetchHex;
in
finalMixPkgs: previousMixPkgs: {
  connection = null;
  bonfire_data_edges = previousMixPkgs.bonfire_data_edges.override {
    beamDeps = with finalMixPkgs; [ needle ];
  };
  bonfire_data_identity = previousMixPkgs.bonfire_data_identity.override {
  };
  bonfire_common = previousMixPkgs.bonfire_common.override {
  };
  bonfire_api_graphql = previousMixPkgs.bonfire_api_graphql.override {
  };
  needle = previousMixPkgs.needle.override {
    beamDeps = with finalMixPkgs; [
      accessible
      db_connection
      decimal
      decorator
      earmark_parser
      ecto
      ecto_sql
      ex_doc
      ex_ulid
      exto
      makeup
      makeup_elixir
      makeup_erlang
      needle_uid
      needle_ulid
      nimble_parsec
      telemetry
      typed_ecto_schema
      untangle

    ];
  };
  needle_uid = previousMixPkgs.needle_uid.override {
    beamDeps = with finalMixPkgs; [
      connection
      db_connection
      decimal
      decorator
      earmark_parser
      ecto
      ecto_sql
      ex_doc
      ex_ulid
      makeup
      makeup_elixir
      makeup_erlang
      needle_ulid
      nimble_parsec
      pride
      telemetry
      untangle
    ];
  };

  # For needle_uid
  # Explanation: `pride` is not currently pinned in bonfire-app/mix.lock
  # yet required by `needle_uid`…
  pride = buildMix rec {
    name = "pride";
    version = src.rev;

    src = fetchFromGitHub {
      owner = "bonfire-networks";
      repo = "pride";
      rev = "0b7f989a9db61d5466ea573f181f08e18086ab72";
      hash = "sha256-zCQKO73mSYZiq6kDuGGKa9xK1TbENhsPJNWCk9gB2t8=";
    };

    beamDeps = with finalMixPkgs; [
      castore
      db_connection
      decimal
      decorator
      earmark_parser
      ecto
      ecto_sql
      ex_doc
      makeup
      makeup_elixir
      makeup_erlang
      nimble_parsec
      rustler_precompiled
      telemetry
      uniq
      untangle
      uuidv7
    ];
  };

  needle_ulid = previousMixPkgs.needle_ulid.override {
    beamDeps = with finalMixPkgs; [
      db_connection
      decimal
      earmark_parser
      ecto
      ecto_sql
      ex_doc
      ex_ulid
      makeup
      makeup_elixir
      makeup_erlang
      nimble_parsec
      telemetry
    ];
  };
  untangle = previousMixPkgs.untangle.override {
    beamDeps = with finalMixPkgs; [ decorator ];
  };
}
