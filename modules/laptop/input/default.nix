{ config, pkgs, ... }:

{
  programs.plasma = {
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
  };
}
