{ config, pkgs, lib, ... }:

{

  environment = {
    systemPackages = with pkgs; [
      #### Display-Manager #### 
      gnome.gdm
      polkit
      polkit_gnome
      sway
    ];
  };
}
