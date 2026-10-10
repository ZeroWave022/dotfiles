{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    maven
    nixfmt
    nodejs_24
    pnpm
    temurin-bin-17
    wezterm
  ];
}
