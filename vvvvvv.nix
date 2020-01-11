{ pkgs, stdenv, lib, SDL2, SDL2_mixer, cmake }:

{
  desktop-version = stdenv.mkDerivation rec {
    name = "vvvvvv-desktop-${version}";
    version = "0.0.0";

    src = [ ./desktop_version ./third_party ];
    sourceRoot = "desktop_version";

    buildInputs = [ SDL2 SDL2_mixer cmake ];

    installPhase = ''
      mkdir -p $out/bin
      cp VVVVVV $out/bin
    '';

    meta = {
      description = "VVVVVV by Terry Cavanagh";
      homepage = https://github.com/TerryCavanagh/VVVVVV;
      platforms = [ "x86_64-linux" ];
    };
  };
}
