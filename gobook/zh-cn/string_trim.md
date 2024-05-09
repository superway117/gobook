> 了解string.Trim及其相类似函数的用法

## Quickstart

`strings.Trim(s, cutset string)` 是Go语言(Golang)中的一个函数调用,用于从字符串line的两端(即开始和结束处)去除指定的字符集合.

比如 `strings.Trim(line, " \t\r\n")`,`Trim`函数会检查`line`的开始和结束部分,并移除这些字符,直到遇到第一个不是这些字符的字符为止.

相类似函数列表:
- `strings.Trim(s, cutset string)`
- `strings.TrimSpace(s)`
- `strings.TrimLeft(s, cutset string)`
- `strings.TrimRight(s, cutset string)`

## 源码分析

[Trim 源码](https://github.com/golang/go/blob/go1.22.0/src/strings/strings.go#L891)

```go
func Trim(s, cutset string) string {
  if s == "" || cutset == "" {
    return s
  }
  if len(cutset) == 1 && cutset[0] < utf8.RuneSelf {
    return trimLeftByte(trimRightByte(s, cutset[0]), cutset[0])
  }
  if as, ok := makeASCIISet(cutset); ok {
    return trimLeftASCII(trimRightASCII(s, &as), &as)
  }
  return trimLeftUnicode(trimRightUnicode(s, cutset), cutset)
}

// makeASCIISet creates a set of ASCII characters and reports whether all
// characters in chars are ASCII.
func makeASCIISet(chars string) (as asciiSet, ok bool) {
  for i := 0; i < len(chars); i++ {
    c := chars[i]
    if c >= utf8.RuneSelf {
      return as, false
    }
    as[c/32] |= 1 << (c % 32)
  }
  return as, true
}
```

函数的主要逻辑如下:
1. 检查输入:如果 s 或 cutset 为空字符串,则直接返回 s,因为没有什么可以移除的.

2. 单个字节字符优化:如果 cutset 只包含一个 ASCII 字符(即它的 ASCII 码小于 utf8.RuneSelf,通常是 128),那么可以使用字节级别的操作来快速移除 s 两端匹配的字符.trimLeftByte 和 trimRightByte 函数(在这个简化版本中未给出)会分别移除字符串左侧和右侧的特定字节.

3. ASCII 字符集优化:如果 cutset 只包含 ASCII 字符,并且不包含像 \n、\r、\t 这样的控制字符,那么可以构建一个 ASCII 字符集,并使用针对 ASCII 的快速算法进行修剪.makeASCIISet 函数会创建一个用于快速查找的 ASCII 字符集,而 trimLeftASCII 和 trimRightASCII 函数会使用这个字符集来移除字符串两侧匹配的字符.

4. Unicode 字符集处理:如果 cutset 包含非 ASCII 字符或控制字符,则需要进行更复杂的 Unicode 处理.trimLeftUnicode 和 trimRightUnicode 函数会处理这种情况,并移除字符串两侧匹配的 Unicode 字符.
## Usage

```go
package main

import (
    "fmt"
    "strings"
)

func main() {
    str := strings.Trim(" !!! A! A! !!! ", "! ")
    fmt.Println(len(str))
    fmt.Println(str)
}
```
输出如下,两端的`"! "`集合内的2个字符都被删除
```bash
4
A! A
```
常见用法

**去掉两边的空格**
```go
trimmed := strings.Trim(s, " ")  
```

**去掉两边的换行符和制表符**
```go
trimmed := strings.Trim(s, "\t\n")  
```

**去掉两边的,;**
```go
trimmed := strings.Trim(s, ",;")  
```

**去掉两边的不可见字符**
```go
trimmed := strings.Trim(s, "\r\n")  
```

你可以使用`strings.TrimSpace` 函数，它是`strings.Trim`的一个特殊版本，专门用于去除字符串两端的空白字符（包括空格、制表符、换行符、回车符等）：
```go

复制代码
package main  
  
import (  
  "fmt"  
  "strings"  
)  
  
func main() {  
  s := "\t\n Hello, World! \n\t"  
  trimmed := strings.TrimSpace(s)  
  fmt.Println(trimmed) // 输出: Hello, World!  
}
```