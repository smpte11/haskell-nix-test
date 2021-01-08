{ pkgs ? import <nixpkgs> { }, ghc ? pkgs.ghc }:
with pkgs;

haskell.lib.buildStackProject {
  inherit ghc;
  name = "haskell-nix-test";
  buildInputs = [ nixfmt ];
}
