{ config, pkgs, lib, ... }:

{

  programs = {

    services = {
      greetd = {
        enable = true;
        # package = pkgs.greetd.gtkgreet;
        settings = {
          default_session = {
            command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
            user = "lgo";
          };
        };
      };

    };

  };

}