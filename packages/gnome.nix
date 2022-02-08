{ config, pkgs, lib, ... }:

{

  environment = {
    gnome.excludePackages = with pkgs; [
      epiphany
      gnome.atomix
      gnome-geary
      gnome.gedit
      gnome.gnome-characters
      gnome.gnome-maps
      gnome.gnome-music
      gnome.gnome-software
      gnome.gnome-terminal
      gnome.gnome-weather
      gnome.hitori
      gnome.iagno
      gnome-photos
      gnome.tali
      gnome.totem
      gnome-tour
      gnome-user-docs
      xterm
      yelp
      ];
    
    systemPackages = with pkgs; [
      foot
      gnome.gnome-tweaks
      gnomeExtensions.appindicator
      polkit_gnome
      vlc
   ];

  };

}
