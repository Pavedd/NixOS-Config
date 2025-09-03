{ pkgs , ... }:
{

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting
      starship init fish | source
      zoxide init fish | source

    '';
    shellAliases = {
      nmtui = "impala";
      cd = "z";
      ls = "eza"; 
    };
  };

  programs.zsh.enable = true;

}
