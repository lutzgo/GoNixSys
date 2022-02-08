{ config, pkgs, lib, ... }:

{

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
          runUsingSystemd = true;
        };
        layout = "de";
        # videoDrivers = [ "nvidia"];
      };

  };

}