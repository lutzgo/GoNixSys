{ config, pkgs, fetchurl, ... }:

{

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

  };

  services = {
    kanshi = {
      enable = true;
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

      input = {
        "*" = {
          xkb_layout = "de";
          xkb_variant = "nodeadkeys";
          xkb_options = "grp:alt_shift_toggle";
          xkb_numlock = "enable";
        };
      };
      
    };
  };

}