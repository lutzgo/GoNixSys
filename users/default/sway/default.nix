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

  programs = let colorscheme = config.colorscheme; in {

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

  wayland.windowManager.sway = let colorscheme = config.colorscheme; in {
    enable = true;
    systemdIntegration = true;
    wrapperFeatures.gtk = true;
    config = {

      colors = {
        background = "#${colorscheme.colors.base00}";
        focused = {
          background = "#${colorscheme.colors.base10}";
          border = "#${colorscheme.colors.base09}";
          childBorder = "#${colorscheme.colors.base10}";
          indicator = "#${colorscheme.colors.base08}";
          text = "#${colorscheme.colors.base06}";
        };
        focusedInactive = {
          background = "#${colorscheme.colors.base02}";
          border = "#${colorscheme.colors.base00}";
          childBorder = "#${colorscheme.colors.base02}";
          indicator = "#${colorscheme.colors.base01}";
          text = "#${colorscheme.colors.base06}";
        };
        placeholder = {
          background = "#${colorscheme.colors.base00}";
          border = "#${colorscheme.colors.base00}";
          childBorder = "#${colorscheme.colors.base00}";
          indicator = "#${colorscheme.colors.base00}";
          text = "#${colorscheme.colors.base06}";
        };
        unfocused = {
          background = "#${colorscheme.colors.base00}";
          border = "#${colorscheme.colors.base00}";
          childBorder = "#${colorscheme.colors.base00}";
          indicator = "#${colorscheme.colors.base00}";
          text = "#${colorscheme.colors.base03}";
          };
        urgent = {
          background = "#${colorscheme.colors.base11}";
          border = "#${colorscheme.colors.base01}";
          childBorder = "#${colorscheme.colors.base11}";
          indicator = "#${colorscheme.colors.base11}";
          text = "#${colorscheme.colors.base06}";
        };
      }

      fonts = {
        names = [ "Roboto" ];
        style = "Regular Bold";
        size = 12.0;
      };

      #### Gaps ####
      gaps = {
        inner = 5;
        outer = 5;
        smartBorders = "on";
      };

      #### Borders ####
      floating.border = 1;
      window.border = 1;

      bars = [ ];


      input = {
        "*" = {
          xkb_layout = "de";
        };
      };

      menu = "fuzzel";

      modifier = "Mod4";

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

      terminal = "foot";

    };

    homePackages = with pkgs; [
        brightnessctl
        fuzzel
        grim
        kanshi
        mako
        slurp
        swaylock
        # swayidle
        waybar
        wl-clipboard
        wofi
        wofi-emoji
      ];

  };

}