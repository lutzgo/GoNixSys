{ config, pkgs, lib, ... }:

{
  users.defaultUserShell = pkgs.fish;
  programs = {
    fish = {
      enable = true;
      promptInit = "starship init fish | source";
      # shellInit = 
      # shellAliases = {
      #   alias z=__zoxide_z
      # };
    };
  };
}