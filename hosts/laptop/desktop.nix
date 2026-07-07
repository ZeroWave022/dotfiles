{ config, pkgs, ... }:

{
  programs.plasma = {
    enable = true;

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      theme = "breeze-dark";
    };

    input.mice = [
      {
        acceleration = 0.5;
        accelerationProfile = "default";
        enable = true;
        leftHanded = false;
        middleButtonEmulation = false;
        name = "ELAN06FA:00 04F3:3138 Mouse";
        naturalScroll = true;
        productId = "3138";
        scrollSpeed = 0.5;
        vendorId = "04f3";
      }
    ];

    input.touchpads = [
      {
        accelerationProfile = "default";
        disableWhileTyping = true;
        enable = true;
        leftHanded = false;
        middleButtonEmulation = false;
        name = "ELAN06FA:00 04F3:3138 Touchpad";
        naturalScroll = true;
        pointerSpeed = 0;
        productId = "3138";
        tapToClick = true;
        rightClickMethod = "bottomRight";
        scrollMethod = "twoFingers";
        scrollSpeed = 0.5;
        tapAndDrag = true;
        tapDragLock = false;
        twoFingerTap = "rightClick";
        vendorId = "04f3";
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
