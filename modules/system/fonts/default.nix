{ pkgs, ... }:

{
  fonts.enableDefaultPackages = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
  ];
}
