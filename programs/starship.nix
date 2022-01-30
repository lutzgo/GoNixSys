{ config, pkgs, ... }:

{

  programs.starship = { 
    enable = true;
    settings = {
      add_newline = true;
      # format = lib.concatStrings [
      #   "$line_break"
      #   "$package"
      #   "$line_break"
      #   "$character"
      # ];
      scan_timeout = 10;
      character = {
        success_symbol = "➜";
        error_symbol = "➜";
      };
    };
  };
}
