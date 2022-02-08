{ config, pkgs, ... }:

{
  programs.foot = { 
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";

        font = "Iosevka:size=11";
        dpi-aware = "yes";
      };

      mouse = {
        hide-when-typing = "yes";
      };
    };
  };

}
