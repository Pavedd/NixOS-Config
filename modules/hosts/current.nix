{
  flake.nixosConfigurations.current = {lib, config, ...}: 
    let
    hostname = "astolfo";
    username = "es46";
    in{
     networking.hostName = "${hostname}";
  };
}
