{ config, lib, pkgs, ... }:

{
  # installing necessary packages. Install new packages with this, to have a universal setup and list of apps
  environment.packages = with pkgs; [
    # main editor
    neovim  

    # necessary unitilies
    procps
    diffutils
    findutils
    utillinux
    man
    gnugrep
    gnutar
    bzip2
    gzip
    xz
    zip
    unzip
    coreutils
    gnused
    ncurses

    # shell
    zsh

    # core stuff
    git
    gh
    curl
    wget
    tree

    # custom terminal 
    tmux

    # programming stuff
    # C++
    cmake
    gnumake
    clang

    # Rust
    rustc
    cargo
    rust-analyzer
  ];

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "24.05";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  time.timeZone = "Europe/Berlin";

  # After installing home-manager channel like
  #   nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager
  #   nix-channel --update
  # you can configure home-manager in here like
  #home-manager = {
  #  useGlobalPkgs = true;
  #
  #  config =
  #    { config, lib, pkgs, ... }:
  #    {
  #      # Read the changelog before changing this value
  #      home.stateVersion = "24.05";
  #
  #      # insert home-manager config
  #    };
  #};
}

# vim: ft=nix

