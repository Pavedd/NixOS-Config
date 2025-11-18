{ inputs, ...}:
{
  flake.nixosModules.homePkgs = {pkgs, ... }: {
    home.packages = with pkgs; [ 
    git
    firefox
    thunderbird
    kitty
    catppuccin-gtk
#gruvbox-dark-icons-gtk
    starship
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
    blender
    mpd
    mpc
    ytermusic
    unstable.yt-dlp
    ffmpeg_6
    unstable.quickshell
    qt6.full
    networkmanagerapplet
    localsend
#arduino
    arduino
    arduino-ide
    arduino-cli
    kdePackages.filelight
    bacon
    prismlauncher

#fonts

    dejavu_fonts
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-lgc-plus
    texlivePackages.hebrew-fonts
    noto-fonts-emoji
    font-awesome
    powerline-fonts
    powerline-symbols
    nerd-fonts.symbols-only
    ];
};
}
