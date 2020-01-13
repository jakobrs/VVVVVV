{ pkgs, stdenv, lib, SDL2, SDL2_mixer, cmake }:

let
  isDarwin = stdenv.system == "x86_64-darwin";
  frameworks = pkgs.darwin.apple_sdk.frameworks;

in {
  desktop-version = stdenv.mkDerivation rec {
    name = "vvvvvv-desktop-${version}";
    version = "0.0.0";

    src = [ ./desktop_version ./third_party ];
    sourceRoot = "desktop_version";

    buildInputs = [ SDL2 SDL2_mixer cmake ]
      ++ lib.optional isDarwin (with frameworks; [ Foundation ]);

    installPhase = ''
      mkdir -p $out/bin
      cp VVVVVV $out/bin
    '';

    meta = {
      description = "A game by Terry Cavanagh";
      homepage = "thelettervsixtim.es";
      #license = lib.licenses.unfreeRedistributable;
      platforms = [ "x86_64-linux" "x86_64-darwin" ];
    };
  };
}
