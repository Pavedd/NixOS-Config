{
  flake.nixosModules.niri = { config, pkgs, lib, ... }: 

    let 
      source = "/etc/nixos/nonNix/niri";
    target = "$HOME/.config/niri";
    in{ 

#this makes a symlink to .config so nvim can see the conf
      home.activation.createNiriSymlink = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        [ -L "${target}" ] || ln -s "${source}" "${target}"
        '';

  };
}
