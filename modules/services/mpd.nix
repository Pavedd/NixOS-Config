{
  flake.homeModules.mpd = {lib, config, pkgs, ... }:
  {
    services.mpd = {
      enable = true;
      musicDirectory = "/home/es46/Music";
      extraConfig = ''
        bind_to_address "/tmp/mpd_socket"
        audio_output {
          type "pipewire"
            name "PipeWire Sound Server"
        }
      '';
    };

    programs.rmpc = {
      enable = true;
      config = ''
#![enable(implicit_some)]
#![enable(unwrap_newtypes)]
#![enable(unwrap_variant_newtypes)]
        (
         address: "/tmp/mpd_socket",
         password: None,
         volume_step: 5,
         max_fps: 30,
         scrolloff: 0,
         wrap_navigation: false,
         enable_mouse: true,
         status_update_interval_ms: 1000,
         select_current_song_on_change: false,
         album_art: (
           method: Auto,
           max_size_px: (width: 900, height: 900),
           disabled_protocols: ["http://", "https://"],
           vertical_align: Top,
           horizontal_align: Center,
           ),
         search: (
           case_sensitive: false,
           mode: Contains,
           tags: [
           (value: "any",         label: "Any Tag"),
           (value: "artist",      label: "Artist"),
           (value: "album",       label: "Album"),
           (value: "title",       label: "Title"),
           (value: "filename",    label: "Filename"),
           (value: "genre",       label: "Genre"),
           (value: "albumartist", label: "Featured"),
           ],
           ),
         )'';
    };

  };
}
