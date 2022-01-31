# Edit this configuration file to define what should be installed on
# your system.	Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  boot = {
    cleanTmpDir = true;
    initrd.checkJournalingFS = false; # for Virtualbox only

    initrd.luks.devices = {
      root = {
        device = "/dev/disk/by-partlabel/root";
        preLVM = true;
      };
    };

    # #### use lspci -v to determine the kernel-module for your network-card
    # boot.initrd.availableKernelModules = [ "i2c_piix4" ];
    # boot.initrd.network.enable = true;
    # boot.initrd.network.ssh = {
    #   enable = true;
    #   port = 39901;
    #   authorizedKeys = "ssh-rsa AAAAyourpublic-key-here....";
    #   hostKeys = [ "/etc/secrets/initrd/ssh_host_rsa_key" "/etc/secrets/initrd/ssh_host_ed25519_key" ];
    # };

    initrd.preLVMCommands = ''
      echo '--- OWNERSHIP NOTICE ---'
      echo 'This device is property of Lutz Go'
      echo 'If lost please contact lutz0go@gmail.com'
      echo '--- OWNERSHIP NOTICE ---'
    '';

    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
      systemd-boot.configurationLimit = 8;
      systemd-boot.consoleMode = "max";
      systemd-boot.editor = false;
      systemd-boot.enable = true;
    };
  };

  # hardware = {
  #   # Microcode
  #   cpu.amd.updateMicrocode = true;
  # };

  i18n = {
    extraLocaleSettings = {
      # LANGUAGE = "de_DE.UTF-8";
	    # LC_ALL = "de_DE.UTF-8";
      LANG = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
      # LC_MEASUREMENT = "de_DE.UTF-8";
      # LC_MESSAGES = "de_DE.UTF-8";
      # LC_ADDRESS = "de_DE.UTF-8";
      # LC_PAPER = "de_DE.UTF-8";
      # LC_TELEPHONE = "de_DE.UTF-8";
    };
  };
}
