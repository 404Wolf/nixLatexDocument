# A `buildLatexDocument` for Nix!

```nix
latex-utils.buildLatexDocument {
  inherit pkgs;
  name = "somelatexdocument";
  src = ./src/document.tex;
};
```

This function will build a LaTeX document from the given `src` file. It will
automatically include all the necessary packages and dependencies, and will
output a PDF file with the same name as the `name` attribute.

```
result
└── test.pdf
```

## Credit

Credit to [https://flyx.org/nix-flakes-latex/](https://flyx.org/nix-flakes-latex/) 
for information on how to build LaTeX documents with Nix reproducible.

