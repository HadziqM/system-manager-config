{
  pkgs ? import <nixpkgs> { },
}:

let
  # Get the list of all files in the scripts directory
  scriptFiles = builtins.attrNames (builtins.readDir ./scripts);

  # Import each script as a module
  scripts = builtins.map (file: import (./scripts + "/${file}") { inherit pkgs; }) scriptFiles;
in
pkgs.mkShell {
  buildInputs = scripts;
}
