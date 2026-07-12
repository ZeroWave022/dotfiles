{ ... }:

{
  imports = [
    ./desktop
    ./git
    ./home
    ./programs
    ./secrets
    ./ssh
    ./xdg
    ./zsh
  ];

  programs.home-manager.enable = true;
}
