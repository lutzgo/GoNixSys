{ config, pkgs, lib, ... }:

{
  imports = [
    ./network/default.nix
    ./packages/default.nix
    ./programs/default.nix
    ./programs/zsh.nix
  	# ./programs/vim/default.nix
    # ./programs/audio.nix
    #./programs/sql.nix
    ./fonts.nix
    ./default.nix
    # ./programs/numlock.nix
    # ./programs/tldr.nix
    # ./programs/tmux.nix
    ./programs/security.nix
    # ./programs/chromium.nix
  ];
}
