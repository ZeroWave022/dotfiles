{ osConfig, ... }:

{
  programs.zsh = {
    enable = true;
    localVariables = {
      DEFAULT_USER = osConfig.local.username;
    };
    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
    };
  };
}
