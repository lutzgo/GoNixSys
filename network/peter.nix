{ config, pkgs, lib, ... }:

{
  networking = {
    hostName = "peter";
    ## use the right devices from ifconfig
    interfaces.enp0S3.useDHCP = true;
    interfaces.enp0S8.useDHCP = true;
    # Firewall
    firewall = {
      # ssh & web traffic
      allowedTCPPorts = [
        80 443 39901
      ];
      # allowedUDPPorts = [
      #   4380 3478 4379 4380
      # ];
      # allowedUDPPortRanges = [
      #   {
      #     from = 27000;
      #   to = 27100;
      #   }
      # ];
      # allowedTCPPortRanges = [
      #   {
      #     from = 27015;
      #     to = 27030;
      #   }
      # ];
    };
  };
}