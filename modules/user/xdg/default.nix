{ ... }:

{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/plain" = "code.desktop";
      "application/pdf" = "firefox.desktop";
    };
  };
}
