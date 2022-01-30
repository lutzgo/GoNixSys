{ config, pkgs, lib, ... }:

{
  #### Console Setup ####
  console = {
    earlySetup = true;
    font = "Lat2-Terminus16";
    # Set your keyboard layout
    keyMap = "de";
    colors = [
      "2E3440"
      "3B4252"
      "434C5E"
      "4C566A"
      "D8DEE9"
      "E5E9F0"
      "ECEFF4"
      "8FBCBB"
      "88C0D0"
      "81A1C1"
      "5E81AC"
      "BF616A"
      "D08770"
      "EBCB8B"
      "A3BE8C"
      "B48EAD"
    ];
  };

  #### Locale ####
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "de_DE.UTF-8/UTF-8"
    ];
  };

  environment.systemPackages = with pkgs.hunspellDicts; [
    en_US
    de_DE
  ];

  #### Set your time zone. ####
  time.timeZone = "Europe/Berlin";

  #### Shell-Sttings ####
  environment = {
    variables = {
      CLICOLOR = "TRUE";
      TERM = "xterm-256color";
      # MOZ_ENABLE_WAYLAND = "1";
    };
    pathsToLink = [ "/libexec" ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "unstable"; # Did you read the comment?
}