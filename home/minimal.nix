{
  pkgs,
  ...
}:
let
  username = builtins.getEnv "USER";
in
{

  imports = [
    ../modules/home-manager/direnv.nix
    ../modules/home-manager/zsh.nix
    ../modules/home-manager/git.nix
    ../modules/home-manager/dotfile.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
      # File management and archives
      p7zip
      unzip
      unrar

      # System monitoring and management
      htop

      # Fun and customization
      fastfetch
      microfetch

      # Networking
      dig
    ];
    stateVersion = "25.05";
  };
  nixpkgs.config.allowUnfree = true;
}
