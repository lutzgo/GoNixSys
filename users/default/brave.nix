{ config, pkgs, lib, ... }:

{
  nixpkgs.config.brave.commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";
}