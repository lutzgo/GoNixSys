{ config, pkgs, ... }:

{
  programs.foot = let colorscheme = config.colorscheme; in { 
    enable = true;
    server.enable = true;
    settings = {
      main = {
        shell= "fish";
        term = "foot";

        app-id = "foot";
        title = "foot";

        font = "Fira Code:size=11";
        box-drawings-uses-font-glyphs = "no";
        bold-text-in-bright = "yes";
        dpi-aware = "yes";
      };

      mouse = {
        hide-when-typing = "yes";
      };

      colors = {
        background = "#${colorscheme.colors.base00}";
        foreground = "#${colorscheme.colors.base05}";
      };
    };
  };

}
