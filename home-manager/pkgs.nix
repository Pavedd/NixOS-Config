{ pkgs, ...}:
{
  home.packages = with pkgs; [ 
    vim 
    firefox
    thunderbird
    kitty
    vscode-fhs
    catppuccin-gtk
    #gruvbox-dark-icons-gtk
    hyprshot
    starship
    kdePackages.breeze-icons
    gnome-text-editor
    eog
    nodejs_24
    yarn-berry
    typescript
    gparted
    gnome-disk-utility
    polkit
    polkit_gnome
  ];
}
