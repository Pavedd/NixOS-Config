{
  flake.nixosModules.nix-ld = {options, pkgs, config, ... }: { 
    programs.nix-ld = {
      enable = true;

      libraries = options.programs.nix-ld.libraries.default ++ (
          with pkgs; [
          cairo
          dbus
          dbus-glib
          dconf
          e2fsprogs
          espeak
          espeak-classic
          flac
          fontconfig
          freetype
          fuse
          glib
          gtk2
          gtk3
          krb5
          libdrm
          ffmpeg.dev
          libelf
          libGL
          libjpeg
          libogg
          libpng
          libpq
          libpulseaudio
          opencv # libqxcb
          libtiff
          libva
          libvorbis
          libxkbcommon
          pipewire
          wayland
          ]
          ) ++ (
            with pkgs.gnome; [
            gvfs
            ]
            ) ++ (
              with pkgs.xorg; [
              libICE
              libSM
              libX11
              libxcb
              libXcomposite
              libXcursor
              libXdamage
              libXext
              libXfixes
              libXft
              libXi
              libXinerama
              libXmu
              libXrandr
              libXrender
              libXScrnSaver
              libxshmfence
              libXt
              libXtst
              libXxf86vm
              xcbutil
              xcbutilerrors
              xcbutilimage
              xcbutilkeysyms
              xcbutilrenderutil
              xcbutilwm
              ]
              );
    };
  };
}
