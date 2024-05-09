> 了解字符串变量的长度以及`unsafe.Sizeof`的使用方法

> 了解如何获取字符串的长度(len方法)

> 字符串没有类似C字符串的`\0`或者`null`结束符

## 字符串变量的长度
Go语言中提供了`unsafe.Sizeof` 函数来确定一个类型变量占用空间大小,这个大小是不含它引用的内存大小.比如某结构体中一个字段是个指针类型,这个字段指向的内存是不计算进去的,只会计算该字段本身的大小.

```go
package main

import (
    "fmt"
    "unsafe"
)

func main() {
    a := "hello"
    size_of_string := unsafe.Sizeof(a)
    fmt.Printf("size_of_string = %d\n", size_of_string)
}
```
输出如下,只是证明了字符串变量的大小是16,不代表这个字符串的长度.
```
size_of_string = 16
```
这个长度正好符号如下的数据结构定义
```
type StringHeader struct {
    Data uintptr
    Len  int
}
```
 
## 字符串的长度

```go
package main

import (
    "fmt"
)

func main() {
    a := "hello"
     
    fmt.Printf("length of a string = %d\n", len(a))
}
```

输出如下
```
length of a string = 5
```
再来试试中文

```go
package main

import (
    "fmt"
)

func main() {
    a := "再来试试中文"
     
    fmt.Printf("length of a string = %d\n", len(a))
    fmt.Println(a)  
}

```

输出如下
```
length of a string = 18
再来试试中文
```
Go语言中字符串是以UTF-8编码表示的,一般来说一个汉字占用3个字节,所以上述6个`再来试试中文`正好18个字节.

这里要注意的是不像C语言,字符串有个结束符`\0`,Go是没有这样的结束符的.

## 如何判定空字符串

```
len(str) == 0
```
或者
```
str == ""
```