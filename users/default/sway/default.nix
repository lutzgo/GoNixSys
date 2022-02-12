{ config, pkgs, fetchurl, ... }:

let
  background = "$HOME/.cache/backgrounds/greatwave_nord.jpg";
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

      keybindings = {
        # Exit sway (logs you out of your Wayland session)
        "Mod4+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";
        # Reload the configuration file
        "Mod4+Shift+r" = "reload";
        # Kill focused window
        "Mod4+Shift+q" = "kill";
        "Mod4+d" = "exec dmenu";
        # Launch the default terminal. $TERM is defined in ../alacritty.nix line 11
        "Mod4+x" = "exec foot";
      };

      output = {
        "*" = { bg = "${background} fit #000000"; };
      };

      startup = [
        # Status bar: waybar
        { command = "export SWAYSOCK=/run/user/1000/sway-ipc.1000.(pgrep -f 'sway').so"; }
        # Notification daemon
        { command = "export WLR_NO_HARDWARE_CURSORS=1"; }
        # Polkit
        # { command = "/run/current-system/sw/libexec/polkit-gnome-authentication-agent-1"; }
      ];

    };
  };

}