{pkgs, ...}: {
  programs.zsh.enable = true;
  users.users.opgl.shell = pkgs.zsh;
  homeManager = {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      oh-my-zsh = {
        enable = true;
        plugins = ["git" "zsh-interactive-cd"];
        theme = "jonathan";
      };
      initExtra =
        #sh
        ''
          function nr() {
          nix run "nixpkgs#$1" -- $(shift; echo "$@")
          }
          function ns() {
          nix shell $(printf "nixpkgs#%s " "$@")
          }
        '';
    };
    programs.fzf.enable = true;
  };
}
