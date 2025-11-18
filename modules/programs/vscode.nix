{
 flake.homeModules.vscode = { pkgs, config, ... }:{
  programs.vscode = {
  enable = true;
  package = pkgs.vscode.fhsWithPackages (ps: with ps; [
      openssl_3.dev
      pkg-config       
    ]);

  };
 };
}
