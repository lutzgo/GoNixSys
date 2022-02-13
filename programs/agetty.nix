{ config, pkgs, lib, ... }:

{

  programs = {
    fish = {
      loginShellInit = ''
        if test (id --user $USER) -ge 1000 && test (tty) = "/dev/tty1"
        exec sway
        end
      '';
    };
  };

}