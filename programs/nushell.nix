{ config, pkgs, ... }:

{

  programs.nushell = { 
    enable = true;
    settings = {
      prompt = "starship prompt";
    };
  };
}
