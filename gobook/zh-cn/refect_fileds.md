> 了解通过reflect获取一个结构体的所有字段

> 通过fmt.Printf("%v\n", 变量名)打印变量的所有字段
 

## 通过reflect获取结构体的字段
```go
package main  
  
import (  
  "fmt"  
  "reflect"  
)  
  
type MyStruct struct {  
  Field1 int  
  Field2 string  
}  
  
func (m MyStruct) MyMethod() {  
  // 这是一个方法  
}  
  
func main() {  
  s := MyStruct{}  
  t := reflect.TypeOf(s)  
  
  // 打印字段名  
  for i := 0; i < t.NumField(); i++ {  
    field := t.Field(i)  
    fmt.Println("Field:", field.Name)  
  }  
  
  // 打印方法名  
  for i := 0; i < t.NumMethod(); i++ {  
    method := t.Method(i)  
    fmt.Println("Method:", method.Name)  
  }  
}
```

## 通过fmt获得结构体的字段

在Go语言的fmt包中,%+v是一个格式化动词,用于打印变量的详细输出.当使用%+v时,它会尝试打印出变量的字段名（如果变量是一个结构体）以及它们的值.这与使用%v相似,但%+v提供了更详细的信息.

具体来说：

- %v：以默认格式打印值.对于结构体,它只打印出字段的值.
- %+v：以默认格式打印值,并附加字段名.


```go
type Person struct {  
    Name string  
    Age  int  
}  
  
func main() {  
    person := Person{  
        Name: "Alice",  
        Age:  30,  
    }  
  
    fmt.Printf("%v\n", person)  // 输出可能是 {Alice 30}  
    fmt.Printf("%+v\n", person) // 输出可能是 {Name:Alice Age:30}  
}
```
在上面的例子中，%v只打印了字段的值，而%+v打印了字段名和它们的值。