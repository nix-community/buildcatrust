# SPDX-FileCopyrightText: 2021 the buildcatrust authors
#
# SPDX-License-Identifier: MIT

let
  sources = import ./npins;
  nixpkgs = import sources.nixpkgs {};
in
{ pkgs ? nixpkgs
}:

let
  python = pkgs.python3;
  myPython = python.withPackages (pm: with pm; [
    # for pre-commit
    pytest

    # for misc local testing
    pytest-cov
    pyasn1
    pyupgrade

    flit
  ]);
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    pre-commit
    myPython
    npins
    nixfmt
    openssl
    reuse
    ruff
    ty
  ];
}
