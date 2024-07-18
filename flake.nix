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
          developScript = pkgs.callPackage ./lib/develop.nix;
      in
      {
        lib = {
          buildLatexDocument = pkgs.callPackage ./lib/package.nix;
        };
        devShells.default = pkgs.mkShell {
          shellHook = "${developScript}/bin/develop.sh && exit";
        };
      }
    );
}
