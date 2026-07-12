{ ... }:

{
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

  home.file.".ssh/config".force = true;
}
