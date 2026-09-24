# Secrets used in the NixOS modules configuration.
# May contain duplicates of secrets used the home-manager configuration,
# if they're needed in both places.

{ inputs, config, ... }:

{
  sops.defaultSopsFile = inputs.secrets + /default.yaml;
  # This will automatically import SSH keys as age keys
  #sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
  # This is using an age key that is expected to already be in the filesystem
  sops.age.keyFile = "/var/lib/sops-nix/key.txt";
  # This will generate a new key if the key specified above does not exist
  sops.age.generateKey = false;
  # This is the actual specification of the secrets.
  sops.secrets = {
    wg-config-file = {
      sopsFile = inputs.secrets + /wireguard.yaml;
      mode = "0600";
    };
    winapps-env = {
      sopsFile = inputs.secrets + /winapps.yaml;
      # Set owner explicitly so the file can be read when running the container
      owner = config.users.users.martin.name;
      path = "/run/secrets/winapps.env";
    };
  };
}
