{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;

    extraLuaConfig = '' 

      ${buildins.readFile ./nvim/init.lua}

    '';
    
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
