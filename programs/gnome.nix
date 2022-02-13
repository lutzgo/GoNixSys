{ config, pkgs, lib, ... }:

{

  environment.gnome.excludePackages = with pkgs; [ 
    gnome.cheese 
    gnome-photos 
    gnome.gnome-music 
    gnome.gnome-terminal 
    gnome.gedit 
    epiphany 
    evince 
    gnome.gnome-characters 
    gnome.totem 
    gnome.tali 
    gnome.iagno 
    gnome.hitori 
    gnome.atomix 
    gnome-tour  
    gnome.geary
  ];

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