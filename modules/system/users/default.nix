{ pkgs, ... }:

{
  users.users."martin" = {
    isNormalUser = true;
    description = "Martin";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    shell = pkgs.zsh;
  };
}
