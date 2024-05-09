> 了解字符串类型的数据结构

> 了解如何通过`reflect`进行指针类型转换

> 了解如何通过`reflect`把指针类型转换uint

Go 中使用`strings`包来完成对字符串的主要操作

## 前缀和后缀
`HasPrefix`判断字符串是否以 `prefix` 开头:

```go
strings.HasPrefix(s, prefix string) bool
```
`HasSuffix`判断字符串是否以 `suffix ` 开头:

```go
strings.HasSuffix(s, suffix  string) bool
```
下面是[HasPrefix和HasSuffix](https://github.com/golang/go/blob/go1.22.0/src/strings/strings.go#L466)的源码, 先通过长度比较,然后通过slice做比较

```go
// HasPrefix reports whether the string s begins with prefix.
func HasPrefix(s, prefix string) bool {
    return len(s) >= len(prefix) && s[0:len(prefix)] == prefix
}

// HasSuffix reports whether the string s ends with suffix.
func HasSuffix(s, suffix string) bool {
    return len(s) >= len(suffix) && s[len(s)-len(suffix):] == suffix
}
```

参考代码
```
import (
    "fmt"
)

func main() {
    var str string = "This is an example of a string"
    fmt.Printf("%s have prefix %s", str, "Th")

}
```

## 包含子字符串
[Contains](https://github.com/golang/go/blob/go1.22.0/src/strings/strings.go#L60)判断字符串是否包含 substr

```go
strings.Contains(s, substr string) bool
```

## 子字符串在父字符串中出现的位置

[Index](https://github.com/golang/go/blob/go1.22.0/src/strings/strings.go#L1189)返回字符串 str 在字符串 s 中的索引(str 的第一个字符的索引),-1 表示字符串 s 不包含字符串 str

```go
strings.Index(s, str string) int
```

[LastIndex](https://github.com/golang/go/blob/go1.22.0/src/strings/strings.go#L80)返回字符串 str 在字符串 s 中最后出现位置的索引(str 的第一个字符的索引),-1 表示字符串 s 不包含字符串 str
```go
strings.LastIndex(s, str string) int
```