# Latex document builder for Nix

```nix
buildLatexDocument {
  inherit name;
  src = ./.;
  document = "document.tex";
  lastModified = self.lastModified;
  texpkgs = {
    inherit (pkgs.texlive)
      fancyhdr
      soulpos
      preprint
      ;
  };
};
```

This function will build a LaTeX document using the given `src` directory and specified
document. It will automatically include all the necessary packages and dependencies, 
and will output a PDF file with the same name as the `name` attribute.

```
result
└── document.pdf
```

# Latex Developer Environment

`nix develop` places you into a devshell where a nix build is automatically run
to build the LaTeX document every time any `tex` file changes. You can use a
PDF viewer that supports reloading (like Chromium or Firefox) to see the changes
in real time.

## Credit

Credit to [https://flyx.org/nix-flakes-latex/](https://flyx.org/nix-flakes-latex/) 
for information on how to build LaTeX documents with Nix reproducible.

