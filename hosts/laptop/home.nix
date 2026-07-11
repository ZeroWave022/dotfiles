{ config, pkgs, ... }:

{
  imports = [
    ./desktop.nix
    ./secrets.nix
  ];

  home.username = "martin";
  home.homeDirectory = "/home/martin";
  home.packages = with pkgs; [
    kdePackages.kate
  ];

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    localVariables = {
      DEFAULT_USER = "martin";
    };
    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "ZeroWave022";
        email = "36341766+ZeroWave022@users.noreply.github.com";
        signingkey = "856CEB5E83C18A0E";
      };
      commit = {
        gpgsign = true;
      };
      tag = {
        gpgSign = true;
      };
    };
  };

  home.file.".ssh/config".force = true;

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "github.com" = {
        HostName = "github.com";
        IdentityFile = "~/.ssh/id_git";
        AddKeysToAgent = "yes";
      };
      "git.ntnu.no" = {
        HostName = "git.ntnu.no";
        IdentityFile = "~/.ssh/id_git_ntnu";
        AddKeysToAgent = "yes";
      };
      "thinkcentre" = {
        HostName = "10.0.0.22";
        User = "martin";
        IdentityFile = "~/.ssh/id_thinkcentre";
        LocalForward = [
          {
            bind.port = 2233;
            host.address = "127.0.0.1";
            host.port = 2233;
          }
        ];
        AddKeysToAgent = "yes";
      };
      "gluteus" = {
        HostName = "SOPS_PLACEHOLDER_gluteus-hostname";
        Port = "SOPS_PLACEHOLDER_gluteus-port";
        User = "hackerspace";
        IdentityFile = "~/.ssh/id_hackerspace";
        AddKeysToAgent = "yes";
      };
      "phoenix" = {
        HostName = "SOPS_PLACEHOLDER_phoenix-hostname";
        Port = "SOPS_PLACEHOLDER_phoenix-port";
        User = "hackerspace";
        IdentityFile = "~/.ssh/id_hackerspace";
        AddKeysToAgent = "yes";
      };
      "noodlebar" = {
        HostName = "SOPS_PLACEHOLDER_noodlebar-hostname";
        Port = "SOPS_PLACEHOLDER_noodlebar-port";
        User = "hackerspace";
        IdentityFile = "~/.ssh/id_hackerspace";
        AddKeysToAgent = "yes";
      };
      "dingseboms" = {
        HostName = "SOPS_PLACEHOLDER_dingseboms-hostname";
        Port = "SOPS_PLACEHOLDER_dingseboms-port";
        User = "hackerspace";
        IdentityFile = "~/.ssh/id_hackerspace";
        AddKeysToAgent = "yes";
      };
      "duppeditt" = {
        HostName = "SOPS_PLACEHOLDER_duppeditt-hostname";
        Port = "SOPS_PLACEHOLDER_duppeditt-port";
        User = "hackerspace";
        IdentityFile = "~/.ssh/id_hackerspace";
        AddKeysToAgent = "yes";
      };
      "meieri" = {
        HostName = "SOPS_PLACEHOLDER_meieri-hostname";
        Port = "SOPS_PLACEHOLDER_meieri-port";
        User = "hackerspace";
        IdentityFile = "~/.ssh/id_hackerspace";
        AddKeysToAgent = "yes";
      };
      "netrunner" = {
        HostName = "SOPS_PLACEHOLDER_netrunner-hostname";
        Port = "SOPS_PLACEHOLDER_netrunner-port";
        User = "hackerspace";
        IdentityFile = "~/.ssh/id_hackerspace";
        AddKeysToAgent = "yes";
      };
    };
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/plain" = "code.desktop";
      "application/pdf" = "firefox.desktop";
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "26.05";
}
