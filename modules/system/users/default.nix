{
  lib,
  config,
  pkgs,
  ...
}:

let
  capitalizeFirstLetter =
    str: (lib.toUpper (builtins.substring 0 1 str)) + (builtins.substring 1 (lib.stringLength str) str);
in

{
  users.users.${config.local.username} = {
    isNormalUser = true;
    description = capitalizeFirstLetter config.local.username;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "vboxusers"
    ];
    shell = pkgs.zsh;
  };
}
