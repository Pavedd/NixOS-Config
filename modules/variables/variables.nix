{...}: 
 let
 host = (import ./_host.nix).host;
 theme = (import ./_theme.nix).theme;
 stripHash = str:
    if builtins.substring 0 1 str == "#"
    then builtins.substring 1 (builtins.stringLength str - 1) str
    else str;

  themeNoHash = builtins.mapAttrs (_: v: stripHash v) theme;
in {
  flake = {
    inherit theme themeNoHash host;
  };
}
