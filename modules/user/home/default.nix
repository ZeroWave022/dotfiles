{ pkgs, ... }:

{
  home.username = "martin";
  home.homeDirectory = "/home/martin";
  home.packages = with pkgs; [
    # Development
    postman
    vscode

    # Social media, communication, and entertainment
    discord
    slack
    steam

    # Productivity
    kdePackages.kate
    libreoffice
    obsidian

    # Math
    geogebra

    # 3D modeling and printing, image editing
    # bambu-studio
    kdePackages.kolourpaint
    krita
    prusa-slicer

    # Utilities
    filezilla
    kdePackages.kamoso
    kdePackages.kcalc
    kdePackages.skanpage
    proton-vpn
    qbittorrent
    vlc
    wireshark
  ];

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
