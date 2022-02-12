{ config, pkgs, lib, ... }:

{

  # environment = {
  #   # etc = {
  #   #   # Put config files in /etc. Note that you also can put these in ~/.config, but then you can't manage them with NixOS anymore!
  #   #   "sway/config".source = ./dotfiles/sway/config;
  #   #   "xdg/waybar/config".source = ./dotfiles/waybar/config;
  #   #   "xdg/waybar/style.css".source = ./dotfiles/waybar/style.css;
  #   # };

  #   systemPackages = with pkgs; [
  #     (
  #       pkgs.writeTextFile {
  #         name = "startsway";
  #         destination = "/bin/startsway";
  #         executable = true;
  #         text = ''
  #           #! ${pkgs.bash}/bin/bash

  #           # first import environment variables from the login manager
  #           systemctl --user import-environment
  #           # then start the service
  #           exec systemctl --wait --user start sway.service
  #         '';
  #       }
  #     )

  #     # (
  #     #   pkgs.writeTextFile {
  #     #     name = "Sway Systemd Session";
  #     #     destination = "/usr/share/wayland-sessions/sway-session.desktop";
  #     #     executable = false;
  #     #     text = ''
  #     #       [Desktop Entry]
  #     #       Name=Sway Systemd Session
  #     #       Comment=SirCmpwn's Wayland window manager as a systemd service
  #     #       Exec=/bin/startsway
  #     #       Type=Application
  #     #     '';
  #     #   }
  #     # )

  #   ];

  # };

  nixpkgs.overlays = [
    (self: super: {
      wl-clipboard-x11 = super.stdenv.mkDerivation rec {
      pname = "wl-clipboard-x11";
      version = "5";

      src = super.fetchFromGitHub {
        owner = "brunelli";
        repo = "wl-clipboard-x11";
        rev = "v${version}";
        sha256 = "1y7jv7rps0sdzmm859wn2l8q4pg2x35smcrm7mbfxn5vrga0bslb";
      };
  
      dontBuild = true;
      dontConfigure = true;
      propagatedBuildInputs = [ super.wl-clipboard ];
      makeFlags = [ "PREFIX=$(out)" ];
    };
  
    xsel = self.wl-clipboard-x11;
    xclip = self.wl-clipboard-x11;
  })
];

  programs = {

    light.enable = true;

    sway = {
      enable = true;
      wrapperFeatures.gtk = true; # so that gtk works properly
      extraPackages = with pkgs; [
        brightnessctl
        dmenu
        grim
        kanshi
        mako
        pactl
        slurp
        swaylock
        swayidle
        waybar
        wl-clipboard
        wofi
        wofi-emoji
      ];
    };

    # fish = {
    #   loginShellInit = ''
    #     if test (id --user $USER) -ge 1000 && test (tty) = "/dev/tty1"
    #     exec startsway
    #     end
    #   '';
    # };

    # waybar.enable = true;

  };

  # services = {
  #   greetd = {
  #     enable = true;
  #     settings = {
  #       default_session = {
  #         command = "${pkgs.greetd.greetd}/bin/agreety --cmd sway";
  #       };
  #     };
  #   };
  # };

  # systemd.user = {

  #   targets.sway-session = {
  #     description = "Sway compositor session";
  #     documentation = [ "man:systemd.special(7)" ];
  #     bindsTo = [ "graphical-session.target" ];
  #     wants = [ "graphical-session-pre.target" ];
  #     after = [ "graphical-session-pre.target" ];
  #   };

  #   services = {

  #     sway = {
  #       description = "Sway - Wayland window manager";
  #       documentation = [ "man:sway(5)" ];
  #       bindsTo = [ "graphical-session.target" ];
  #       wants = [ "graphical-session-pre.target" ];
  #       after = [ "graphical-session-pre.target" ];
  #       # We explicitly unset PATH here, as we want it to be set by
  #       # systemctl --user import-environment in startsway
  #       environment.PATH = lib.mkForce null;
  #       serviceConfig = {
  #         Type = "simple";
  #         # ExecStartPre= ''
  #         #   systemctl --user unset-environment WAYLAND_DISPLAY DISPLAY
  #         # '';
  #         ExecStart = ''
  #           ${pkgs.dbus}/bin/dbus-run-session ${pkgs.sway}/bin/sway --debug
  #         '';
  #         Restart = "on-failure";
  #         RestartSec = 1;
  #         TimeoutStopSec = 10;
  #       };
  #     };

  #     kanshi = {
  #       enable = true;
  #       description = "Kanshi output autoconfig";
  #       wantedBy = [ "graphical-session.target" ];
  #       partOf = [ "graphical-session.target" ];
  #       serviceConfig = {
  #         # kanshi doesn't have an option to specifiy config file yet, so it looks
  #         # at .config/kanshi/config
  #         ExecStart = ''
  #           ${pkgs.kanshi}/bin/kanshi
  #         '';
  #         RestartSec = 5;
  #         Restart = "always";
  #       };
  #     };

  #     mako = {
  #       enable = true;
  #       description = "Mako notification daemon";
  #       wantedBy = [ "graphical-session.target" ];
  #       partOf = [ "graphical-session.target" ];
  #       serviceConfig = {
  #         ExecStart = ''
  #           ${pkgs.mako}/bin/mako
  #         '';
  #         RestartSec = 5;
  #         Restart = "always";
  #       };
  #     };

  #     waybar = {
  #       # enable = true;
  #       description = "Wayland bar for Sway and Wlroots based compositors";
  #       wantedBy = [ "graphical-session.target" ];
  #       partOf = [ "graphical-session.target" ];
  #       serviceConfig = {
  #         ExecStart = ''
  #           ${pkgs.waybar}/bin/waybar
  #         '';
  #         RestartSec = 5;
  #         Restart = "always";
  #       };
  #     };

  #   };

  # };

}