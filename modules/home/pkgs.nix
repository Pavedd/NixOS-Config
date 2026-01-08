
{
  flake.homeModules.pkgs = { pkgs, ... }: {
    home.packages = with pkgs; [

      # Version Control
      git

      # Dev tools
      nodejs_24
      yarn-berry
      typescript
      arduino
      arduino-ide
      arduino-cli
      unstable.quickshell

      # Web
      firefox
      unstable.yt-dlp
      ytermusic

      # Email & File sharing
      thunderbird
      localsend
      jocalsend

      # Terminal & Shell
      starship
      bacon

      # Text Editing
      gnome-text-editor

      # File Browsing & Utilities
      nautilus
      gparted
      gnome-disk-utility
      kdePackages.filelight

      # Multimedia & Graphics
      eog
      blender
      krita
      aseprite
      obs-studio
      mpd

      # Games
      prismlauncher

      # Networking Tools
      networkmanagerapplet
      blueman
      bluetui
      impala

      # Authentication & Policy
      polkit
      polkit_gnome

      # Fonts
      dejavu_fonts
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-lgc-plus
      texlivePackages.hebrew-fonts
      noto-fonts-color-emoji
      font-awesome
      powerline-fonts
      powerline-symbols
      nerd-fonts.symbols-only
      catppuccin-gtk
    ];
  };
}

