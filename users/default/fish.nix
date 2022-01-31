{ config, pkgs, lib, ... }:

{
  # users.defaultUserShell = pkgs.fish;
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = "starship init fish | source";
    };
  };
}