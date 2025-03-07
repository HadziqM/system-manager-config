{ pkgs }:

pkgs.writeShellApplication {
  name = "test";
  text = ''
    echo "tested"
  '';
}
