{
  flake.nixosModules.pkgs = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [

      # Custom Helper
      en

      # Compilers
      gcc
      gnumake
      fenix.complete.toolchain
      uv

      # Nix Utilities
      nh
      nix-output-monitor
      nix-index
      nix-tree
      nix-melt
      nix-init
      devenv
      nil

      # System & Hardware Management
      brightnessctl
      auto-cpufreq
      lightdm
      mesa
      pgadmin4-desktopmode

      # System Monitoring
      btop
      fastfetch

      # Development 
      vim
      neovim
      tree-sitter
      unstable.godotPackages_4_6.godot
      neovim-remote

      # Text Editing
      texliveFull
      zathura
      pango

      # File Browsing & Utilities
      fd
      tree
      eza
      zoxide
      yazi
      fzf
      bat
      p7zip
      unzip

      # Multimedia
      vlc
      ffmpeg

      # Disk & Storage Tools
      ripgrep
      udiskie
      ntfs3g
      dust



      # Networking Tools
      tcpdump
      nvd
      linux-wifi-hotspot

      # Communication
      unstable.discord
      protonup-qt

      # System Libraries
      libinput
      gtk2
      openssl
      openssl.dev

      # Desktop Environment & GUI
      xdg-desktop-portal
      xdg-desktop-portal-hyprland
      unstable.xwayland-satellite

      # Gaming
      heroic
      protonup-qt
    ];
  };
}

