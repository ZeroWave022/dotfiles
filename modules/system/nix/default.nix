{ ... }:

{
  nix.settings = {
    auto-optimise-store = true;

    trusted-users = [
      "root"
      "martin"
    ];

    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
