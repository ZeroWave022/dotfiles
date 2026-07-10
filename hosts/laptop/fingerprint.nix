{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    synaTudor
  ];

  services.dbus.packages = [ pkgs.synaTudor ];
  systemd.packages = [ pkgs.synaTudor ];

  # By default fprintd is activated on the first use.
  # But synaTudor takes a long time to startup which causes big delays on first authentication attempt.
  # Startup fprintd on boot instead.
  systemd.units."fprintd.service".wantedBy = [ "multi-user.target" ];

  services.fprintd = {
    enable = true;
    tod = {
      enable = true;
      driver = pkgs.synaTudor;
    };
  };
}
