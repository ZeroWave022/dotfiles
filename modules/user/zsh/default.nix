{ ... }:

{
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
}
