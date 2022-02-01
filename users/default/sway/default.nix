{ config, pkgs, fetchurl, ... }:

{

  wayland.windowManager.sway = {
    config = {
      floating.border = 1;
      gaps = {
        smartBorders = "on";
        smartGaps = true;
      };
      window.border = 1;
    };
  };

}