{ nixpkgs ? import <nixpkgs> {} }:

let
    inherit (nixpkgs) pkgs;
    inherit (pkgs) haskellPackages;

    haskellDeps = ps: with ps; [ base ];

    project = import ./release.nix;

    ghc = haskellPackages.ghcWithPackages haskellDeps;

    nixPackages = [
        ghc
        haskellPackages.cabal-install
        pkgs.gdb
        pkgs.nixfmt
    ];
in
    pkgs.stdenv.mkDerivation {
        name = "haskell-nix-test";
        buildInputs = project.env.nativeBuildInputs ++ nixPackages;
    }