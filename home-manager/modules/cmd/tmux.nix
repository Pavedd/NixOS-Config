{lib, pkgs, ... }:
{

  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
        sensible
        vim-tmux-navigator
        catppuccin
        tmux-thumbs
        yank
        open
        tmux-sessionx
        tmux-floax
        resurrect
        continuum
    ];
    extraConfig = ''

      unbind C-b

      set-option -g prefix C-a
      bind C-a send-prefix

      set -g @floax-border-color "#{@thm_mauve}"
      set -g @floax-text-color "#{@thm_blue}"
      set -g @floax-prefix "p"
      set -g @sessionx-bind 'o'
      set -g @sessionx-custom-paths '/etc/nixos/, /home/es46/Documents/Projects/'
      set -g mode-style "bg=default, fg=#{thm_overlay_0}"


      bind-key N command-prompt -p "New session name:" "new-session -s '%%'"

      bind h set-option status

      set -g mouse on
      set -g default-terminal "tmux-256color"
          
      set -g base-index 1
      set -g detach-on-destroy off 
      set -g pane-base-index 1

      set -g @continuum-restore 'on'
      set -g @continuum-save-interval '15'

# Configure Catppuccin
      set -g @catppuccin_flavor "macchiato"
      set -g @catppuccin_status_background "none"
      set -g @catppuccin_window_status_style "none"
      set -g @catppuccin_pane_status_enabled "off"
      set -g @catppuccin_pane_border_status "off"

      run-shell ${pkgs.tmuxPlugins.catppuccin}/share/tmux-plugins/catppuccin/catppuccin.tmux



# status left look and feel
      set -g status-left-length 100
      set -g status-left ""
      set -ga status-left "#{?client_prefix,#{#[bg=#{@thm_green},fg=#{@thm_bg}]  #S },#{#[bg=default,fg=#{@thm_green}]  #S }}"
      set -ga status-left "#[bg=default,fg=#{@thm_overlay_0},none]│"
      set -ga status-left "#[bg=default,fg=#{@thm_maroon}]  #{pane_current_command} "
      set -ga status-left "#[bg=default,fg=#{@thm_overlay_0},none]#{?window_zoomed_flag,│,}"
      set -ga status-left "#[bg=default,fg=#{@thm_yellow}]#{?window_zoomed_flag,  zoom ,}"

# status right look and feel
      set -g status-right-length 100
      set -g status-right ""
      set -ga status-right "#[bg=default,fg=#{@thm_blue}]  #{=/-32/...:#{s|$USER|~|:#{b:pane_current_path}}} "
      set -ga status-right "#[bg=default,fg=#{@thm_overlay_0}, none]│"
      set -ga status-right "#[fg=#{@thm_lavender},bg=default]  #(uptime | awk '{print $3}'|sed 's/,//') "

# Configure Tmux
          set -g status-position top
          set -g status-style "bg=default"
          set -g status-justify "absolute-centre"

# pane border look and feel
          setw -g pane-border-format ""
          setw -g pane-border-style "bg=default,fg=#{@thm_surface_0}"
          setw -g pane-active-border-style "bg=default,fg=#{@thm_overlay_0}"
          setw -g pane-border-lines single

# window look and feel
          set -wg automatic-rename on
          set -g automatic-rename-format "#{pane_current_command}"

          set -g window-status-format " #I#{?#{!=:#{window_name},fish},: #W,} "
          set -g window-status-style "bg=default,fg=#{@thm_rosewater}"
          set -g window-status-last-style "bg=default,fg=#{@thm_mauve}"
          set -g window-status-activity-style "bg=#{@thm_red},fg=#{@thm_bg}"  
          set -g window-status-bell-style "bg=#{@thm_red},fg=#{@thm_bg},bold" 
          set -gF window-status-separator "#[bg=default,fg=#{@thm_overlay_0}]│"

          set -g window-status-current-format " #I#{?#{!=:#{window_name},fish},: #W,} "
          set -g window-status-current-style "bg=#{@thm_mauve},fg=#{@thm_bg},bold"

          run-shell ${pkgs.tmuxPlugins.tmux-sessionx}/share/tmux-plugins/sessionx/sessionx.tmux
      '';
  };
}

