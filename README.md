# nix-container-python
This repo contains files necessary to build a container with Nix and Python to be used in the XSEDE compute environment. Both Docker and Singularity are represented. 

This repo can be cloned as a template and used as a starting point for containerizing 
applications that require Python.

For a *very* simple example, see: https://github.com/XSEDE/nix-container-python-mandle

A more complex example is available at: https://github.com/XSEDE/nix-container-perfzero

An example containing both Python and R dependencies is available at:
https://github.com/XSEDE/nix-container-sc-benchmark

To include more Python libraries, edit prod-env.nix to pull these in, as demonstrated
with the commented-out lines installing Pillow, numpy, and the attendant system-level
dependencies.
