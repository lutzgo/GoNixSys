{ config, pkgs, fetchurl, ... }:

let
  background = "$HOME/.cache/backgrounds/greatwave_nord.jpg";
  menu = "dmenu";
  modifier = "Mod4";
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

    mako = {
      enable = true;
    };

    waybar = {
      enable = true;
      systemd = {
        enable = true;
        target = "sway-session.target";
      };
    };

  };

  services = {
    kanshi = {
      enable = true;
      systemdTarget = "sway-session.target";
    };
  };

  wayland.windowManager.sway = {
    enable = true;
    systemdIntegration = true;
    config = {

      fonts = {
        names = [ "Roboto" ];
        style = "Regular Bold";
        size = 12.0;
      };

      gaps = {
        outer = 5;
        smartBorders = "on";
        smartGaps = true;
      };
      floating.border = 1;
      window.border = 1;
      bars = [ ];


      input = {
        "*" = {
          xkb_layout = "de";
        };
      };

      menu = menu;
      modifier = modifier;

      keybindings = {
        # Exit sway (logs you out of your Wayland session)
        "${modifier}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";
        # Reload the configuration file
        "${modifier}+Shift+r" = "reload";
        # Kill focused window
        "${modifier}+Shift+q" = "kill";
        "${modifier}+d" = "exec ${menu}";
        # Launch the default terminal. $TERM is defined in ../alacritty.nix line 11
        "${modifier}+x" = "exec foot-client";
      };

      output = {
        "*" = { bg = "${background} fit #000000"; };
      };

    };
  };

}