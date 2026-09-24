{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    winapps = {
      url = "github:winapps-org/winapps";
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
      nix-flatpak,
      winapps,
      ...
    }:
    let
      mkHost =
        hostname:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs winapps; };
          modules = [
            ./hosts/${hostname}
            ./modules/system
            home-manager.nixosModules.home-manager
            sops-nix.nixosModules.sops
            spicetify-nix.nixosModules.spicetify
            nix-flatpak.nixosModules.nix-flatpak
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
      nixosModules = {
        system = import ./modules/system;
        laptop = import ./modules/laptop;
      };
      homeManagerModules = {
        user = import ./modules/user;
        laptop = {
          input = import ./modules/laptop/input;
        };
      };
      nixosConfigurations = {
        laptop = mkHost "laptop";
      };
    };
}
