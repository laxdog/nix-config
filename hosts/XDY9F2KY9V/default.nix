# hosts/XDY9F2KY9V/default.nix
{ pkgs, ... }:
{

  # Make sure the nix daemon always runs
  # services.nix-daemon.enable = true;
  nix.useDaemon = true;
  programs.zsh.enable = true;
  
  system.defaults.dock.autohide = true;
  system.defaults.dock.orientation = "bottom";

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
      pkgs.automake
      pkgs.awscli
      pkgs.bash-completion
      pkgs.bat
      pkgs.btop
      pkgs.calc
      pkgs.cmake
      pkgs.coreutils-full
      pkgs.docker
      pkgs.docker-compose
      pkgs.dos2unix
      pkgs.fd
      pkgs.fzf
      pkgs.gcc
      pkgs.gdb
      pkgs.git
      pkgs.gnumake
      pkgs.hack-font
      pkgs.htop
      pkgs.jq
      pkgs.nasm
      pkgs.ncdu
      pkgs.neovim
      pkgs.nerdfonts
      pkgs.nmap
      pkgs.nodejs
      pkgs.pwgen
      pkgs.python310
      pkgs.ripgrep
      pkgs.ruby_3_1
      pkgs.shellcheck
      pkgs.silver-searcher
      pkgs.socat
      pkgs.terminus-nerdfont
      pkgs.tig
      pkgs.tmate
      pkgs.tmux
      pkgs.tree
      pkgs.universal-ctags
      pkgs.watch
      pkgs.wget
      pkgs.zsh-syntax-highlighting
    ];

}
