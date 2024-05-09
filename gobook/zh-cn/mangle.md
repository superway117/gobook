> Mangle usage

## Quickstart

[Mangle](https://github.com/Tylous/Mangle) is a tool that manipulates aspects of compiled executables (.exe or DLL). Mangle can remove known Indicators of Compromise (IoC) based strings and replace them with random characters, change the file by inflating the size to avoid EDRs, and can clone code-signing certs from legitimate files. In doing so, Mangle helps loaders evade on-disk and in-memory scanners.

**install**

`go get github.com/Binject/debug/pe`

**build**
`go build Mangle.go`


## Usage

```bash
./mangle -h

       _____                        .__
      /     \ _____    ____    ____ |  |   ____
     /  \ /  \\__  \  /    \  / ___\|  | _/ __ \
    /    Y    \/ __ \|   |  \/ /_/  >  |_\  ___/
    \____|__  (____  /___|  /\___  /|____/\___  >
        \/     \/     \//_____/       \/
                    (@Tyl0us)
Usage of ./Mangle:
  -C string
        Path to the file containing the certificate you want to clone
  -I string
        Path to the orginal file
  -M    Edit the PE file to strip out Go indicators
  -O string
        The new file name
  -S int
        How many MBs to increase the file by
```