{ pkgs }:

pkgs.writeShellApplication {
  name = "run-system";
  text = ''
    #!/usr/bin/env bash

    # Check if argument is provided
    if [ -z "$1" ]; then
      echo "Usage: input profile <in documentation eg. server-minimal>"
      exit 1
    fi

    PROFILE=".#$1"
    nix run 'github:numtide/system-manager' -- switch --flake "$PROFILE" --impure
  '';
}
