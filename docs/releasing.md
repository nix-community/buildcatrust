<!--
SPDX-FileCopyrightText: 2025 the buildcatrust authors <buildcatrust@lukegb.com>

SPDX-License-Identifier: CC0-1.0
-->

# Releasing

This project uses automated releases. To release, a maintainer should:

1. Bump the version in `buildcatrust/__init__.py`, and commit with
   `chore(release): prepare x.y.z`
2. Locally test to make sure the release will work - from inside a `nix-shell`:
   1. Run the pre-commit hooks: `pre-commit run --all`
   2. Run pytest: `pytest`
   3. Build a test wheel: `flit build`
3. Push the new commit to a branch named `release/x.y.z`, and create a PR for
   it. Merge it once tests pass.
4. Pull the merge commit back down, tag it `vx.y.z`, and push the tag back up.
5. Find the release workflow triggered by the tag being pushed up - see
   https://github.com/nix-community/buildcatrust/actions/workflows/release.yaml
6. Once the "Upload release to PyPI" job starts, it will require approval to
   push to the pypi environment. If you're happy to proceed, grant it.

The release should then be uploaded to PyPI and a new GitHub Release created.
Congrats, you're done.
