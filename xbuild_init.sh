#!/bin/bash
#
# xbuild_init.sh - Initializes Docker build environments for cross-platform builds
#
# Author: Yecid Moreno <GitHub @YecidMoreno> <Email yecidmoreno@alumni.usp.br>
# Created: 2025-07-18
# Description:
#   Builds Docker images for Linux and musl-based cross-compilation,
#   and sources the shell autocompletion script for xbuild usage.
#
# Usage:
#   ./xbuild_init.sh
#
# Requirements:
#   - Docker installed and running
#   - linux.Dockerfile and musl.Dockerfile in the same directory
#   - xbuild_completion.sh for shell autocompletion
#

# Get the absolute path of this script's directory
XBUILD_DIR="$(dirname "$(readlink -f "$0")")"

echo "Using $XBUILD_DIR"

# Build the Linux cross-compilation Docker image
docker build -t pych-xbuild-linux:v0.1 \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g) \
    -f "$XBUILD_DIR/linux.Dockerfile" \
    .

# Build the musl cross-compilation Docker image
docker build -t pych-xbuild-musl:v0.1 \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g) \
    -f "$XBUILD_DIR/musl.Dockerfile" \
    .

# Load xbuild autocompletion for interactive use
source "$XBUILD_DIR/xbuild_completion.sh"
