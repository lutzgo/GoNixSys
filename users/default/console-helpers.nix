{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    bat
    bat-extras.batdiff
    bat-extras.batman
    bat-extras.batgrep
    bat-extras.batwatch
    bat-extras.prettybat
    delta
    dust
    exa
    fd
    procs
    ripgrep-all
    sd
    tealdeer
    zoxide
  ];

  programs = {
    bat = {
      enable = true;
      # themes = {
      #   dracula = builtins.readFile (pkgs.fetchFromGitHub {
      #         owner = "dracula";
      #         repo = "sublime"; # Bat uses sublime syntax for its themes
      #         rev = "26c57ec282abcaa76e57e055f38432bd827ac34e";
      #         sha256 = "019hfl4zbn4vm4154hh3bwk6hm7bdxbr1hdww83nabxwjn99ndhv";
      #   } + "/Dracula.tmTheme");
      # };
    };
    exa = {
      enable = true;
      enableAliases = true;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };

}