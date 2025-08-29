{ pkgs , ... }:
{

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting
      starship init fish | source
   '';
    shellAliases = {
      nmtui = "impala";
    };
  };

  programs.zsh.enable = true;

}
