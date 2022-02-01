{ config, pkgs, lib, ... }:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # so that gtk works properly
    extraPackages = with pkgs; [
      dmenu
      foot
      mako
      swaylock
      swayidle
      wl-clipboard
  ];
};

  xserver.enable = true;
  services.xserver.displayManager.gdm = {
    enable = true;
    defaultSession = sway;
    wayland = true;
  };

  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     default_session = {
  #       command = "${pkgs.greetd.greetd}/bin/agreety --cmd sway";
  #     };
  #   };
  # };
}