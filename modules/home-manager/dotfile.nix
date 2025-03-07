{ pkgs, ... }:
{
  home.file = {
    # Top Level Files symlinks
    ".ideavimrc".source = ../../dotfiles/.ideavimrc;

    # Config directories
    ".config/tmux/tmux.conf".source = ../../dotfiles/.config/tmux/tmux.conf;
    ".config/yazi".source = ../../dotfiles/.config/yazi;

  };
  home.packages = with pkgs; [
    tmux
    yazi
    xclip
  ];
}
