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
      systems,
      ...
    }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import systems;
      imports = [
        inputs.process-compose-flake.flakeModule
        home-manager.flakeModules.home-manager
      ];
      perSystem =
        {
          pkgs,
          system,
          ...
        }:
        {
          ${system}.homeConfigurations = import ./home {
            pkgs = inputs.nixpkgs.legacyPackages.${system};
            inherit home-manager;
            extraSpecialArgs = { inherit inputs; };
          };
          process-compose = import ./services {
            inherit pkgs;
            specialArgs = { inherit inputs; };
          };
        };
    };
}
