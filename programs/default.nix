{ config, pkgs, lib, ... }:

{

  ### Environment ###
  environment = {
    shellAliases = {
      cp = "cp -i";
      diff = "diff --color=auto";
      dmesg = "dmesg --color=always";
      egrep = "egrep --color=auto";
      fgrep = "fgrep --color=auto";
      grep = "grep --color=auto";
      mv = "mv -i";
      ping = "ping -c3";
      ps = "ps -ef";
      # sudo = "sudo -i";
      vdir = "vdir --color=auto";
    };
  };

  nix = {
    # Garbage collection
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 4d --max-freed $((64 * 1024**3))";
    };
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
    # Make ready for nix flakes
    package = pkgs.nixFlakes;
    autoOptimiseStore = true;
    readOnlyStore = false;
    useSandbox = true;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  programs = {
    ssh = {
      startAgent = false;
    };
    gnupg.agent = {
      enable = true;
      # pinentryFlavor = "gtk2";
      enableSSHSupport = true;
    };
  };

  services = {
    fstrim.enable = true;
    openssh = {
      enable = true;
    };
    # gvfs = {
    #   enable = true;
    #};
  };

  #### Automatic upgrades ####
  # system.autoUpgrade ={
  #   enable = true;
  #   allowReboot = false;
  #   dates = "daily";
  #   flags = [
  #      "--recreate-lock-file"
  #      "--no-write-lock-file"
  #      "-L" # print build logs
  #    ];
  #   flake = "github:lugitt/GoNixSys";
  # };

  virtualisation.docker.enable = true;
}
