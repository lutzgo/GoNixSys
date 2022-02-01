{ config, pkgs, lib, ... }:

{

  environment = {
    systemPackages = with pkgs; [
      #### Display-Manager #### 
      greetd.gtkgreet
      sway
    ];
  };
}
