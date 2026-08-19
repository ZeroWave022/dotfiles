{
  description = "JavaFX development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      jfxNativeLibs = with pkgs; [
        libGL
        libx11
        libxtst
        libxxf86vm
      ];
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          temurin-bin-17
          maven
          gradle
        ];

        LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath jfxNativeLibs;
      };
    };
}
