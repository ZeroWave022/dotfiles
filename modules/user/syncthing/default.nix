{ config, osConfig, ... }:

{
  services.syncthing = {
    enable = true;

    cert = config.sops.secrets."syncthing-cert-${osConfig.networking.hostName}".path;
    key = config.sops.secrets."syncthing-key-${osConfig.networking.hostName}".path;

    overrideDevices = true;
    overrideFolders = true;

    settings = {
      devices = {
        Server = {
          id = "WBBMNL7-6MALVZV-BEOLWCY-P6DWK32-LLKUS4X-MSOEVCT-3XIZ4UU-IUPNUAK";
        };
        Desktop = {
          id = "TJE2UZD-SFWTEI6-ABCSUKJ-ETG6QSO-XEFNLOC-IJCAUX4-I23A6JT-T6YFCAG";
        };
        Laptop = {
          id = "LAHGM3A-GB5BDW2-SC3VBQE-NBY2ZZM-AFYMD6L-ELL55NN-ULLRBL7-5ZGRUAY";
        };
        Phone = {
          id = "KYZLA54-2BTTLSH-2BOBF74-VV2KOJQ-5YYDQCS-JQVPVSV-RCTYXW6-7PAQCQT";
        };
      };
      folders = {
        Main = {
          enable = true;
          id = "vt3hm-nyfyv";
          devices = [
            "Server"
            "Desktop"
            "Laptop"
          ];
          path = "~/syncthing/main";
          order = "smallestFirst";
          versioning = {
            type = "simple";
            params.keep = "5";
          };
        };
        Camera = {
          enable = true;
          id = "ptcvs-es62c";
          devices = [
            "Server"
            "Desktop"
            "Laptop"
            "Phone"
          ];
          path = "~/syncthing/camera";
          type = "receiveonly";
          order = "smallestFirst";
          versioning = {
            type = "simple";
            params.keep = "5";
          };
        };
      };
    };
  };
}
