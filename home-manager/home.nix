{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {

  imports = [
    ./modules/default.nix
 ];
  

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

   ];

    config = {
      allowUnfree = true;
    };
  };


  home = {
    username = "es46";
    homeDirectory = "/home/es46";
  };
  

  home.sessionVariables = {
    CARGO_MOMMYS_LITTLE = "boy/princess/pet";
    CARGO_MOMMYS_MOODS = "chill/thirsty";



  };

  fonts.fontconfig.enable = true;


  programs.vscode = {
  enable = true;
  package = pkgs.vscode.fhsWithPackages (ps: with ps; [
      openssl_3.dev
      pkg-config       
    ]);

 };

  
  programs.git = {
    enable = true;
    userName = "GitLab Username";
    userEmail = "Endersoul46";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
      credentials.helper = "libsecret";
    };
  };



 
  programs.home-manager.enable = true;

  
  
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
