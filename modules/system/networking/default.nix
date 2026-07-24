{ config, pkgs, ... }:

let
  wgCmd = pkgs.writeShellApplication {
    name = "wg";

    text = ''
      if [[ "''${1:-}" == "up" ]]; then
        sudo systemctl start wg-quick-wg0.service
      elif [[ "''${1:-}" == "down" ]]; then
        sudo systemctl stop wg-quick-wg0.service
      else
        echo "Usage: $(basename "$0") <up|down>"
        exit 1
      fi
    '';
  };
in
{
  networking.networkmanager = {
    enable = true;
    wifi.powersave = false;
  };

  networking.firewall = {
    allowedUDPPorts = [ 51820 ];
  };

  networking.wg-quick.interfaces = {
    wg0 = {
      configFile = config.sops.secrets.wg-config-file.path;
      autostart = false;
    };
  };

  environment.systemPackages = [
    wgCmd
  ];
}
