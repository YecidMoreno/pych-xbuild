# xbuild

Just another cross-compilation helper for C++ projects using Docker and CMake.

Automates building C++ projects across multiple targets using Docker containers.

## Features

- Build targets:
  - Native Linux (`x86_64-linux-gnu`)
  - Musl static binaries (`x86_64-alpine-linux-musl`)
  - ARM 64-bit (`aarch64-unknown-linux-gnu`, `pi` for Raspberry Pi)
- Post-build script support
- Debug mode (`--debug`)
- Clean build option
- Outputs in `./build/` and `./release/`
- Autocompletion for `xbuild`

## Getting Started

### 1. Build Docker Images

```bash
./xbuild_init.sh
```

Builds:

- `pych-xbuild-linux:v0.1`
- `pych-xbuild-musl:v0.1`

Also loads autocompletion.

### 2. Build the Project

```bash
./xbuild <target> [options]
```

Targets:

- `host`
- `aarch64`, `aarch64-unknown-linux-gnu`, `pi`
- `musl`, `x86_64-alpine-linux-musl`

Options:

- `--debug` – Debug build
- `--src <path>` – Source path (default: current dir)
- `-ps`, `--post-script "<command>"` – Run command after build
- `clean` – Remove build and release

Example:

```bash
./xbuild.sh host --src ./example -ps '$BIN/app'

# output
...
Done, Running post script...
>> $BIN/app
...
Hello from Xbuild . . .
```

```bash
./xbuild host --debug -ps "strip ./release/x86_64-linux-gnu/app"
```

## Toolchains

The toolchains/ folder includes sample CMake toolchain files, such as:

- toolchain-aarch64-unknown-linux-gnu.cmake

- toolchain-x86_64-alpine-linux-musl.cmake

You can modify these or add new ones to the same folder to support other targets. Currently, the folder is expected at cmake/toolchains either in the root or under the directory provided via --src. A new feature will allow setting this path explicitly.

## Requirements

- Docker
- Bash (Linux/macOS/WSL)
- CMake & Ninja (in Docker)

## License

MIT License

## Notes

- `xbuild clean` removes build outputs
- Easily extensible for more targets/toolchains