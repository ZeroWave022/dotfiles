{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [ postgresql_18 ];

  systemd.tmpfiles.rules = [
    "d /run/postgresql 0755 martin users - -"
  ];
}
