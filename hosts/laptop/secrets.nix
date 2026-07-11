{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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
    gitgpg = {
      owner = "martin";
      mode = "0600";
    };
    gitgpg-pass = {
      owner = "martin";
      mode = "0600";
    };
  };

  systemd.services.add-gpg-key = {
    wantedBy = [ "multi-user.target" ];
    after = [ "sops-nix.service" ];
    wants = [ "sops-nix.service" ];

    serviceConfig = {
      Type = "oneshot";
      User = "martin";
      ProtectSystem = "strict";
      ProtectHome = false;
      NoNewPrivileges = true;
      ReadWritePaths = [ "${config.users.users."martin".home}/.gnupg" ];
      ExecStart = "${pkgs.gnupg}/bin/gpg --batch --passphrase-file ${config.sops.secrets.gitgpg-pass.path} --import ${config.sops.secrets.gitgpg.path}";
    };
  };
}
