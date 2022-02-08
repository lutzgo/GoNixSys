{ config, pkgs, lib, ... }:

{

  programs = {
    kdeconnect.enable = true;
  };

  services = {
      xserver = {
        enable = true;
        displayManager = {
          sddm = {
            enable = true;
            settings.Wayland.SessionDir = "${pkgs.plasma5Packages.plasma-workspace}/share/wayland-sessions";
          };
        };
        desktopManager.plasma5 = {
          enable = true;
          mobile.enable = true;
          runUsingSystemd = true;
          useQtScaling = true;
        };
        # layout = "de";
        # videoDrivers = [ "nvidia"];
      };

  };

}