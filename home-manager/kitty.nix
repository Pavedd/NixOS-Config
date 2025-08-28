{ lib, pkgs, ... }:
{
  programs.tmux = {
      enable = true;
      clock24 = true;
      extraConfig = ''

# Options to make tmux more pleasant
        set -g mouse on
        set -g default-terminal "tmux-256color"

# Configure the catppuccin plugin
        set -g @catppuccin_flavor "mocha"
        set -g @catppuccin_window_status_style "rounded"

# Load catppuccin
        run /etc/nixos/home-manager/tmux/catppuccin/tmux/catppuccin.tmux

# Make the status line pretty and add some modules
        set -g status-right-length 100
        set -g status-left-length 100
        set -g status-left ""
        set -g status-right "#{E:@catppuccin_status_application}"
        set -ag status-right "#{E:@catppuccin_status_session}"
        set -ag status-right "#{E:@catppuccin_status_uptime}"

# Or, if using TPM, just run TPM



        '';
  };

  programs.kitty = lib.mkForce {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    settings = {
      TERM = "xterm-256color";
      cursor_trail = 1;
      cursor_trail_start_threshold = 0;
      cursor_trail_decay =  "0.04 0.08";
      cursor = "#cdd6f4";
      confirm_os_window_close = 0;
      paste_actions = "replace-dangerous-control-codes,replace-newline";
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      window_padding_width = 8;
      background_opacity = "0.65";
      background = "#11111b";
      bold_font = "JetBrainsMono Nerd Font Mono Extra Bold";
      bold_italic_font = "JetBrainsMono Nerd Font Mono Extra Bold Italic";
      font_family = "JetBrainsMono Nerd Font Mono";
    };
  };
}


