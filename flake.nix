{
  description = "Nix latex packaging utilities";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        developScript = pkgs.callPackage ./src/develop.nix { inherit pkgs; };
      in
      {
        lib = {
          buildLatexDocument = pkgs.callPackage ./src/package.nix;
        };
        misc = {
          inherit developScript;
        };
        devShells.default = pkgs.mkShell { shellHook = ''${developScript}/bin/develop.sh && exit''; };
      }
    );
}
