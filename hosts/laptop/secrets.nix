{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    age
  ];

  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  # This will automatically import SSH keys as age keys
  #sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
  # This is using an age key that is expected to already be in the filesystem
  sops.age.keyFile = "/var/lib/sops-nix/key.txt";
  # This will generate a new key if the key specified above does not exist
  sops.age.generateKey = false;
  # This is the actual specification of the secrets.
  sops.secrets = {
    git-gpg = {
      mode = "0600";
    };
    git-gpg-pass = {
      mode = "0600";
    };
    id_git = {
      mode = "0600";
      path = "/home/martin/.ssh/id_git";
    };
    id_git_ntnu = {
      mode = "0600";
      path = "/home/martin/.ssh/id_git_ntnu";
    };
    id_thinkcentre = {
      mode = "0600";
      path = "/home/martin/.ssh/id_thinkcentre";
    };
    id_hackerspace = {
      mode = "0600";
      path = "/home/martin/.ssh/id_hackerspace";
    };
    gluteus-hostname = { };
    gluteus-port = { };
    phoenix-hostname = { };
    phoenix-port = { };
    noodlebar-hostname = { };
    noodlebar-port = { };
    dingseboms-hostname = { };
    dingseboms-port = { };
    duppeditt-hostname = { };
    duppeditt-port = { };
    meieri-hostname = { };
    meieri-port = { };
    netrunner-hostname = { };
    netrunner-port = { };
  };

  systemd.user.services.replace-ssh-secrets = {
    Unit = {
      Description = "Replace SSH config placeholders with sops secrets";
      After = [ "sops-nix.service" ];
      Wants = [ "sops-nix.service" ];
    };

    Install = {
      WantedBy = [ "default.target" ];
    };

    Service = {
      Type = "oneshot";
      ProtectSystem = "strict";
      ProtectHome = false;
      NoNewPrivileges = true;
      ReadWritePaths = [ "/home/martin/.ssh" ];
      ExecStart = pkgs.writeShellScript "replace-ssh-secrets" ''
        SSH_CONFIG="${config.home.homeDirectory}/.ssh/config"
        if [ ! -f "$SSH_CONFIG" ]; then
          exit 0
        fi

        replacements=""
        for secret_path in \
          "${config.sops.secrets.gluteus-hostname.path}" "${config.sops.secrets.gluteus-port.path}" \
          "${config.sops.secrets.phoenix-hostname.path}" "${config.sops.secrets.phoenix-port.path}" \
          "${config.sops.secrets.noodlebar-hostname.path}" "${config.sops.secrets.noodlebar-port.path}" \
          "${config.sops.secrets.dingseboms-hostname.path}" "${config.sops.secrets.dingseboms-port.path}" \
          "${config.sops.secrets.duppeditt-hostname.path}" "${config.sops.secrets.duppeditt-port.path}" \
          "${config.sops.secrets.meieri-hostname.path}" "${config.sops.secrets.meieri-port.path}" \
          "${config.sops.secrets.netrunner-hostname.path}" "${config.sops.secrets.netrunner-port.path}"; do

          placeholder="SOPS_PLACEHOLDER_$(basename "$secret_path")"
          if [ -f "$secret_path" ]; then
            value=$(cat "$secret_path")
          else
            value=""
          fi
          replacements+="s|$placeholder|$value|g;"
        done

        sed -i "$replacements" "$SSH_CONFIG"
      '';
    };
  };

  systemd.user.services.add-gpg-key = {
    Unit = {
      Description = "Add GPG key from sops";
      After = [ "sops-nix.service" ];
      Wants = [ "sops-nix.service" ];
    };

    Install = {
      WantedBy = [ "default.target" ];
    };

    Service = {
      Type = "oneshot";
      ProtectSystem = "strict";
      ProtectHome = false;
      NoNewPrivileges = true;
      ReadWritePaths = [ "/home/martin/.gnupg" ];
      ExecStart = "${pkgs.gnupg}/bin/gpg --batch --passphrase-file ${config.sops.secrets.git-gpg-pass.path} --import ${config.sops.secrets.git-gpg.path}";
    };
  };
}
