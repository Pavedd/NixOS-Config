{
  flake.nixosModules.base = { config, pkgs, ... }: {
    services.xserver.xkb = {
      layout = "eu";
      variant = "";
    };

    console.keyMap = "us";


    services.keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" ];
          settings = {
            main = {
              capslock = "overload(control, esc)"; # Caps Lock as Ctrl when held, Esc when tapped
            };
            alt = {
              capslock = "capslock";
            };
          };
        };
      };
    };
  };
}
