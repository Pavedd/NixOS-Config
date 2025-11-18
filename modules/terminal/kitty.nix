{
  flake.nixosModules.kitty = { lib, pkgs, ... }: {
    programs.btop.enable = true;
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
        bold_font = "JetBrainsMono-ExtraBold";
        bold_italic_font = "JetBrainsMono-ExtraBoldItalic";
        # bold_font = "JetBrainsMono Nerd Font Mono Extra Bold";
        # bold_italic_font = "JetBrainsMono Nerd Font Mono Extra Bold Italic";
        # font_family = "JetBrainsMono Nerd Font Mono";     
     };
    };
  };
}


