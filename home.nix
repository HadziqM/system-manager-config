{
  pkgs,
  inputs,
  ...
}:
let
  scriptFiles = builtins.attrNames (builtins.readDir ./scripts/home);
  scripts = builtins.map (file: import (./scripts/home + "/${file}") { inherit pkgs; }) scriptFiles;

  username = builtins.getEnv "USER";
in
{

  imports = [
    modules/home-manager/direnv.nix
    modules/home-manager/zsh.nix
    modules/home-manager/git.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    file = {
      # Top Level Files symlinks
      ".ideavimrc".source = dotfiles/.ideavimrc;

      # Config directories
      ".config/fastfetch".source = dotfiles/.config/fastfetch;
      ".config/kitty".source = dotfiles/.config/kitty;
      ".config/tmux/tmux.conf".source = dotfiles/.config/tmux/tmux.conf;
      ".config/yazi".source = dotfiles/.config/yazi;
    };
    sessionVariables = {
      # Default applications
      EDITOR = "nvim";
      VISUAL = "nvim";

      # XDG Base Directories
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_SCREENSHOTS_DIR = "$HOME/Pictures/screenshots";

      # Path modifications - now as a string
      # PATH = "$HOME/.local/bin:$HOME/go/bin:$PATH";

      # Localization
      LC_ALL = "en_US.UTF-8";
    };
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/go/bin"
      "$HOME/.cargo/bin"
    ];
    packages = with pkgs; [
      scripts
      # my NixVim configuration
      inputs.Akari.packages.${system}.default

      vim
      curl
      zsh-syntax-highlighting
      zsh-autosuggestions
      zsh-history-substring-search

      # Programming languages and tools
      python3
      python3Packages.pip
      nodePackages_latest.yarn
      openssl

      # Version control and development tools
      git
      gh
      lazygit
      coreutils

      # Shell and terminal utilities
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

      # Image and graphics
      imagemagick

      # System utilities
      ripgrep
      bat
      ansible

      # Clipboard managers
      cliphist
      xclip

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
