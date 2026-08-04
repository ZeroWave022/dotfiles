{ ... }:

{
  imports = [
    ./desktop
    ./git
    ./home
    ./programs
    ./secrets
    ./ssh
    ./syncthing
    ./xdg
    ./zsh
  ];

  programs.home-manager.enable = true;
}
