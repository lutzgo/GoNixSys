{ config, pkgs, ... }:

{

  programs.starship = { 
    enable = true;
    settings = {
      add_newline = true
    };
  };
  home.file.".config/starship.toml".source = ./starship.toml;
}
