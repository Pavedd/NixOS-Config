{
  flake.nixosModules.ollama = { pkgs, config, ... }: {
    services.ollama = {
      enable = true;
      host = "0.0.0.0";
      port = 11434; 
      package = pkgs.unstable.ollama-rocm;
    };
    networking.firewall.allowedTCPPorts = [ 11434 ]; 
    environment.systemPackages = with pkgs; [
#      open-webui
    ];
 
  };
}
