## 字符串按指定字符进行分割

```go
package main

import (
    "fmt"
    "strings"
)

func main() {
    str := "Hello;World;Golang"
    fields := strings.Split(str, ";")
    for _, field := range fields {
        fmt.Println(field)
    }
}
```

## 字符串按空格做分割
```go
package main

import (
    "fmt"
    "strings"
)

func main() {
    str := "Hello   World   Golang"
    fields := strings.Fields(str)
    for _, field := range fields {
        fmt.Println(field)
    }
}
```
