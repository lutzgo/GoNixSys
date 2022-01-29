{ config, pkgs, lib, ... }:

{
  security = {
    # rtkit is optional but recommended
    rtkit.enable = true;
    apparmor = {
      enable = true;
      packages = with pkgs; [
        apparmor-profiles
      ];
    };
    pam.services.login.enableGnomeKeyring = true;
  };

  services = {
    dbus.apparmor = "enabled";
    openssh = {
      forwardX11 = true;
      passwordAuthentication = false;
      permitRootLogin = "no";
      ports = [ 39901 ];
    };
  };
}