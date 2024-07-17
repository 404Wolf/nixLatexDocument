{
  description = "Nix latex packaging utilities";

  inputs = { };

  outputs =
    { self, ... }:
    {
      buildLatexDocument = import ./package.nix;
    };
}
