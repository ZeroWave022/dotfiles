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
    secrets = {
      url = "github:ZeroWave022/dotfiles-secrets";
      flake = false;
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
        common = import ./modules/system;
        flatpak = import ./modules/system/flatpak;
        gaming.minecraft = import ./modules/system/gaming/minecraft.nix;
        packages.dev = import ./modules/system/packages/dev.nix;
        packages.postgres = import ./modules/system/packages/postgres.nix;
        packages.python = import ./modules/system/packages/python.nix;
        packages.winapps = import ./modules/system/packages/winapps.nix;
        virtualisation.virtualbox = import ./modules/system/virtualisation/virtualbox.nix;
        laptop = import ./modules/laptop;
      };
      homeManagerModules = {
        common = import ./modules/user;
        desktop = import ./modules/user/desktop;
        packages = import ./modules/user/packages;
        programs = import ./modules/user/programs;
        winapps = import ./modules/user/winapps;
        laptop = {
          input = import ./modules/laptop/input;
        };
      };
      nixosConfigurations = {
        laptop = mkHost "laptop";
      };
    };
}
