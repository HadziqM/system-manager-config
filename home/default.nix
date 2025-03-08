{
  home-manager,
  pkgs,
  extraSpecialArgs,
  ...
}:
let
  configuration = home-manager.lib.homeConfigurations;
in
{

  "developer" = configuration {
    inherit pkgs extraSpecialArgs;
    module = ./developer.nix;
  };

  "minimal" = configuration {
    inherit pkgs extraSpecialArgs;
    module = ./minimal.nix;
  };
}
