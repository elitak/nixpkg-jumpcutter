## Introduction

This uses [Nix](https://nixos.org/nix) to pull in all the dependencies for jumpcutter.py from https://github.com/carykh/jumpcutter . It requires only basic utilities like curl and sudo and can be run in almost any unix-like terminal window that runs a POSIX shell. What follow are the steps to a quick-and-easy way to install `jumpcutter` into you environment, and a less automatic set of steps. Choose one.


## Fully Automatic Way:

        curl https://raw.githubusercontent.com/elitak/nixpkg-jumpcutter/master/install | sh
        source ~/.nix-profile/etc/profile.d/nix.sh # or create new terminal window
        jumpcutter --help


## Slightly More Manual Way:

First, install [Nix](https://nixos.org/nix) by running in a terminal window of any Linux distro or MacOS (and maybe even WSL):

        curl https://nixos.org/nix/install | sh

Now, to build and install:

        git clone https://github.com/elitak/nixpkg-jumpcutter # clones this repository
        cd nixpkg-jumpcutter
        nix-build # pulls & builds all dependencies and fixes up jumpcutter.py to use them
        nix-env -i ./result # installs into your $PATH variable


Your PATH environment variable should now be permanently updated to include the script. You can now run:

        jumpcutter --help
        jumpcutter --input_file infile.mp4 --output_file outfile.mp4

If you ever want to get the latest updates, run these commands again:

        cd nixpkg-jumpcutter
        git pull
        nix-build
        nix-env -i ./result

### Open issues in this github repo, if you have problems with anything related to the steps described above. Open them in https://github.com/carykh/jumpcutter if they've anything to do with the tool itself.
