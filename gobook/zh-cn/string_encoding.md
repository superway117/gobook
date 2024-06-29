> 


## 判断是否是utf8编码

```go
utf8.ValidString(filename)
```
demo
```go
if utf8.ValidString(filename) { 
    fmt.Println("UTF-8 string") 
} else {
    fmt.Println("not a valid UTF-8 string") 
}
```

## gbk转utf8
```go
package main

import (
    "fmt"
    "golang.org/x/text/encoding/simplifiedchinese"
    "golang.org/x/text/transform"
    "io/ioutil"
    "log"
)

func main() {
    // GBK 编码的字符串
    gbkString := "\xd6\xd0\xb9\xfa\xc8\xaa\xca\xbe\xbe\xfc\xba\xc3"

    // 将 GBK 编码转换为 UTF-8 编码
    utf8String, err := DecodeGBKToUTF8([]byte(gbkString))
    if err != nil {
        log.Fatal(err)
    }

    fmt.Println("UTF-8 编码的字符串:", utf8String)
}

// 将 GBK 编码转换为 UTF-8 编码
func DecodeGBKToUTF8(input []byte) (string, error) {
    reader := transform.NewReader(bytes.NewReader(input), simplifiedchinese.GBK.NewDecoder())
    utf8Bytes, err := ioutil.ReadAll(reader)
    if err != nil {
        return "", err
    }
    return string(utf8Bytes), nil
}

```
