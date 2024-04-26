> 路径相关的常用函数

## 获取当前工作目录 

```
package main  
  
import (  
    "fmt"  
    "os"  
    "path/filepath"  
)  
  
func main() {  
    // 获取当前工作目录  
    cwd, err := os.Getwd()  
    if err != nil {  
        fmt.Printf("Error getting current working directory: %v\n", err)  
        return  
    }  
    fmt.Printf("Current Working Directory: %s\n", cwd)  
  
    // 获取当前可执行文件的路径  
    exePath, err := os.Executable()  
    if err != nil {  
        fmt.Printf("Error getting executable path: %v\n", err)  
        return  
    }  
    fmt.Printf("Executable Path: %s\n", exePath)  
  
    // 获取可执行文件所在的目录  
    exeDir := filepath.Dir(exePath)  
    fmt.Printf("Executable Directory: %s\n", exeDir)  
}
```