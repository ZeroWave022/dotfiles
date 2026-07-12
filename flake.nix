{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      sops-nix,
      plasma-manager,
      spicetify-nix,
      ...
    }:
    let
      mkHost =
        hostname:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/${hostname}
            ./modules/system
            home-manager.nixosModules.home-manager
            sops-nix.nixosModules.sops
            spicetify-nix.nixosModules.spicetify
            {
              networking.hostName = hostname;
              nixpkgs.overlays = [ inputs.self.overlays.default ];
            }
          ];
        };
    in
    {
      overlays.default = final: prev: {
        synaTudor = final.callPackage ./pkgs/synaTudor { };
      };
      nixosConfigurations = {
        laptop = mkHost "laptop";
      };
    };
}
