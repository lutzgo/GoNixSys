{ config, pkgs, lib, ... }:

{
  imports = [
    ./starship/default.nix
  ];

  programs = {
    fish = {
      enable = true;
      interactiveShellInit = "starship init fish | source";
    };
  };
}