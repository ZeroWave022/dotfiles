{ ... }:

{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/plain" = "org.kde.kwrite.desktop";
      "application/pdf" = "firefox.desktop";
    };
  };
}
