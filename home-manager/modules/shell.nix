{ pkgs, lib,  ...}:
  
let 
  source = "/etc/nixos/home-manager/quickshell";
  target = "$HOME/.config/quickshell";
in{ 

  #this makes a symlink to .config so nvim can see the conf
  home.activation.createShellSymlink = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
   [ -L "${target}" ] || ln -s "${source}" "${target}"
  '';


}
