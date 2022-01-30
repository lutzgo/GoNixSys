{ config, pkgs, lib, ... }:

{

  #### Automatic upgrades ####
  system.autoUpgrade ={
    enable = true;
    allowReboot = false;
    dates = "daily";
    flags = [
       "--recreate-lock-file"
       "--no-write-lock-file"
       "-L" # print build logs
     ];
    flake = "github:lugitt/GoNixSys";
  # };

}