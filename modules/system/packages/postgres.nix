{
  pkgs,
  config,
  ...
}:

{
  environment.systemPackages = with pkgs; [ postgresql_18 ];

  systemd.tmpfiles.rules = [
    "d /run/postgresql 0755 ${config.local.username} users - -"
  ];
}
