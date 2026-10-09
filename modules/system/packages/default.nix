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
    postgresql_18
    temurin-bin-17
    wezterm

    (pkgs.python314.withPackages (
      python-pkgs: with python-pkgs; [
        pip
        matplotlib
        numpy
        pandas
        scikit-learn
        jupyter
      ]
    ))

    # Utilities
    lm_sensors

    # Containers
    winapps.packages."${stdenv.hostPlatform.system}".winapps
    winapps.packages."${stdenv.hostPlatform.system}".winapps-launcher
  ];

  systemd.tmpfiles.rules = [
    "d /run/postgresql 0755 martin users - -"
  ];

}
