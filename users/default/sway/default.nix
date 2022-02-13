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

  wayland.windowManager.sway = {
    enable = true;
    systemdIntegration = true;
    wrapperFeatures.gtk = true;
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

      menu = fuzzel;

      modifier = Mod4;

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
        # wofi-emoji
      ];

  };

}