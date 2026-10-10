{
  pkgs,
  winapps,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    winapps.packages."${stdenv.hostPlatform.system}".winapps
    winapps.packages."${stdenv.hostPlatform.system}".winapps-launcher
  ];
}
