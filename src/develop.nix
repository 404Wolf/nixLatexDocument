{ pkgs, ... }:
pkgs.writeShellScriptBin "develop.sh" ''
  function build {
    nix build --out-link tmp
    cp tmp/share/*.pdf tmp.pdf
    rm -r tmp
  }
  export -f build
  ENTR=${pkgs.entr}/bin/entr
  find . -type f -name '*.tex' | $ENTR sh -c build
''
