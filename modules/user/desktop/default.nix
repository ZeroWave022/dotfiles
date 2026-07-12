{ config, pkgs, ... }:

{
  programs.plasma = {
    enable = true;

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      theme = "breeze-dark";
      wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Nexus/contents/images_dark/5120x2880.png";
    };

    kscreenlocker.appearance.wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/ScarletTree/contents/images_dark/5120x2880.png";

    panels = [
      {
        alignment = "left";
        floating = true;
        height = 46;
        hiding = "normalpanel";
        location = "bottom";
        opacity = "adaptive";

        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.pager"
          {
            iconTasks = {
              launchers = [
                "applications:systemsettings.desktop"
                "applications:org.kde.dolphin.desktop"
                "applications:org.wezfurlong.wezterm.desktop"
                "applications:code.desktop"
                "applications:obsidian.desktop"
                "applications:spotify.desktop"
                "applications:firefox.desktop"
              ];
            };
          }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
          "org.kde.plasma.showdesktop"
        ];
      }
    ];

    desktop.widgets = [
      {
        config = {
          UserBackgroundHints = "ShadowBackground";
          ConfigDialog = {
            DialogHeight = 630;
            DialogWidth = 810;
          };
          Units = {
            pressureUnit = 5008;
            speedUnit = 9001;
            temperatureUnit = 6001;
            visibilityUnit = 2007;
          };
          WeatherStation = {
            placeDisplayName = "Trondheim, Norway, NO";
            placeInfo = "Trondheim, Norway, NO|3133880";
            provider = "bbcukmet";
          };
        };
        name = "org.kde.plasma.weather";

        position = {
          horizontal = 32;
          vertical = 32;
        };

        size = {
          width = 640;
          height = 416;
        };
      }

      {
        digitalClock = {
          position = {
            horizontal = 672;
            vertical = 80;
          };

          size = {
            width = 608;
            height = 80;
          };
        };
      }

      {
        config = {
          Agenda = {
            showWeekNumbers = true;
          };
          ConfigDialog = {
            DialogHeight = 630;
            DialogWidth = 810;
          };
        };

        name = "org.kde.plasma.calendar";

        position = {
          horizontal = 1280;
          vertical = 0;
        };

        size = {
          width = 640;
          height = 448;
        };
      }

      {
        systemMonitor = {
          position = {
            horizontal = 1328;
            vertical = 464;
          };

          size = {
            width = 224;
            height = 400;
          };

          title = "Individual Core Usage";
          displayStyle = "org.kde.ksysguard.barchart";

          sensors = [
            {
              name = "cpu/cpu0/usage";
              color = "61,174,233";
              label = "Core 1";
            }
            {
              name = "cpu/cpu1/usage";
              color = "77,61,233";
              label = "Core 2";
            }
            {
              name = "cpu/cpu2/usage";
              color = "206,61,233";
              label = "Core 3";
            }
            {
              name = "cpu/cpu3/usage";
              color = "233,61,131";
              label = "Core 4";
            }
            {
              name = "cpu/cpu4/usage";
              color = "233,120,61";
              label = "Core 5";
            }
            {
              name = "cpu/cpu5/usage";
              color = "217,233,61";
              label = "Core 6";
            }
            {
              name = "cpu/cpu6/usage";
              color = "88,233,61";
              label = "Core 7";
            }
            {
              name = "cpu/cpu7/usage";
              color = "61,233,163";
              label = "Core 8";
            }
          ];

          totalSensors = [ "cpu/all/usage" ];
        };
      }

      {
        systemMonitor = {
          position = {
            horizontal = 1664;
            vertical = 464;
          };

          size = {
            width = 224;
            height = 400;
          };

          title = "Network Speed";
          displayStyle = "org.kde.ksysguard.linechart";

          sensors = [
            {
              name = "network/all/download";
              color = "61,174,233";
              label = "Download";
            }
            {
              name = "network/all/upload";
              color = "233,120,61";
              label = "Upload";
            }
          ];
        };
      }
    ];
  };
}
