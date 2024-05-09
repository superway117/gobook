## 遍历文件,发现是文件类型用go协程处理

```go
package main  
  
import (  
  "fmt"  
  "os"  
  "path/filepath"  
  "sync"  
)  
  
func main() {  
  // 创建一个通道来发送文件路径  
  filePathsChan := make(chan string)  
  
  // 创建一个WaitGroup来等待所有处理goroutine完成  
  var wg sync.WaitGroup  
  
  // 启动一个goroutine来遍历目录并发送文件路径  
  go func() {  
    defer close(filePathsChan) // 遍历完成后关闭通道  
  
    // 定义遍历目录的回调函数  
    visit := func(path string, f os.FileInfo, err error) error {  
      if err != nil {  
        fmt.Printf("遍历目录时出错: %v\n", err)  
        return err  
      }  
      if !f.IsDir() {  
        // 发送文件路径到通道  
        filePathsChan <- path  
      }  
      return nil  
    }  
  
    // 遍历起始目录及其所有子目录  
    err := filepath.Walk("C:/workshop/llm", visit)  
    if err != nil {  
      fmt.Printf("遍历目录时出错: %v\n", err)  
      return  
    }  
  }()  
  
  // 启动多个goroutine来处理文件路径  
  const numGoroutines = 4 // 可以根据需要调整goroutine的数量  
  for i := 0; i < numGoroutines; i++ {  
    wg.Add(1) // 增加WaitGroup的计数器  
    go func() {  
      defer wg.Done() // 处理完成后减少WaitGroup的计数器  
      for filePath := range filePathsChan {  
        // 在这里处理文件路径，例如打印出来或进行其他操作  
        fmt.Println("处理文件:", filePath)  
        // 模拟一些处理时间  
        // time.Sleep(time.Second)  
      }  
    }()  
  }  
  
  // 等待所有处理goroutine完成  
  wg.Wait()  
  fmt.Println("所有文件处理完成")  
}
```