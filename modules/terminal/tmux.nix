{
  flake.homeModules.tmux = {lib, pkgs, ... }:  
    let 
      source = "/etc/nixos/nonNix/tmux";
    target = "$HOME/.config/tmux";
    in{ 

#this makes a symlink to .config so tmux can see the conf
      home.activation.createTmuxSymlink = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        [ -L "${target}" ] || ln -s "${source}" "${target}"
        '';




    programs.tmux = {
      enable = true;
      extraConfig = "
        source-file ~/.config/tmux/options.conf
        source-file ~/.config/tmux/keybinds.conf
        source-file ~/.config/tmux/style.conf
        source-file ~/.config/tmux/plugins.conf     
        ";
    };
  };
}

