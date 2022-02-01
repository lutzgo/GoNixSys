{ config, pkgs, lib, ... }:

{

  environment = {
    systemPackages = with pkgs; [
      #### Display-Manager #### 
      gnome.gdm
      sway
    ];
  };
}
