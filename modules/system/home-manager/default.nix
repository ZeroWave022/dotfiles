{ inputs, config, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.${config.local.username} = import (inputs.self + /modules/user);
    sharedModules = [ inputs.sops-nix.homeManagerModules.sops ];
  };
}
