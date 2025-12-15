#!/usr/bin/env bash
set -euo pipefail

# Simple CI script for Linux/macOS:
# - Removes existing build directory
# - Configures with CMake (use CMake's default generator; do NOT force Ninja)
# - Builds the project
# - Runs ctest with output on failure

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="$ROOT_DIR/build"

command -v cmake >/dev/null 2>&1 || { echo "cmake is required but not found in PATH"; exit 1; }

echo "CI: cleaning build directory: $BUILD_DIR"
if [ -d "$BUILD_DIR" ]; then
  rm -rf "$BUILD_DIR"
fi
mkdir -p "$BUILD_DIR"

echo "CI: configuring with CMake (using CMake's default generator)"
cmake -S "$ROOT_DIR" -B "$BUILD_DIR" -DCMAKE_BUILD_TYPE=Release

echo "CI: building"
if command -v getconf >/dev/null 2>&1; then
  JOBS="$(getconf _NPROCESSORS_ONLN || echo 1)"
else
  JOBS=1
fi
cmake --build "$BUILD_DIR" -- -j"$JOBS"

echo "CI: running tests (output on failure)"git update-index --chmod=+x ci.sh
ctest --test-dir "$BUILD_DIR" --output-on-failure --parallel "$JOBS"

echo "CI: finished successfully"