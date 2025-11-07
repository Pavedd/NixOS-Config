{
  flake.nixosModules.current = {lib, config, ...}: 
    let
    hostname = "twinkpad";
    username = "es46";
    in{
     networking.hostName = "${hostname}";
  };
}
