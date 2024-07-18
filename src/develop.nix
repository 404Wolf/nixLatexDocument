{ pkgs, ... }:
pkgs.writeShellScriptBin "develop.sh" ''
  function build {
    nix build --out-link tmp
    ${pkgs.coreutils}/bin/cp --no-preserve=mode tmp/share/*.pdf tmp.pdf
    ${pkgs.coreutils}/bin/rm -r tmp
  }
  export -f build
  ENTR=${pkgs.entr}/bin/entr
  find . -type f -name '*.tex' | $ENTR sh -c build
''
