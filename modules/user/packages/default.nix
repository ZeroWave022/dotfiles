{ pkgs, ... }:

{
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
    inkscape
    prusa-slicer

    # Gaming
    prismlauncher

    # Utilities
    burpsuite
    camunda-modeler
    fastfetch
    filezilla
    kdePackages.kamoso
    kdePackages.kcalc
    kdePackages.skanpage
    proton-vpn
    qbittorrent
    vlc
    wireshark
  ];
}
