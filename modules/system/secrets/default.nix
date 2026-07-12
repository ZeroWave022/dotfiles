# Secrets used in the NixOS modules configuration.
# May contain duplicates of secrets used the home-manager configuration,
# if they're needed in both places.

{ inputs, ... }:

{
  sops.defaultSopsFile = inputs.self + /secrets/secrets.yaml;
  # This will automatically import SSH keys as age keys
  #sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
  # This is using an age key that is expected to already be in the filesystem
  sops.age.keyFile = "/var/lib/sops-nix/key.txt";
  # This will generate a new key if the key specified above does not exist
  sops.age.generateKey = false;
  # This is the actual specification of the secrets.
  sops.secrets = {
    wg-config-file = {
      mode = "0600";
    };
  };
}
