{ config, ... }:

{
  nix.settings = {
    auto-optimise-store = true;

    trusted-users = [
      "root"
      config.local.username
    ];

    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
