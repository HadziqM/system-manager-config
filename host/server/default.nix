{
  pkgs,
  inputs,
  ...
}:
let
  conf = builtins.fromJSON (builtins.readFile ../../setting.json);
in
{

  home-manager = {
    extraSpecialArgs = { inherit inputs; };

    users = {
      ${conf.user} = import ./home.nix;
    };
  };

  config = {
    nixpkgs.hostPlatform = "x86_64-linux";

    environment = {
      systemPackages = with pkgs; [
        curl
        zsh
        zsh-syntax-highlighting
        zsh-autosuggestions
        zsh-history-substring-search

        # Programming languages and tools
        lua
        python3
        python3Packages.pip
        nodePackages_latest.yarn
        # gcc
        # ninja
        openssl

        # Version control and development tools
        git
        gh
        lazygit
        coreutils

        # Shell and terminal utilities
        stow
        wget
        killall
        eza
        fzf
        tmux
        progress
        tree

        # File management and archives
        yazi
        p7zip
        unzip
        unrar

        # System monitoring and management
        htop
        btop

        # Network and internet tools
        aria2
        qbittorrent

        # Image and graphics
        imagemagick

        # System utilities
        libgcc
        bc
        ripgrep
        bat

        # Clipboard managers
        cliphist
        xclip

        # Fun and customization
        fastfetch
        microfetch

        # Networking
        dig
      ];
    };
  };
}
