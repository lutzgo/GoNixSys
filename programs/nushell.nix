{ config, pkgs, ... }:

{

  programs.nushell = { 
    enable = true;
    settings = {
      startup = [
        "mkdir ~/.cache/starship"
        "starship init nu | save ~/.cache/starship/init.nu"
        "source ~/.cache/starship/init.nu"
      ];
      prompt = "starship_prompt";
    };
  };
}
