{ ... }:

{
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "no,pl,us,es";
    variant = "";
    options = "grp:win_space_toggle";
  };

  console.keyMap = "no";
}
