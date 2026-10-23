{ inputs, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.self.nixosModules.laptop
    inputs.self.nixosModules.flatpak
    inputs.self.nixosModules.gaming.minecraft
    inputs.self.nixosModules.packages.dev
    inputs.self.nixosModules.packages.postgres
    inputs.self.nixosModules.packages.python
    inputs.self.nixosModules.packages.winapps
    inputs.self.nixosModules.virtualisation.virtualbox
  ];

  home-manager.users.${config.local.username}.imports = [
    inputs.self.homeManagerModules.desktop
    inputs.self.homeManagerModules.packages
    inputs.self.homeManagerModules.programs
    inputs.self.homeManagerModules.winapps
    inputs.self.homeManagerModules.laptop.input
  ];

  local.python = {
    extraPackages =
      python-pkgs: with python-pkgs; [
        jupyter
        keras
        matplotlib
        numpy
        pandas
        pydot
        scikit-learn
      ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
}
