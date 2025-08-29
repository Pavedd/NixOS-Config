{lib, ... }:
let
  tdir = "/etc/nixos/home-manager/tmux";
in 
{
  programs.tmux = {
      enable = true;
      extraConfig = ''

        unbind C-b

        set-option -g prefix C-a
        bind C-a send-prefix

        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R

        set -g mouse on
        set -g default-terminal "tmux-256color"

# Configure the catppuccin plugin
        set -g @catppuccin_flavor "mocha"
        set -g @catppuccin_window_status_style "custom"

        set -g @catppuccin_pane_left_separator "◖"
        set -g @catppuccin_pane_middle_separator ""
        set -g @catppuccin_pane_right_separator "◗"
        set -g @catppuccin_status_connect_separator "yes"


        run '${tdir}/plugins/tmux/catppuccin.tmux'


# Make the status line pretty and add some modules
        set -g status-right-length 100
        set -g status-left-length 100
        set -g status-left ""
        set -g status-right "#{E:@catppuccin_status_application}"
        set -ag status-right "#{E:@catppuccin_status_session}"
        set -ag status-right "#{E:@catppuccin_status_uptime}"
          
        set -g status-style bg=default,fg=white
        set-option -g status-position top

        set -g @plugin 'catppuccin/tmux#v2.1.3'
        set -g @plugin '/tmux-plugins/tpm'
        set -g @plugin 'tmux-plugins/tmux-sensible'

        run '${tdir}/plugins/tpm/tpm'
        '';
  };
}

