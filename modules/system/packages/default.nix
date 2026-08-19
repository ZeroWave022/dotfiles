{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Development
    maven
    nixfmt
    nodejs_24
    pnpm
    python314
    temurin-bin-17
    wezterm

    # Utilities
    lm_sensors
  ];
}
