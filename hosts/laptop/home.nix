{ config, pkgs, ... }:

{
  imports = [
    ./desktop.nix
  ];

  home.username = "martin";
  home.homeDirectory = "/home/martin";
  home.packages = with pkgs; [
    kdePackages.kate
  ];

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "ZeroWave022";
        email = "36341766+ZeroWave022@users.noreply.github.com";
        signingkey = "856CEB5E83C18A0E";
      };
      commit = {
        gpgsign = true;
      };
      tag = {
        gpgSign = true;
      };
    };
  };

  programs.zsh = {
    enable = true;
    localVariables = {
      DEFAULT_USER = "martin";
    };
    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "26.05";
}
