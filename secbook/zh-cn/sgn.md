SGN is a polymorphic binary encoder for offensive security purposes such as generating statically undetecable binary payloads. It uses a additive feedback loop to encode given binary instructions similar to [LSFR](https://en.wikipedia.org/wiki/Linear-feedback_shift_register). This project is the reimplementation of the [original Shikata ga nai](https://github.com/rapid7/metasploit-framework/blob/master/modules/encoders/x86/shikata_ga_nai.rb) in golang with many improvements. 


## How? & Why?
For offensive security community, the original implementation of shikata ga nai encoder is considered to be the best shellcode encoder(until now). But over the years security researchers found several pitfalls for statically detecing the encoder(related work [FireEye article](https://www.fireeye.com/blog/threat-research/2019/10/shikata-ga-nai-encoder-still-going-strong.html)). The main motive for this project was to create a better encoder that encodes the given binary to the point it is identical with totally random data and not possible to detect the presence of a decoder. With the help of [keystone](http://www.keystone-engine.org/) assembler library following improvments are implemented.

- [x] 64 bit support. `Finally properly encoded x64 shellcodes !`
- [x] New smaller decoder stub. `LFSR key reduced to 1 byte`
- [x] Encoded stub with pseudo random schema. `Decoder stub is also encoded with a psudo random schema`
- [x] No visible loop condition `Stub decodes itself WITHOUT using any loop conditions !!` 
- [x] Decoder stub obfuscation. `Random garbage instruction generator added with keystone`
- [x] Safe register option. `Non of the registers are clobbered (optional preable, may reduce polimorphism)` 

## Install

You can get the pre-compiled binaries [HERE](https://github.com/EgeBalci/sgn/releases). For building from source follow the steps bellow.

**Dependencies:**

The only dependency for building the source is the [keystone engine](https://github.com/keystone-engine/keystone), follow [these](https://github.com/keystone-engine/keystone/blob/master/docs/COMPILE.md) instructions for installing the library. Once libkeystone is installed on the system, simply just go install it ツ

```
go install github.com/EgeBalci/sgn@latest
```

***DOCKER INSTALL***

[![Docker](http://dockeri.co/image/egee/sgn)](https://hub.docker.com/r/egee/sgn/)

```
docker pull egee/sgn
docker run -it egee/sgn
```

**Usage**

`-h` is pretty self explanatory use `-v` if you want to see what's going on behind the scenes `( ͡° ͜ʖ ͡°)_/¯`
<p align="center">
  <img src="https://github.com/EgeBalci/sgn/raw/master/img/usage.gif">
</p>


```
       __   _ __        __                               _ 
  ___ / /  (_) /_____ _/ /____ _  ___ ____ _  ___  ___ _(_)
 (_-</ _ \/ /  '_/ _ `/ __/ _ `/ / _ `/ _ `/ / _ \/ _ `/ / 
/___/_//_/_/_/\_\\_,_/\__/\_,_/  \_, /\_,_/ /_//_/\_,_/_/  
========[Author:-Ege-Balcı-]====/___/=======v2.0.1=========  
    ┻━┻ ︵ヽ(`Д´)ﾉ︵ ┻━┻           (ノ ゜Д゜)ノ ︵ 仕方がない

Usage: sgn

Flags:
  -h, --help               Show context-sensitive help.
  -i, --input=STRING       Input binary path
  -o, --out=STRING         Encoded output binary name
  -a, --arch=64            Binary architecture (32/64)
  -c, --enc=1              Number of times to encode the binary (increases overall size)
  -M, --max=50             Maximum number of bytes for decoder obfuscation
      --plain              Do not encode the decoder stub
      --ascii              Generates a full ASCI printable payload (may take very long time to bruteforce)
  -S, --safe               Preserve all register values (a.k.a. no clobber)
      --badchars=STRING    Don't use specified bad characters given in hex format (\x00\x01\x02...)
  -v, --verbose            Verbose mode
      --version

```

***Docker Usage***

```
docker run -it -v /tmp/:/tmp/ sgn -i /tmp/shellcode
```

## Using As Library
Warning !! SGN package is still under development for better performance and several improvements. Most of the functions are subject to change.

```
package main

import (
  "encoding/hex"
  "fmt"
  "io/ioutil"

  sgn "github.com/egebalci/sgn/pkg"
)

func main() {
  // First open some file
  file, err := os.ReadFile("myfile.bin")
  if err != nil { // check error
    fmt.Println(err)
    return
  }
  // Create a new SGN encoder
  encoder, err := sgn.NewEncoder(64)
  if err != nil {
    fmt.Println(err)
    return
    } 
    // Set the proper architecture
  encoder.SetArchitecture(64)
  // Encode the binary
  encodedBinary, err := encoder.Encode(file)
  if err != nil {
    fmt.Println(err)
    return
  }
  // Print out the hex dump of the encoded binary
  fmt.Println(hex.Dump(encodedBinary))

}
```


## Execution Flow

The following image is a basic workflow diagram for the encoder. But keep in mind that the sizes, locations and orders will change for garbage instructions, decoders and schema decoders on each iteration. 

<p align="center">
  <img src="https://github.com/EgeBalci/sgn/raw/master/img/flow.png">
</p>

LFSR itself is pretty powerful in terms of probability space. For even more polimorphism garbage instructions are appended at the begining of the unencoded raw payload. Below image shows the the companion matrix of the characteristic polynomial of the LFSR and denoting the seed as a column vector, the state of the register in Fibonacci configuration after k steps.

<p align="center">
  <img src="https://github.com/EgeBalci/sgn/raw/master/img/matrices.svg">
</p>
## Used in Go

config it with Encode structure


```
type Encoder struct {
  architecture     int
  ObfuscationLimit int
  PlainDecoder     bool
  Seed             byte
  EncodingCount    int
  SaveRegisters    bool
}
```

```
package main

import (
  "encoding/hex"
  "fmt"
  "os"

  sgn "github.com/egebalci/sgn/pkg"
)

func main() {
  // First open some file
  file, err := os.ReadFile("myfile.bin")
  if err != nil { // check error
    fmt.Println(err)
    return
  }
  // Create a new SGN encoder
  encoder, err := sgn.NewEncoder(64)
  if err != nil {
    fmt.Println(err)
    return
  }
  // Encode the binary
  encodedBinary, err := encoder.Encode(file)
  if err != nil {
    fmt.Println(err)
    return
  }
  // Print out the hex dump of the encoded binary
  fmt.Println(hex.Dump(encodedBinary))

}
```

## References
- [github sgn](https://github.com/EgeBalci/sgn)
 