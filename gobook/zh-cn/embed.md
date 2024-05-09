> 了解字符串类型的数据结构

> 了解如何通过`reflect`进行指针类型转换

> 了解如何通过`reflect`把指针类型转换uint



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


## References

- [Go by Example: Embed Directive](https://gobyexample.com/embed-directive)