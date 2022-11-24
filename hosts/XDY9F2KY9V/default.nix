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
      "iterm2"
      "meld"
      "visual-studio-code"
      "authy"
      "discord"
      "signal"
      "microsoft-teams"
      "spotify"
      "whatsapp"
      "slack"
      "jiggler"
      "dropbox"
    ];
  };

  environment.systemPackages = with pkgs; [
    automake
    awscli
    bash-completion
    bat
    btop
    calc
    cmake
    coreutils-full
    docker
    docker-compose
    dos2unix
    fd
    fzf
    gcc
    gdb
    git
    gnumake
    htop
    jq
    nasm
    ncdu
    neovim
    nmap
    nodejs
    packer
    pwgen
    python310
    ripgrep
    ruby_3_1
    shellcheck
    silver-searcher
    socat
    terraform
    tig
    tmate
    tmux
    tmuxinator
    tree
    universal-ctags
    watch
    wget
    zsh-syntax-highlighting
  ];

  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [
    dina-font
    fira-code
    fira-code-symbols
    hack-font
    liberation_ttf
    mplus-outline-fonts.githubRelease
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    proggyfonts
    terminus-nerdfont
  ];


}
