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
        "catp" = "bat --plain --color";
        "codecat" = "prettybat";
        "diff" = "batdiff --delta";
        "du" = "dust";
        "find" = "fd … -X bat";
        "grep" = "batgrep";
        "man" = "batman";
        "ps" = "procs";
        "sed" = "sd";
        "tldr" = "tealdeer";
        "watch" = "batwatch";
      };
    };
  };
}