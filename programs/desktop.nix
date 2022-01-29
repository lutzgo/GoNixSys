{ config, pkgs, lib, ... }:

{
  services = {
    xserver = {
      enable = true;
      # Configure keymap in X11
      layout = "de";
      # Enable touchpad support (enabled default in most desktopManager).
      #libinput.enable = true;
      # displayManager = {
      #   defaultSession = "sway";
      #   gdm = {
      #     enable = true;
      #     wayland = true;
      #   };
      # };
      # desktopManager = {
      #   plasma5.enable = true;
      #   gnome.enable = true;
      # };
    };
    # gnome = {
    #   sushi.enable = true;
    #   gnome-keyring.enable = true;
    # };
    # flatpak.enable = true;
  };

  programs = {
    # enable dconf for setting GTK themes via home manager
    dconf.enable = true;
    # java.enable = true;
    # light.enable = true;
    xwayland.enable = true;
    # wshowkeys.enable = false;
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };
    # file-roller.enable = true;
    # seahorse.enable = false;
    # gnome-disks.enable = true;
    #gnome-documents.enable = true;
    # evince.enable = true;
    # geary.enable = true;
    # kdeconnect.enable = true;
    # Some programs need SUID wrappers, can be configured further or are started in user sessions.
    #mtr.enable = true;
  };

  # qt5 = {
  #   enable = true;
  #   platformTheme = "gnome";
  #   style = "adwaita-dark";
  # };

  # xdg = {
  #   portal.wlr.enable = true;
  # };

}