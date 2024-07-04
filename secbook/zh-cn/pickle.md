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
 