{
  description = "Nix latex packaging utilities";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { }:
    {
      buildLatexDocument = import ./package.nix;
    };
}
