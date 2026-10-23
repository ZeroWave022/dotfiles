{ ... }:

{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = "firefox.desktop";
      "application/x-ipynb+json" = "code.desktop";
      "text/plain" = "org.kde.kwrite.desktop";
    };
  };

  xdg.configFile."mimeapps.list".force = true;
}
