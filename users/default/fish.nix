{ config, pkgs, lib, ... }:

{
  imports = [
    ./starship/default.nix
    ./console-helpers.nix
  ];

  programs = {
    fish = {
      enable = true;
      interactiveShellInit = "starship init fish | source";
      shellAliases = {
        "cat" = "bat";
        "codecat" = "prettybat";
        "diff" = "batdiff --delta";
        "grep" = "batgrep";
        "man" = "batman";
        "watch" = "batwatch";
      };
    };
  };
}