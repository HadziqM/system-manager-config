{
  home-manager,
  pkgs,
  extraSpecialArgs,
  ...
}:
let
  configuration = home-manager.lib.homeManagerConfiguration;
in
{

  "developer" = configuration {
    inherit pkgs extraSpecialArgs;
    modules = [ ./developer.nix ];
  };

  "minimal" = configuration {
    inherit pkgs extraSpecialArgs;
    modules = [ ./minimal.nix ];
  };
  "casual" = configuration {
    inherit pkgs extraSpecialArgs;
    modules = [ ./casual.nix ];
  };
}
