{ pkgs ? import <nixpkgs> {} }:

let

  pythonPackages = pkgs.python27Packages;
  callPackage = pkgs.newScope pythonPackages;
  sounddevice = callPackage ./sounddevice.nix { };
  audiotsm = callPackage ./audiotsm.nix { inherit sounddevice; };
  PIL = callPackage ./PIL.nix { };

in pythonPackages.buildPythonApplication {

  name = "jumpcutter-1.0";

  src = pkgs.fetchFromGitHub {
    owner = "carykh";
    repo = "jumpcutter";
    rev = "67759fd5e731ad9e54387a40a57d1dddc070edc4";
    sha256 = "1wxm2hq0wb1xnr41xa000v19vk7afqmmng86yw93wwj71m2kbmkx";
  };

  propagatedBuildInputs = with pythonPackages; [
    scipy
    audiotsm
    numpy
    PIL
  ];

  dontBuild = true;

  installPhase = ''
    sed -ri jumpcutter.py -e 's|"ffmpeg |"${pkgs.ffmpeg}/bin/ffmpeg |'
    mkdir -p $out/bin
    cat -<<<"#! /usr/bin/env python" jumpcutter.py >$out/bin/jumpcutter
    chmod +x $out/bin/jumpcutter
  '';

  doCheck = false;
}
