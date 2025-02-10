{
  hostName,
  pkgs,
  ...
}: 

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    sourceFirst = true;
    settings = {
      source = [
        "~/.config/hypr/mocha.conf" # Theme
      ];
      monitor = ",preferred,auto,1";
	
      # Programms
      "$terminal" = "kitty";
      "$webBrowser" = "firefox";
      "$menu" = "wofi --show drun";
      "$codeEditor" = "code";


      exec-once = [
	"udiskie"        
      ];
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      input = {
        kb_layout = "ch";
        kb_variant = "";
        kb_model = "";
	kb_rules = "";
        kb_options = "";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = false;
          clickfinger_behavior = false;
          disable_while_typing = false;
          tap-and-drag = false;
        };
        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "$mauve";
        "col.inactive_border" = "$surface0";
        layout = "dwindle";
      };
      group = {
        "col.border_active" = "$mauve";
        "col.border_inactive" = "$surface0";
        groupbar = {
          font_family = "Maple Mono";
          font_size = 12;
          gradients = true;
          text_color = "$crust";
          "col.active" = "$mauve";
          "col.inactive" = "$overlay0";
        };
      };
      decoration = {
        rounding = 10;
        active_opacity = 0.85;
        inactive_opacity = 0.8;
        dim_inactive = true;
        dim_strength = 0.1;
        blur = {
	  enabled = true;
          size = 8;
          passes = 2;
        };
        shadow = {
          enabled = true;
          range = 15;
          render_power = 3;
	  offset = "0, 0";
          # color = "$base";
        };
      };
      binds = {
        movefocus_cycles_fullscreen = false;
        workspace_center_on = 1;
        focus_preferred_method = 0;
      };
      animations = {
        enabled = true;
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];
        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, liner"
          "borderangle, 1, 200, liner, loop"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
        force_split = 2;
        default_split_ratio = 1.2;
      };
      master = {
        new_status = "slave";
      };
      gestures = {workspace_swipe = false;};
      misc = {
        disable_hyprland_logo = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
	force_default_wallpaper = -1;
      };

      "$mainMod" = "SUPER"; # Sets Windows key as main modifier

      bind = 
        [
          "$mainMod, T, exec, $terminal"
          "$mainMod, B, exec, $webBrowser"
          "$mainMod, Q, killactive"
          "$mainMod, M, exit"
#          "$mainMod, E, exec, $fileManager"
          "$mainMod, G, togglefloating"
          "$mainMod, R, exec, $menu"
          "$mainMod, P, pseudo" # dwindle
          "$mainMod, J, togglesplit" # dwindle
          "$mainMod, C, exec, $codeEditor"
          "$mainMod, F, fullscreen"

          # Move focus with mainMod + arrow keys
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"

          # Switch workspaces with mainMod + [0-9]
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"

          # Move active window to a workspace with mainMod + SHIFT + [0-9]
          "$mainMod SHIFT, 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, movetoworkspace, 9"
          "$mainMod SHIFT, 0, movetoworkspace, 10"

          # Example special workspace (scratchpad)
          "$mainMod, S, togglespecialworkspace, magic"
          "$mainMod SHIFT, S, movetoworkspace, special:magic"

          # Scroll through existing workspaces with mainMod + scroll
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"

         ];

       bindm =
         [
           "$mainMod, mouse:272, movewindow"
           "$mainMod, mouse:273, resizewindow"
	   "$mainMod, V, resizewindow"
         ];

        # Laptop multimedia keys for volume and LCD brightness
        bindel = 
	  [
  	    ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
  	    ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
  	    ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
  	    ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
  	    ", XF86MonBrightnessUp, exec, brightnessctl s 10%+"
   	    ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
	   ];

	# Requires playerctl
	bindl = 
	 [
  	  ", XF86AudioNext, exec, playerctl next"
  	  ", XF86AudioPause, exec, playerctl play-pause"
  	  ", XF86AudioPlay, exec, playerctl play-pause"
  	  ", XF86AudioPrev, exec, playerctl previous"
	 ];

      # Window rules
      windowrulev2 = [
        "suppressevent maximize, class:.*"
      ];


    };
    # plugins = [];
    # extraConfig = "";
  };
}
