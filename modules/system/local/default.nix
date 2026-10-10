{ lib, ... }:

{
  options.local.username = lib.mkOption {
    type = lib.types.str;
    description = "Primary username";
  };
}
