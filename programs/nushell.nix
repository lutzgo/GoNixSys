{ config, pkgs, ... }:

{

  programs.nushell = { 
    enable = true;
    settings = {
      startup = [ "config set prompt { starship prompt }" ];
    };
  };
}
