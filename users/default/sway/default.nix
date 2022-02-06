{ config, pkgs, fetchurl, ... }:

# let
#   # colorScheme = import ../../../color-schemes/nord.nix;
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
# in
{

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
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