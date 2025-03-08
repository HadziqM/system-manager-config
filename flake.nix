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
    {
      self,
      nixpkgs,
      system-manager,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      systemConfigs.default = import ./system {
        inherit system-manager;
        specialArgs = { inherit inputs; };
      };
      homeConfigurations = import ./home {
        inherit pkgs home-manager;
        extraSpecialArgs = { inherit inputs; };
      };
    };
}
