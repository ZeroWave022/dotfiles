{ ... }:

{
  imports = [
    ./git
    ./home
    ./secrets
    ./ssh
    ./syncthing
    ./xdg
    ./zsh
  ];

  programs.home-manager.enable = true;
}
