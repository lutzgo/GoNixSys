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

  services.greetd = {
    greetd.enable = true;
    greetd.settings = {
      default_session = {
        command = "${pkgs.greetd.greetd}/bin/agreety --cmd sway";
      };
    };
  };
}