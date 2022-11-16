# hosts/XDY9F2KY9V/default.nix
{ pkgs, ... }:
{

  # Make sure the nix daemon always runs
  # services.nix-daemon.enable = true;
  nix.useDaemon = true;
  programs.zsh.enable = true;
  
  system.defaults.dock.autohide = true;
  # system.defaults.dock.orientation = "left";

  # system.keyboard.enableKeyMapping = true;
  # system.keyboard.remapCapsLockToControl = true;

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.mrobinson = { pkgs, ... }: {
    home.stateVersion = "22.05"; # read below
    programs.tmux = { # my tmux configuration, for example
      enable = true;
      keyMode = "vi";
      clock24 = true;
      historyLimit = 10000;
      plugins = with pkgs.tmuxPlugins; [
        vim-tmux-navigator
        gruvbox
      ];
      extraConfig = ''
        new-session -s main
        bind-key -n C-a send-prefix
      '';
    };
  };
  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.upgrade = true; # updates homebrew packages on activation ,
    # can make darwin-rebuild much slower (otherwise i'd forget to do it ever though)
    casks = [
      "discord"
      "spotify"
      "iterm2"
      "meld"
      "visual-studio-code"
      "authy"
      "microsoft-teams"
      "jiggler"
    ];
  };

  environment.systemPackages =
    [
      pkgs.awscli
      pkgs.calc
      pkgs.coreutils-full
      pkgs.fd
      pkgs.gdb
      pkgs.jq
      pkgs.nasm
      pkgs.neovim
      pkgs.nodejs
      pkgs.pwgen
      pkgs.python310
      pkgs.ripgrep
      pkgs.ruby_3_1
      pkgs.shellcheck
      pkgs.socat
      pkgs.tmux
      pkgs.tree
      pkgs.universal-ctags
      pkgs.zsh-syntax-highlighting
      pkgs.automake
      pkgs.gcc
      pkgs.cmake
      pkgs.gnumake
      pkgs.git
      pkgs.tig
      pkgs.tmux
      pkgs.tmate
      pkgs.htop
      pkgs.btop
      pkgs.bash-completion
      pkgs.dos2unix
      pkgs.jq
      pkgs.ncdu
      pkgs.nmap
      pkgs.tig
      pkgs.tree
      pkgs.wget
      pkgs.watch
      pkgs.nodejs
      pkgs.fzf
      pkgs.bat
      pkgs.fd
      pkgs.docker
      pkgs.docker-compose
      pkgs.nerdfonts
      pkgs.hack-font
      pkgs.terminus-nerdfont
      pkgs.silver-searcher
    ];

}
