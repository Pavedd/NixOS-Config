{
  flake.nixosModules.base = { pkgs, config, ... }:
  {
    services.udisks2.enable = true;

    services.auto-cpufreq.enable = true;

    services.pulseaudio = {
      enable = false;
      support32Bit = true;
    };
    hardware.bluetooth = { enable = true; };


# Enable audio through pipewire
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };


    environment.sessionVariables = {
      PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
      NH_FLAKE = "/etc/nixos";
      TERM = "xterm-256color";    
      CARGO_MOMMYS_LITTLE = "boy/princess/pet";
      CARGO_MOMMYS_MOODS = "chill/thirsty";
    };


    fonts.fontDir.enable = true;

    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono 
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
    ];



    networking.networkmanager.enable = true;

# Set your time zone.
    time.timeZone = "Europe/Berlin";

# Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";


    i18n.extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };




    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;  # Enables better Nix integration
    };
  };
}
