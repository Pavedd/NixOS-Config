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
        "/etc/nixos/home-manager/modules/hyprland/mocha.conf" # Theme
      ];
      monitor = ",preferred,auto,1";

# Programms
      "$terminal" = "kitty";
      "$webBrowser" = "firefox";
      "$menu" = "tofi-drun --drun-launch=true";
      "$codeEditor" = "code";
      "$fileManager" = "nautilus";         
      "$notes" = "obsidian";

      exec-once = [
        "udiskie"
         "waybar" 
         "swww-daemon"
         "swww img /etc/nixos/home-manager/wallpapers/miku.png"
         "swaync"
         "hyprctl setcursor Catppuccin Mocha Dark 24"        
         "sudo auto-cpufreq --daemon"
      ];
      env = [
        "XCURSOR_THEME, Catppuccin Mocha Dark"
         "XCURSOR_SIZE,24"
         "HYPRCURSOR_SIZE,24"
         "AQ_NO_MODIFIERS,1"
      ];


      input = {
        kb_layout = "eu";
        kb_variant = "";
        kb_model = "";
        kb_rules = "";
        kb_options = "";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
          clickfinger_behavior = false;
          disable_while_typing = false;
          tap-and-drag = false;
        };
        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };


      cursor = {
        inactive_timeout = 3;
        no_hardware_cursors = true;
      };
      general = {
        gaps_in = 3;
        gaps_out = 6;
        border_size = 0;
        "col.active_border" = "$mauve";
        "col.inactive_border" = "$surface0";
        layout = "dwindle";
      };
      group = {
        "col.border_active" = "$surface1";
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
        rounding = 8;
        active_opacity = 1;
        inactive_opacity = 1;
        dim_inactive = true;
        dim_strength = 0.1;
        blur = {
          enabled = true;
          size = 6;
          passes = 2;
          new_optimizations = true;
          ignore_opacity = true; 
        };
        shadow = {
          enabled = true;
          range = 5;
          render_power = 3;
          offset = "0, 0";
          color = "rgba(17, 17, 27, 1.0)";
          color_inactive = "rgba(17, 17, 27, 0.0)";
        };

        layerrule = [
          "blur, waybar "
            "blur, tofi"          
            "blur, swaync"

        ];

      };
      binds = {
        movefocus_cycles_fullscreen = false;
        workspace_center_on = 1;
        focus_preferred_method = 0;
      };
      animations = {
        enabled = true;
        bezier = [
          "slow,0,0.85,0.3,1"
            "overshot,0.7,0.6,0.1,1.1"
            "bounce,1,1.6,0.1,0.85"
            "slingshot,1,-1,0.15,1.25"
            "myBezier, 0.05, 0.9, 0.1, 1.05"
        ];
        animation = [
          "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
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
          "$mainMod, SPACE , exec, $terminal"
          "$mainMod CTRL, SPACE, exec, $terminal -e tmux"
          "$mainMod, B, exec, $webBrowser"
          "$mainMod, Q, killactive"
          "$mainMod SHIFT, M, exit"
          "$mainMod, A, exec, $menu"
          "$mainMod, E, exec, $fileManager"
          "$mainMod, D, togglefloating"
          "$mainMod CTRL, D, pseudo" # dwindle
          "$mainMod, R, togglesplit" # dwindle
          "$mainMod, C, exec, $codeEditor"
          "$mainMod, N, exec, $notes"
          "$mainMod, F, fullscreen"

          "SUPER_SHIFT, L, exec, hyprlock"
          
#background
          "$mainMod SHIFT, G, exec, swww img /etc/nixos/home-manager/wallpapers/miku.gif"
          "$mainMod CTRL, G, exec, swww img /etc/nixos/home-manager/wallpapers/miku.png"

#Screenshot
          "$mainMod, PRINT, exec, hyprshot -m window"
          ", PRINT, exec, hyprshot -m output"
          "$shiftMod, PRINT, exec, hyprshot -m region"


# Move focus with mainMod + arrow keys or vim motions
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"

          "$mainMod, l, movefocus, l"
          "$mainMod, h, movefocus, r"
          "$mainMod, k, movefocus, u"
          "$mainMod, j, movefocus, d"

          "$mainMod CTRL, l, movewindow, l"
          "$mainMod CTRL, h, movewindow, r"
          "$mainMod CTRL, k, movewindow, u"
          "$mainMod CTRL, j, movewindow, d"



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

# Move active window to a workspace without moving mainMod + ctrl + [0-9]
          "$mainMod CTRL, 1, movetoworkspacesilent, 1"
          "$mainMod CTRL, 2, movetoworkspacesilent, 2"
          "$mainMod CTRL, 3, movetoworkspacesilent, 3"
          "$mainMod CTRL, 4, movetoworkspacesilent, 4"
          "$mainMod CTRL, 5, movetoworkspacesilent, 5"
          "$mainMod CTRL, 6, movetoworkspacesilent, 6"
          "$mainMod CTRL, 7, movetoworkspacesilent, 7"
          "$mainMod CTRL, 8, movetoworkspacesilent, 8"
          "$mainMod CTRL, 9, movetoworkspacesilent, 9"
          "$mainMod CTRL, 0, movetoworkspacesilent, 10"


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
          ", XF86MonBrightnessUp, exec, brightnessctl s 5%+"
 # resize with mainMod CTRL + arrow keys
          "$mainMod CTRL, left, resizeactive, -20 0"
          "$mainMod CTRL, right, resizeactive, 20 0"
          "$mainMod CTRL, up, resizeactive, 0 -20"
          "$mainMod CTRL, down, resizeactive, 0 20"

          ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"
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
          "opacity 1.0 1.0,class:^(firefox)$"
          "opacity 0.90 0.90,class:^(Google-chrome)$"
          "opacity 0.90 0.90,class:^(Brave-browser)$"
          "opacity 1.0 1.0,class:^(code-oss)$"
          "opacity 1.0 1.0,class:^([Cc]ode)$"
#"opacity 0.80 0.80,class:^(code-url-handler)$"
#"opacity 0.80 0.80,class:^(code-insiders-url-handler)$"
#"opacity 0.80 0.80,class:^(kitty)$"
          "opacity 0.80 0.80,class:^(nautilus)$"
          "opacity 0.80 0.80,class:^(org.kde.ark)$"
          "opacity 0.80 0.80,class:^(nwg-look)$"
          "opacity 0.80 0.80,class:^(qt5ct)$"
          "opacity 0.80 0.80,class:^(qt6ct)$"
          "opacity 0.80 0.80,class:^(kvantummanager)$"
          "opacity 0.80 0.70,class:^(org.pulseaudio.pavucontrol)$"
          "opacity 0.80 0.70,class:^(blueman-manager)$"
          "opacity 0.80 0.70,class:^(nm-applet)$"
          "opacity 0.80 0.70,class:^(nm-connection-editor)$"
          "opacity 0.80 0.70,class:^(org.kde.polkit-kde-authentication-agent-1)$"
          "opacity 0.80 0.70,class:^(polkit-gnome-authentication-agent-1)$"
          "opacity 0.80 0.70,class:^(org.freedesktop.impl.portal.desktop.gtk)$"
          "opacity 0.80 0.70,class:^(org.freedesktop.impl.portal.desktop.hyprland)$"
          "opacity 0.70 0.70,class:^([Ss]team)$"
          "opacity 0.70 0.70,class:^(steamwebhelper)$"
          "opacity 0.70 0.70,class:^([Ss]potify)$"
          "opacity 0.70 0.70,initialTitle:^(Spotify Free)$"
          "opacity 0.70 0.70,initialTitle:^(Spotify Premium)$"

          "opacity 0.90 0.90,class:^(com.github.rafostar.Clapper)$" # Clapper-Gtk
          "opacity 0.80 0.80,class:^(com.github.tchx84.Flatseal)$" # Flatseal-Gtk
          "opacity 0.80 0.80,class:^(hu.kramo.Cartridges)$" # Cartridges-Gtk
          "opacity 0.80 0.80,class:^(com.obsproject.Studio)$" # Obs-Qt
          "opacity 0.80 0.80,class:^(gnome-boxes)$" # Boxes-Gtk
          "opacity 0.80 0.80,class:^(vesktop)$" # Vesktop
          "opacity 0.80 0.80,class:^(discord)$" # Discord-Electron
          "opacity 0.80 0.80,class:^(WebCord)$" # WebCord-Electron
          "opacity 0.80 0.80,class:^(ArmCord)$" # ArmCord-Electron
          "opacity 0.80 0.80,class:^(app.drey.Warp)$" # Warp-Gtk
          "opacity 0.80 0.80,class:^(net.davidotek.pupgui2)$" # ProtonUp-Qt
          "opacity 0.80 0.80,class:^(yad)$" # Protontricks-Gtk
          "opacity 0.80 0.80,class:^(Signal)$" # Signal-Gtk
          "opacity 0.80 0.80,class:^(io.github.alainm23.planify)$" # planify-Gtk
          "opacity 0.80 0.80,class:^(io.gitlab.theevilskeleton.Upscaler)$" # Upscaler-Gtk
          "opacity 0.80 0.80,class:^(com.github.unrud.VideoDownloader)$" # VideoDownloader-Gtk
          "opacity 0.80 0.80,class:^(io.gitlab.adhami3310.Impression)$" # Impression-Gtk
          "opacity 0.80 0.80,class:^(io.missioncenter.MissionCenter)$" # MissionCenter-Gtk
          "opacity 0.80 0.80,class:^(io.github.flattool.Warehouse)$" # Warehouse-Gtk

          "float,class:^(org.kde.dolphin)$,title:^(Progress Dialog — Dolphin)$"
          "float,class:^(org.kde.dolphin)$,title:^(Copying — Dolphin)$"
          "float,title:^(About Mozilla Firefox)$"
          "float,class:^(firefox)$,title:^(Picture-in-Picture)$"
          "float,class:^(firefox)$,title:^(Library)$"
          "float,class:^(kitty)$,title:^(top)$"
          "float,class:^(kitty)$,title:^(btop)$"
          "float,class:^(kitty)$,title:^(htop)$"
          "float,class:^(vlc)$"
          "float,class:^(kvantummanager)$"
          "float,class:^(qt5ct)$"
          "float,class:^(qt6ct)$"
          "float,class:^(nwg-look)$"
          "float,class:^(org.kde.ark)$"
          "float,class:^(org.pulseaudio.pavucontrol)$"
          "float,class:^(blueman-manager)$"
          "float,class:^(nm-applet)$"
          "float,class:^(nm-connection-editor)$"
          "float,class:^(org.kde.polkit-kde-authentication-agent-1)$"

          "float,class:^(Signal)$" # Signal-Gtk
          "float,class:^(com.github.rafostar.Clapper)$" # Clapper-Gtk
          "float,class:^(app.drey.Warp)$" # Warp-Gtk
          "float,class:^(net.davidotek.pupgui2)$" # ProtonUp-Qt
          "float,class:^(yad)$" # Protontricks-Gtk
          "float,class:^(eog)$" # Imageviewer-Gtk
          "float,class:^(io.github.alainm23.planify)$" # planify-Gtk
          "float,class:^(io.gitlab.theevilskeleton.Upscaler)$" # Upscaler-Gtk
          "float,class:^(com.github.unrud.VideoDownloader)$" # VideoDownloader-Gkk
          "float,class:^(io.gitlab.adhami3310.Impression)$" # Impression-Gtk
          "float,class:^(io.missioncenter.MissionCenter)$" # MissionCenter-Gtk

# common modals
          "float,title:^(Open)$"
          "float,title:^(Choose Files)$"
          "float,title:^(Save As)$"
          "float,title:^(Confirm to replace files)$"
          "float,title:^(File Operation Progress)$"
          "float,class:^(xdg-desktop-portal-gtk)$"

          "float, title:^(pop-up)$"
          "pin, title:^(pop-up)$"
          "size 800 600, title:^(pop-up)$"
         ];


    };
# plugins = [];
# extraConfig = "";
  };
}
