> fileio

## ioutil.ReadFile读文件

```go
package main

import (
   "os"
   "io/ioutil"
   "fmt"
)

func main() {
   fileName :=os.Args[1]
   content ,err :=ioutil.ReadFile(fileName)
   if err !=nil {
      panic(err)
   }
   fmt.Println(string(content))
}
```

## 按字节读取文件

```go
package main

import (
   "bufio"
   "fmt"
   "io"
   "io/ioutil"
   "os"
)

func main() {
   filepath :=os.Args[1]
   
   fi, err := os.Open(filepath)
   if err != nil {
      panic(err)
   }
   defer fi.Close()
   r := bufio.NewReader(fi)

   chunks := make([]byte, 0)
   buf := make([]byte, 1024) //一次读取多少个字节
   for {
      n, err := r.Read(buf)
      if err != nil && err != io.EOF {
         panic(err)
      }
      fmt.Println(string(buf[:n]))
      break
      if 0 == n {
         break
      }
      chunks = append(chunks, buf[:n]...)
   }
   fmt.Println(string(chunks))
}
```


## 按行读取文件



```go
package main

import (
  "bufio"
  "fmt"
  "os"
)

func main() {

  readFile, err := os.Open("data.txt")
 
  if err != nil {
    fmt.Println(err)
  }
  fileScanner := bufio.NewScanner(readFile)

  fileScanner.Split(bufio.ScanLines)
 
  for fileScanner.Scan() {
    fmt.Println(fileScanner.Text())
  }
 
  readFile.Close()
}
```
或者
```go
package main

import (
   "bufio"
   "fmt"
   "io"
   "io/ioutil"
   "os"
   "strings"
)

func main() {
   filepath :=os.Args[1]
   file, err := os.OpenFile(filepath, os.O_RDWR, 0666)
   if err != nil {
      fmt.Println("Open file error!", err)
      return
   }
   defer file.Close()

   stat, err := file.Stat()
   if err != nil {
      panic(err)
   }
   var size = stat.Size()
   fmt.Println("file size=", size)

   buf := bufio.NewReader(file)
   for {
      line, err := buf.ReadString('\n')
      line = strings.TrimSpace(line)
      fmt.Println(line)
      if err != nil {
         if err == io.EOF {
            fmt.Println("File read ok!")
            break
         } else {
            fmt.Println("Read file error!", err)
            return
         }
      }
   }

}
```


### 逐行读取文件到字符串数组

```go
package main

import (
  "bufio"
  "fmt"
  "os"
)

func main() {

  filePath := os.Args[1]
  readFile, err := os.Open(filePath)
 
  if err != nil {
    fmt.Println(err)
  }
  fileScanner := bufio.NewScanner(readFile)
  fileScanner.Split(bufio.ScanLines)
  var fileLines []string
 
  for fileScanner.Scan() {
    fileLines = append(fileLines, fileScanner.Text())
  }
 
  readFile.Close()
 
  for _, line := range fileLines {
    fmt.Println(line)
  }
  
  fmt.Println(fileLines)
}
```
## 获取文件行数

```go
package main
 
import (
  "os"
  "fmt"
  "bufio"
)
 
func main(){
  fileName :=os.Args[1]
  file,err := os.Open(fileName)
  if err != nil{
    return
  }
  defer file.Close()
  fd:=bufio.NewReader(file)
  count :=0
  for {
    _,err := fd.ReadString('\n')
    if err!= nil{
      break
    }
    count++
 
  }
  fmt.Println(count)
}
```

## 读取json文件

```go
package main
import (
   "encoding/json"
   "fmt"
   "io/ioutil"
   "log"
   "os"
)

func main() {
   fileContent, err := os.Open("users.json")

   if err != nil {
      log.Fatal(err)
      return
   }

   fmt.Println("The File is opened successfully...")

   defer fileContent.Close()

   byteResult, _ := ioutil.ReadAll(fileContent)

   var res map[string]interface{}
   json.Unmarshal([]byte(byteResult), &res)

   fmt.Println(res["users"])
}
```