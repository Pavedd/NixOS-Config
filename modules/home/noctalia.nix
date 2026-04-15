{
  flake.homeModules.noctalia = { config, pkgs, lib, inputs, ... }: 

    let 
      source = "/etc/nixos/nonNix/noctalia";
    target = "$HOME/.config/noctalia";
    in{ 

#this makes a symlink to .config so nvim can see the conf
      home.activation.createNoctaliaSymlink = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        [ -L "${target}" ] || ln -s "${source}" "${target}"
        '';

      home.packages = with pkgs; [
#            inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];


    };  
  }
