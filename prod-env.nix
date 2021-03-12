with import <nixpkgs> { };
let
  my-python-packages = python-packages: with python-packages; [
#    pillow
#    numpy
  ]; 
  python-with-my-packages = python3.withPackages my-python-packages;
  my-python-packages-deps = [
#    zlib
#    libjpeg
#    freetype
#    lcms2
#    openjpeg
#    libtiff
#    tk
#    tcl
#    harfbuzz
#    fribidi
  ];
in
{ pythonProdEnv = buildEnv {
  name = "python-prod-env";
  paths = [
    # Always include nix, or environment will break
    # Include bash for base OSes without bash
    nix
    bash
    my-python-packages-deps
    python-with-my-packages
    ];
  };
}

