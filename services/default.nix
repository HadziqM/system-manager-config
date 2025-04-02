{
  pkgs,
  specialArgs,
  ...
}:
{
  "test" = {
    cli = {
      options = {
        no-server = true;
      };
    };

    settings = {
      processes = {
        echoing.command = ''
          while true; do
            echo "hello test"
            sleep 2
          done
        '';
      };
    };
  };
}
