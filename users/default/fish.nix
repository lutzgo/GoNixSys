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
        # "dmesg" = "rmesg";
        "du" = "dust";
        "find" = "fd … -X bat";
        "grep" = "batgrep";
        "li" = "ls -lah --icons --group-directories-first";
        "man" = "batman";
        "ps" = "procs";
        "sed" = "sd";
        "watch" = "batwatch";
      };
    };
  };
}