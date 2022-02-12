{ config, pkgs, fetchurl, ... }:

let
  colorScheme = import ../../../color-schemes/nord.nix;
  background = "$HOME/.cache/backgrounds/greatwave_nord.jpg";
  modifier = "Mod4";
  left = "h";
  down = "j";
  up = "k";
  right = "l";
  resizeAmount = "30px";
  menu = "wofi";
  # filebrowser = "nemo";
  webbrowser = "brave";
  # webbrowserPersistent = "firefox";
  # musicplayer = "spotify";
in
{

  home = {
    file = {
      ".cache/backgrounds/greatwave_nord.jpg".source = ../../../backgrounds/greatwave_nord.jpg;
    };
  };

  programs = {
    fish = {
      loginShellInit = ''
        if test (id --user $USER) -ge 1000 && test (tty) = "/dev/tty1"
        exec sway
        end
      '';
    };
  };

  wayland.windowManager.sway = {
    config = {
      gaps = {
        outer = 5;
        smartBorders = "on";
        smartGaps = true;
      };
      floating.border = 1;
      window.border = 1;
      bars = [ ];
    };
  };

}