> 

## Quickstart

[garble](https://github.com/burrowers/garble) produce a binary that works as well as a regular build, but that has as little information about the original source code as possible.

The tool is designed to be:

- Coupled with cmd/go, to support modules and build caching
- Deterministic and reproducible, given the same initial source code
- Reversible given the original source, to de-obfuscate panic stack traces

**install**

```
go install mvdan.cc/garble@latest
```

## Usage
Obfuscate Go code by wrapping the Go toolchain. Requires Go 1.20 or later.
```
garble build [build flags] [packages]
```

