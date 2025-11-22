{
  flake.nixosModules.fish = { pkgs , ... }: {

    programs.fish = {
      enable = true;
      # documentation.man.generateCaches = false;
      interactiveShellInit = ''
        set -g fish_greeting
        starship init fish | source
        zoxide init fish | source
        fish_vi_key_bindings
        '';
      shellAliases = {
        cd = "z";
        ls = "eza"; 
      };
    };

    programs.zsh.enable = true;

  };
}
