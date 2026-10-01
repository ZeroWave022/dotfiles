{
  pkgs,
  winapps,
  ...
}:

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

    # Containers
    winapps.packages."${stdenv.hostPlatform.system}".winapps
    winapps.packages."${stdenv.hostPlatform.system}".winapps-launcher
  ];
}
