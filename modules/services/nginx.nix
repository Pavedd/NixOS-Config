{
  flake.nixosModules.nginx = { pkgs, config, ... }: {
    services.nginx = {
      enable = true;

      recommendedProxySettings = true;

    #   virtualHosts."default" = {
    #     default = true;
    #
    #     locations."/" = {
    #       proxyPass = "https://example.com";
    #       extraConfig = ''
    #         proxy_ssl_server_name on;
    #         proxy_set_header Host example.com;
    #         proxy_set_header User-Agent "Mozilla/5.0";
    #       '';
    #     };
    #   };
    #
    };
    #
    # networking.firewall.allowedTCPPorts = [ 80 ];
  };
}
