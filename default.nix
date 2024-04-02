{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation {
  name = "dmenu";
  src = ./.;

  makeFlags = [ "PREFIX=$(out)" "MANPREFIX=$(out)/share/man" ];

  nativeBuildInputs = with pkgs; [ pkg-config ];

  buildInputs = with pkgs; [
    xorg.libX11
    xorg.libXinerama
    xorg.libXft
    freetype
  ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin $out/share/man/man1
    make PREFIX=$out MANPREFIX=$out/share/man install
    runHook postInstall
  '';
}
