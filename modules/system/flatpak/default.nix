{ ... }:

{
  services.flatpak = {
    enable = true;
    packages = [
      "com.mojang.Minecraft"
    ];
  };
}
