{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;

    extraPackages = with pkgs; [

      xclip
      wl-clipboard

      luajitPackages.lua-lsp
      nixd
      rust-analyzer

    ];

   
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
