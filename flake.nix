{
  description = "A simple Manager flake";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    system-manager = {
      url = "github:numtide/system-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    Akari.url = "github:HadziqM/Akari";

  };

  outputs =
    { self, system-manager }@inputs:
    {
      systemConfigs.default = system-manager.lib.makeSystemConfig {
        specialArgs = { inherit inputs; };
        modules = [
          ./modules
          {
            nixpkgs.config.allowUnfree = true;
          }
          inputs.home-manager.nixosModules.default
        ];
      };
    };
}
