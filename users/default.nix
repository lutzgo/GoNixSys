{ config, pkgs, lib, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    lgo = {
      isNormalUser = true;
      home = "/home/lgo";
      description = "lgo";
      extraGroups = [
        "wheel"
        "networkmanager"
        "video"
        "lp"
      ];
    };
  };
}