## 介绍

[embed](https://pkg.go.dev/embed) provides access to files embedded in the running Go program.

Go source files that import "embed" can use the //go:embed directive to initialize a variable of type string, []byte, or FS with the contents of files read from the package directory or subdirectories at compile time.

For example, here are three ways to embed a file named hello.txt and then print its contents at run time.

Embedding one file into a string:

```go
import _ "embed"

//go:embed hello.txt
var s string
print(s)
```

Embedding one file into a slice of bytes:
```go
import "embed"

//go:embed hello.txt
var f embed.FS
data, _ := f.ReadFile("hello.txt")
print(string(data))
```

```
package main

import (
    "embed"
)

//go:embed folder/single_file.txt
var fileString string

//go:embed folder/single_file.txt
var fileByte []byte

//go:embed folder/single_file.txt
//go:embed folder/*.hash
var folder embed.FS

func main() {

    print(fileString)
    print(string(fileByte))

    content1, _ := folder.ReadFile("folder/file1.hash")
    print(string(content1))

    content2, _ := folder.ReadFile("folder/file2.hash")
    print(string(content2))
}
```
## References

- [Go by Example: Embed Directive](https://gobyexample.com/embed-directive)