{ config, pkgs, ... }:

{

  programs.nushell = { 
    enable = true;
    settings = {
      startup = [ "line_editor.edit_mode "vi"" ];
    };
  };
}
