{ ... }:

{
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
}
