{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Development
    nixfmt
    nodejs_24
    pnpm
    python314
    wezterm

    # Utilities
    lm_sensors
  ];
}
