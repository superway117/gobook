> pickle

## Quickstart
[GoPickle](https://github.com/nlpodyssey/gopickle) is a Go library for loading Python's data serialized with pickle and PyTorch module files.

## 读取pkl文件

```go
package main  
  
import (  
  "encoding/json"  
  "fmt"  
  "log"  
  "os"  
  
  "github.com/nlpodyssey/gopickle/pickle"  
)  
  
func main() {  
  // 打开pickle文件  
  pickleFile, err := os.Open("xx.pkl")  
  if err != nil {  
    log.Fatalf("Error opening pickle file: %v", err)  
  }  
  defer pickleFile.Close()  
  
  // 使用gopickle库读取pickle文件  
  unpickler := pickle.NewUnpickler(pickleFile)  
  obj, err := unpickler.Load()  
  if err != nil {  
    log.Fatalf("Error unpickling file: %v", err)  
  }  
  
  // 将解析出的对象转换为JSON  
  jsonBytes, err := json.Marshal(obj)  
  if err != nil {  
    log.Fatalf("Error marshaling to JSON: %v", err)  
  }  
  
  // 打印JSON内容  
  fmt.Println(string(jsonBytes))  
}
```

## 写入map到pkl文件

```go
package main  
  
import (  
 "fmt"  
 "log"  
 "os"  
  
 "github.com/nlpodyssey/gopickle/pickle"  
)  
  
func main() {  
 // 创建一个 map  
 myMap := map[string]int{  
 "one":   1,  
 "two":   2,  
 "three": 3,  
 }  
  
 // 打开一个文件用于写入  
 file, err := os.Create("my_map.pkl")  
 if err != nil {  
 log.Fatal(err)  
 }  
 defer file.Close()  
  
 // 使用 gopickle 将 map 写入文件  
 err = pickle.Dump(myMap, file)  
 if err != nil {  
 log.Fatal(err)  
 }  
  
 fmt.Println("Map successfully written to file!")  
}
```