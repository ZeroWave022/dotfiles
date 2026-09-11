{ pkgs, ... }:

{
  users.users."martin" = {
    isNormalUser = true;
    description = "Martin";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "vboxusers"
    ];
    shell = pkgs.zsh;
  };
}
