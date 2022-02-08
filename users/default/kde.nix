{ config, pkgs, lib, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      libsForQt5.bismuth
    ];
  };

}