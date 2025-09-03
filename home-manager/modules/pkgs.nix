{ pkgs,inputs, ...}:
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
    eog
    nwg-look
    nodejs_24
    yarn-berry
    typescript
    gparted
    gnome-disk-utility
    polkit
    polkit_gnome
    blueman
    bluetui
    ytermusic
    youtube-tui
    unstable.quickshell
  ];
}
