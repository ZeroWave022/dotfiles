{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    claude-code
    maven
    nixfmt
    nodejs_24
    opencode
    pnpm
    temurin-bin-17
    wezterm
  ];
}
