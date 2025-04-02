{
  description = "A simple Manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    process-compose-flake.url = "github:Platonic-Systems/process-compose-flake";

    Akari.url = "github:HadziqM/Akari";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    inputs@{
      home-manager,
      ...
    }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      imports = [
        inputs.process-compose-flake.flakeModule
        home-manager.flakeModules.home-manager
      ];
      flake = {
        homeConfigurations = import ./home {
          inherit home-manager;
          extraSpecialArgs = { inherit inputs; };
        };
      };
      perSystem =
        {
          self',
          pkgs,
          ...
        }:
        {
          process-compose = import ./services {
            inherit pkgs;
            specialArgs = { inherit inputs; };
          };
        };
    };
}
