> 了解字符串类型的数据结构

> 了解如何通过`reflect`进行指针类型转换

> 了解如何通过`reflect`把指针类型转换uint

 

```go
package main  
  
import (  
    "fmt"  
    "encoding/json"   
)  
  
type Address struct {  
    City   string  
    Street string  
}  
  
func (a Address) String() string {  
    return fmt.Sprintf("{City: %s, Street: %s}", a.City, a.Street)  
}  
  
type Person struct {  
    Name    string  
    Age     int  
    Address Address  
}  
  
 
func (p Person) String() string {  
    jsonString, err := json.Marshal(p)  
    if err != nil {  
        fmt.Println("Error marshaling to JSON:", err)  
        return ""
    }
    return string(jsonString)
}  
  
func main() {  
    // 创建一个Person实例  
    person := Person{  
        Name: "Alice",  
        Age:  30,  
        Address: Address{  
            City:   "New York",  
            Street: "123 Main St",  
        },  
    }  
  
    fmt.Println(person)
}
```

输出
```
{Name: Alice, Age: 30, Address: {City: New York, Street: 123 Main St}}
```