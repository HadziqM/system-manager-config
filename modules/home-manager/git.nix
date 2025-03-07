let
  conf = builtins.fromJSON (builtins.readFile ../../setting.json);
in
{
  programs.git = {
    enable = true;
    userName = conf.github.username;
    userEmail = conf.github.email;
    extraConfig = {
      init.defaultBranch = "main";
    };
    aliases = {
      ci = "commit";
      co = "checkout";
      s = "status";
    };
  };
}
