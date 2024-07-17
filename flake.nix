{
  description = "Nix latex packaging utilities";

  outputs =
    { }:
    {
      lib = {
        buildLatexDocument = pkgs: pkgs.callPackage ./package.nix;
      };
    };
}
