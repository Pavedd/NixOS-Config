{ lib, ... }:
{
  programs.kitty = lib.mkForce {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    settings = {
      confirm_os_window_close = 0;
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

