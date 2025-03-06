let
  conf = builtins.fromJSON (builtins.readFile ../setting.json);
in
{

  imports = [
    ../../modules/home-manager/zsh.nix
  ];
}
