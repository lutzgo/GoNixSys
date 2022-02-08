{ config, pkgs, ... }:

{
  programs.foot = { 
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "foot";

        app-id = "foot";
        title = "foot";

        font = "Iosevka:size=11";
        dpi-aware = "yes";
      };

      mouse = {
        hide-when-typing = "yes";
      };
    };
  };

}
