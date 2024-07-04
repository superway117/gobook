> 了解Gin的使用

## Quickstart

[Gin](https://github.com/gin-gonic/gin) is a web framework written in Go. It features a martini-like API with performance that is up to 40 times faster thanks to httprouter. If you need performance and good productivity, you will love Gin.

The key features of Gin are:
- Zero allocation router
- Fast
- Middleware support
- Crash-free
- JSON validation
- Routes grouping
- Error management
- Rendering built-in
- Extendable


**install**
```go
go get -u github.com/gin-gonic/gin
```

## Usage

```go
package main

import (
  "net/http"

  "github.com/gin-gonic/gin"
)

func main() {
  r := gin.Default()
  r.GET("/ping", func(c *gin.Context) {
    c.JSON(http.StatusOK, gin.H{
      "message": "pong",
    })
  })
  r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}
```

```go
# run example.go and visit 0.0.0.0:8080/ping on browser
$ go run example.go
```



```go
func main() {
  r := gin.Default()

  r.GET("/JSONP", func(c *gin.Context) {
    data := map[string]interface{}{
      "foo": "bar",
    }
    
    // /JSONP?callback=x
    // 将输出：x({\"foo\":\"bar\"})
    c.JSONP(http.StatusOK, data)
  })

  // 监听并在 0.0.0.0:8080 上启动服务
  r.Run(":8080")
}
```
## References

[gin-gonic quickstart](https://gin-gonic.com/zh-cn/docs/quickstart/)