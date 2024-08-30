## json 格式化打印

```
package main

import (
  "encoding/json"
  "fmt"
)

func main() {
  data := map[string]interface{}{
    "name":  "Alice",
    "age":   30,
    "email": "alice@example.com",
  }

  // 使用 MarshalIndent 将数据编码为缩进格式的 JSON 数据
  jsonData, err := json.MarshalIndent(data, "", "    ")
  if err != nil {
    fmt.Println("Error encoding JSON:", err)
    return
  }

  // 使用 fmt.Println 打印格式化后的 JSON 数据
  fmt.Println(string(jsonData))
}
```