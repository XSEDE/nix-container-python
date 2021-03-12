with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "devEnv";
  buildInputs = [
    nix
    bash
    vim
    gdb
    git
  ];
  src = null;
}
