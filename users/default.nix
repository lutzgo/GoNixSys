{ config, pkgs, lib, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    lgo = {
      description = "Lutz Go";
      home = "/home/lgo";
      extraGroups = [
        "audio"
        "docker"
        "lp"
        "networkmanager"
        "users"
        "video"
        "wheel"
      ];
      isNormalUser = true;
      mutableUsers = false;
      shell = pkgs.zsh;
      uid = 1000;
    };
  };
}