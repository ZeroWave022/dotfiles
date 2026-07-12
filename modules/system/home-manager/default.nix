{ inputs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.martin = import (inputs.self + /modules/user);
    sharedModules = [
      inputs.plasma-manager.homeModules.plasma-manager
      inputs.sops-nix.homeManagerModules.sops
    ];
  };
}
