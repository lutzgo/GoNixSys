{ config, pkgs, lib, ... }:

{
  programs = {
    nano.nanorc = ''
      set atblanks
      set autoindent
      set brackets ""')>]}"
      set linenumbers
      #set magic
      set matchbrackets "(<[{)>]}"
      set mouse
      set rawsequences
      set smarthome
      set softwrap
      set tabsize 4
      set tabstospaces
      set titlecolor bold,lightwhite,blue
      set promptcolor lightwhite,lightblack
      set statuscolor bold,lightwhite,green
      set errorcolor bold,lightwhite,red
      set selectedcolor lightwhite,magenta
      set stripecolor ,yellow
      set scrollercolor cyan
      set numbercolor cyan
      set keycolor cyan
      set functioncolor green
    '';
    nano.syntaxHighlight = true;
  };

}