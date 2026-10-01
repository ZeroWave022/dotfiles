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
    temurin-bin-17
    wezterm

    (pkgs.python314.withPackages (
      python-pkgs: with python-pkgs; [
        pip
        matplotlib
        numpy
        jupyter
      ]
    ))

    # Utilities
    lm_sensors

    # Containers
    winapps.packages."${stdenv.hostPlatform.system}".winapps
    winapps.packages."${stdenv.hostPlatform.system}".winapps-launcher
  ];
}
