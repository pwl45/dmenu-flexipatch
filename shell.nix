{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    pkg-config
    xorg.libX11
    xorg.libXinerama
    xorg.libXft
    freetype
  ];
}
