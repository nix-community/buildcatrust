# SPDX-FileCopyrightText: 2021 the buildcatrust authors
#
# SPDX-License-Identifier: MIT

{ pkgs ? import <nixpkgs> {
    # overlays = [ (self: super: { }) ];
  }
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
    openssl
    reuse
    ruff
    ty
  ];
}
