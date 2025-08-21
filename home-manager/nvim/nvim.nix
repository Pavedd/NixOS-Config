{ config, pkgs, lib, ... }:

let 
  source = "/etc/nixos/home-manager/nvim";
  target = "$HOME/.config/nvim";
in{ 

  #this makes a symlink to .config so nvim can see the conf
  home.activation.createNvimSymlink = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
   [ -L "${target}" ] || ln -s "${source}" "${target}"
  '';


  programs.neovim = {
    enable = true;

    extraPackages = with pkgs; [

      #extra pkgs
      luajitPackages.luarocks_bootstrap
      xclip
      wl-clipboard

      #the most important language servers
      lua-language-server
      nixd
      clang-tools
      pyright
   ];

    extraWrapperArgs = [
      "--suffix"
      "RUST_SRC_PATH"
      ":"
      "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}"
    ];
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
 };
  
}

