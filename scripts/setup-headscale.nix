{ pkgs }:

pkgs.writeShellApplication {
  name = "setup-headscale";
  text = ''
    sudo cp -r ./setting/headscale /etc
  '';
}
