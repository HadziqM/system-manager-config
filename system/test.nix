{
  config,
  lib,
  pkgs,
  ...
}:

{
  config = {
    nixpkgs.hostPlatform = "x86_64-linux";
    system-manager.allowAnyDistro = true;

    systemPackages = [
      pkgs.hello
      pkgs.neofetch
    ];
  };

}
