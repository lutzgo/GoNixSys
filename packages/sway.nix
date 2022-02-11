{ config, pkgs, lib, ... }:

{

  environment = {
    systemPackages = with pkgs; [
      #### Display-Manager #### 
      # greetd.greetd
      # greetd.gtkgreet
      polkit
      polkit_gnome
      sway
    ];
  };
}
