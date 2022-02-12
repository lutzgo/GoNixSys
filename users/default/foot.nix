{ config, pkgs, ... }:

{
  programs.foot = { 
    enable = true;
    server.enable = true;
    settings = {
      main = {
        shell= "fish";
        term = "foot";

        app-id = "foot";
        title = "foot";

        font = "Fira Code:size=11";
        box-drawings-uses-font-glyphs = "yes";
        bold-text-in-bright = "yes";
        dpi-aware = "yes";
      };

      mouse = {
        hide-when-typing = "yes";
      };
    };
  };

}
