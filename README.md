# dotfiles

NixOS configuration files and various dotfiles

## Setting up

These are mostly notes for future me when setting up NixOS on a new machine.

### Access to the secrets repo

Create/copy a GitHub PAT token with access to `dotfiles-secrets` and place it in `~/.config/nix/nix.conf` like so:

```
access-tokens = github.com=github_pat_token
```

This is so the system can fetch the private GitHub repo.

### Decrypting secrets

Generate an `age` key for the machine if needed:

```sh
# Using age directly
age-keygen -o /var/lib/sops-nix/key.txt
# Or convert an ssh ed25519 key to an age key
nix-shell -p ssh-to-age --run "ssh-to-age -private-key -i ~/.ssh/id_ed25519 > /var/lib/sops-nix/key.txt"
```

Add the host to the `.sops.yaml` file in the `dotfiles-secrets` repo, and re-encrypt the secrets:

```sh
nix-shell -p sops --run "sops updatekeys example.yaml"
```

### Switching to the configuration

Next, switch to the configuration using the following command:

```sh
nixos-rebuild switch --sudo --flake .#hostname
```

Replace `switch` with `build` in order to check if the config builds first.
Useful after upgrading the lockfile.

Using `--sudo` instead of `sudo` directly so the `nix.conf` file is used correctly.
Instead of looking in the `root` user's home directory, it will look in our home directory.
When the configuration is built and changes are about to be applied, we will be asked for the password if needed.

### Maintenance

To upgrade packages, run:

```sh
nix flake update
```

Append `<name>` at the end to update one specific flake.
