> 字符串、JSON、map之间的转换


## json转字符串
```go
package main  
  
import (  
    "encoding/json"  
    "fmt"  
)  
  
func main() {  
    // 假设我们有一个结构体实例  
    type Person struct {  
        Name string `json:"name"`  
        Age  int    `json:"age"`  
    }  
  
    p := Person{  
        Name: "Alice",  
        Age:  30,  
    }  
  
    // 将结构体转换为JSON字节切片  
    jsonData, err := json.Marshal(p)  
    if err != nil {  
        fmt.Println("JSON marshaling failed:", err)  
        return  
    }  
  
    // 将JSON字节切片转换为字符串  
    jsonString := string(jsonData)  
  
    // 打印JSON字符串  
    fmt.Println(jsonString)  
}
```


## 字符串转map

```go
package main  
  
import (  
    "encoding/json"  
    "fmt"  
)  
  
func main() {  
    // 假设我们有一个有效的JSON格式的文本字符串  
    jsonText := `{"name": "Alice", "age": 30}`  
  
    // 解析JSON文本到map中  
    var data map[string]interface{}  
    err := json.Unmarshal([]byte(jsonText), &data)  
    if err != nil {  
        fmt.Println("JSON parsing failed:", err)  
        return  
    }  
  
    // 现在你可以使用data这个map，或者再次将其转换为JSON字符串（如果需要的话）  
    jsonData, err := json.Marshal(data)  
    if err != nil {  
        fmt.Println("JSON marshaling failed:", err)  
        return  
    }  
  
    // 打印JSON字符串  
    fmt.Println(string(jsonData))  
}
```

## map中如何判断key是否存在

```go
package main  
  
import (  
    "fmt"  
)  
  
func main() {  
    // 创建一个map  
    myMap := map[string]int{  
        "key1": 1,  
        "key2": 2,  
    }  
  
    // 要检查的键  
    keyToCheck := "key1"  
  
    // 使用map的访问语法来判断键是否存在  
    // 如果键不存在，则返回值类型的零值（对于int类型就是0）  
    // 第二个返回值是一个布尔值，表示键是否存在于map中  
    value, exists := myMap[keyToCheck]  
    if exists {  
        fmt.Printf("键 '%s' 存在，对应的值为: %d\n", keyToCheck, value)  
    } else {  
        fmt.Printf("键 '%s' 不存在\n", keyToCheck)  
    }  
  
    // 另一种只检查键是否存在的方式，不获取值  
    _, exists = myMap["key3"]  
    if exists {  
        fmt.Println("键 'key3' 存在")  
    } else {  
        fmt.Println("键 'key3' 不存在")  
    }  
}
```