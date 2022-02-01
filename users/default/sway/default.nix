{ config, pkgs, fetchurl, ... }:

let
  colorScheme = import ../../../color-schemes/nord.nix;
  #background = "$HOME/.cache/backgrounds/nix-wallpaper-3d-showcase.png";
  background = "$HOME/.cache/backgrounds/greatwave_nord.jpg";
  modifier = "Mod4";
  left = "h";
  down = "j";
  up = "k";
  right = "l";
  resizeAmount = "30px";
  menu = "wofi";
  filebrowser = "nemo";
  webbrowser = "brave";
  webbrowserPersistent = "firefox";
  musicplayer = "spotify";
in {

  wayland.windowManager.sway = {
    config = {
      floating.border = 1;
      gaps = {
        smartBorders = "on";
        smartGaps = true;
      };
      window.border = 1;

      #### Keys ####
      menu = menu;
      modifier = modifier;
      left = left;
      down = down;
      up = up;
      right = right;

      # Exit sway (logs you out of your Wayland session)
      "${modifier}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";
      # Reload the configuration file
      "${modifier}+Shift+r" = "reload";
      # Kill focused window
      "${modifier}+Shift+q" = "kill";
      "${modifier}+d" = "exec ${menu}";
      # Launch the default terminal. $TERM is defined in ../alacritty.nix line 11
      "${modifier}+x" = "exec foot";

      # Brightness
      bindsym XF86MonBrightnessDown exec "brightnessctl set 2%-"
      bindsym XF86MonBrightnessUp exec "brightnessctl set +2%"

      # Volume
      bindsym XF86AudioRaiseVolume exec 'pactl set-sink-volume @DEFAULT_SINK@ +1%'
      bindsym XF86AudioLowerVolume exec 'pactl set-sink-volume @DEFAULT_SINK@ -1%'
      bindsym XF86AudioMute exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle'

      # Moving around
      ## Move your focus around
      "${modifier}+${left}" = "focus left";
      "${modifier}+${down}" = "focus down";
      "${modifier}+${up}" = "focus up";
      "${modifier}+${right}" = "focus right";
      
      ### With arrow keys
      "${modifier}+Left" = "focus left";
      "${modifier}+Down" = "focus down";
      "${modifier}+Up" = "focus up";
      "${modifier}+Right" = "focus right";
      
      ## Move the focused window with the same, but add Shift
      "${modifier}+Shift+${left}" = "focus left";
      "${modifier}+Shift+${down}" = "focus down";
      "${modifier}+Shift+${up}" = "focus up";
      "${modifier}+Shift+${right}" = "focus right";
      
      ### With arrow keys
      "${modifier}+Shift+Left" = "focus left";
      "${modifier}+Shift+Down" = "focus down";
      "${modifier}+Shift+Up" = "focus up";
      "${modifier}+Shift+Right" = "focus right";
    };
  };

}