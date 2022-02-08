{ config, pkgs, lib, ... }:

{

  services = {
      xserver = {
        enable = true;
        displayManager = {
          gdm.enable = true;
          gdm.wayland = true;
          # gdm.nvidiaWayland = true;
          # autoLogin.enable = true;
          # autoLogin.user = "lgo";
        };
        desktopManager.gnome = {
          enable = true;
        };
        layout = "de";
        # videoDrivers = [ "nvidia"];
      };

    flatpak.enable = true;

    gnome.gnome-keyring.enable = true;

  };

  users.users.lgo.extraGroups = [ "flatpak" ];

  xdg.portal.enable = true;

}