# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here

  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example
    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default
    # You can also split up your configuration and import pieces of it here:
    ./pkgs.nix
    ./hyprland/hyprland.nix
    ./hyprland/tofi.nix
    ./hyprland/waybar.nix
    ./hyprland/hyprpaper.nix
    ./hyprland/kitty.nix
    ./hyprland/swaync.nix
    ./desktop.nix
    ./starship.nix
    ./neovim.nix
#   ./hyprland/fuzzel.nix
#    ./stylix.nix
  ];
  

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];

    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
    };
  };


  home = {
    username = "es46";
    homeDirectory = "/home/es46";
  };
  
  
  home.activation.createProjectsSymlink = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ -d /mnt/windows/Users/pault/Projects ]; then
      rsync -av --delete /mnt/windows/Users/pault/Projects "$HOME/Projects"
    else
      echo "Warning: Target path does not exist."
    fi
  '';
  

  home.sessionVariables = {
    CARGO_MOMMYS_LITTLE = "boy/princess/pet";
    CARGO_MOMMYS_MOODS = "chill/thirsty";



  };

#  home.pointerCursor = {
#    name = "Catppuccin-Mocha-Dark-Cursors";
#    package = pkgs.catppuccin-cursors.mochaDark;
#    size = 24;
#    gtk.enable = true;
#  };

#  gtk = {
#    enable = true;
#    cursorTheme.package = pkgs.catppuccin-cursors.mochaDark;
#    cursorTheme.name = "Catppuccin-Mocha-Dark-Cursors";
#    theme.package = pkgs.catppuccin-gtk;
#    theme.name = "catppucin";
#    iconTheme.package = pkgs.gruvbox-dark-icons-gtk;
#    iconTheme.name = "gruvbox-dark-icons";
#  };


#  qt.enable = true;


#      home.pointerCursor = lib.mkForce {
#      gtk.enable = true;
#      x11.enable = true;
#      name = "Catppuccin-Mocha-Dark-Cursors";
#      package = pkgs.catppuccin-cursors.mochaDark;
#      size = 24;
#    };

  fonts.fontconfig.enable = true;

  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
     TERM = "xterm-256color";
    };
  };


  programs.vscode = {
  enable = true;
  package = pkgs.vscode.fhsWithPackages (ps: with ps; [
      openssl_3.dev
      pkg-config       
    ]);

    extraEnv = {
      PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    };
  };

  
  programs.git = {
    enable = true;
    userName = "GitLab Username";
    userEmail = "Endersoul46";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
      credentials.helper = "libsecret";
    };
  };



#    programs.vscode = {
#      enable = true;
#      package = pkgs.vscodium;
#      mutableExtensionsDir = false;
#    };
#    programs.vscode.profiles.default = {
#      enableExtensionUpdateCheck = false;
#      enableUpdateCheck = false;
#
#      extensions = with pkgs.vscode-extensions; [
#        jnoortheen.nix-ide
#
#        
#        rust-lang.rust-analyzer
#
#	catppuccin.catppuccin-vsc
#      ];
#    };


  # Enable home-manager 
  programs.home-manager.enable = true;


  
  wayland.windowManager.hyprland = {
  };
 



  
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
