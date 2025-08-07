{ pkgs, ...}:
{
  home.packages = with pkgs; [ 
    firefox
    thunderbird
    kitty
    catppuccin-gtk
    #gruvbox-dark-icons-gtk
    starship
    kdePackages.breeze-icons
    gnome-text-editor
    nautilus
    nwg-look
    eog
    nodejs_24
    rust-analyzer
    yarn-berry
    typescript
    gparted
    gnome-disk-utility
    polkit
    polkit_gnome
  ];
}
