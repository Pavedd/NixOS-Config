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


        fzf --fish | source
        set -Ux FZF_DEFAULT_OPTS "\
        --color=bg+:#313244,spinner:#F5E0DC,hl:#F38BA8 \
        --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
        --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
        --color=selected-bg:#45475A \
        --color=border:#6C7086,label:#CDD6F4"
        '';
      shellAliases = {
        cd = "z";
        ls = "eza"; 
      };
    };

    programs.zsh.enable = true;

  };
}
