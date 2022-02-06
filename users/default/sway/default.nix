{ config, pkgs, fetchurl, ... }:

let
  colorScheme = import ../../../color-schemes/nord.nix;
#   #background = "$HOME/.cache/backgrounds/nix-wallpaper-3d-showcase.png";
#   # background = "$HOME/.cache/backgrounds/greatwave_nord.jpg";
#   modifier = "Mod4";
#   left = "h";
#   down = "j";
#   up = "k";
#   right = "l";
#   resizeAmount = "30px";
#   menu = "wofi";
#   # filebrowser = "nemo";
#   webbrowser = "brave";
#   # webbrowserPersistent = "firefox";
#   # musicplayer = "spotify";
in
{

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = {
      gaps = {
        smartBorders = "on";
        smartGaps = true;
      };
      floating.border = 1;
      window.border = 1;
      bars = [ ];
      colors = {
        focused = {
          background = colorScheme.green;
          border = colorScheme.greenBright;
          childBorder= colorScheme.green;
          indicator = colorScheme.green;
          text = colorScheme.black;
        };
        focusedInactive = {
          background = colorScheme.yellow;
          border = colorScheme.yellowBright;
          childBorder= colorScheme.yellow;
          indicator = colorScheme.yellow;
          text = colorScheme.black;
        };
        unfocused = {
          background = colorScheme.magenta;
          border = colorScheme.magentaBright;
          childBorder= colorScheme.magenta;
          indicator = colorScheme.magenta;
          text = colorScheme.black;
        };
        urgent = {
          background = colorScheme.red;
          border = colorScheme.redBright;
          childBorder= colorScheme.red;
          indicator = colorScheme.red;
          text = colorScheme.black;
        };
        background = colorScheme.black;
      };
    };
  };

  home.packages = with pkgs; [
      brightnessctl
      dmenu
      foot
      grim
      kanshi
      mako
      slurp
      swaylock
      swayidle
      waybar
      wl-clipboard
      wofi
      wofi-emoji
    ];

}