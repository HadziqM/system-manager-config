{
  programs.git = {
    enable = true;
    userName = "HadziqM";
    userEmail = "dimascrazz@gmail.com";
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
