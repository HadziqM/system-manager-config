{
  system-manager,
  specialArgs,
  ...
}:
let
  sys = system-manager.lib.makeSystemConfig;
in
{
  "server-minimal" = sys {
    inherit specialArgs;
    module = ./server-minimal.nix;
  };
}
