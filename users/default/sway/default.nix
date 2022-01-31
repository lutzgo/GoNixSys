{ config, pkgs, fetchurl, ... }:

{

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true ;
  };
  home.packages = with pkgs; [
    sway
    swaylock
    swayidle
    wl-clipboard
    mako # notification daemon
    foot # Alacritty is the default terminal in the config
    wofi # Dmenu is the default in the config but i recommend wofi since its wayland native
];

}