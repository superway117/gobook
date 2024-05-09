> 了解Logrus的使用方法、使用场景

## Quickstart

[Logrus](https://github.com/sirupsen/logrus)is a structured logger for Go (golang), completely API compatible with the standard library logger.

Logrus' biggest contribution is to have played a part in today's widespread use of structured logging in Golang

logrus完全兼容标准的log库,还支持文本,JSON两种日志输出格式.很多知名的开源项目都使用了这个库,如大名鼎鼎的 docker.


**安装**

```bash
go get github.com/sirupsen/logrus
```

## Usage

```go
package main

import (
  "github.com/sirupsen/logrus"
)

func main() {
  logrus.SetLevel(logrus.TraceLevel)

  logrus.Trace("trace msg")
  logrus.Debug("debug msg")
  logrus.Info("info msg")
  logrus.Warn("warn msg")
  logrus.Error("error msg")
  logrus.Fatal("fatal msg")
  logrus.Panic("panic msg")
}
```
logrus的使用非常简单,与标准库log类似.logrus支持更多的日志级别:
- Panic:记录日志,然后panic
- Fatal:致命错误,出现错误时程序无法正常运转.输出日志后,程序退出
- Error
- Warn
- Info
- Debug
- Trace


日志级别从上向下依次增加,Trace最大,Panic最小.logrus有一个日志级别,高于这个级别的日志不会输出.默认的级别为InfoLevel.所以为了能看到Trace和Debug日志,我们在main函数第一行设置日志级别为TraceLevel。

```bash
$ go run main.go
time="2020-02-07T21:22:42+08:00" level=trace msg="trace msg"
time="2020-02-07T21:22:42+08:00" level=debug msg="debug msg"
time="2020-02-07T21:22:42+08:00" level=info msg="info msg"
time="2020-02-07T21:22:42+08:00" level=info msg="warn msg"
time="2020-02-07T21:22:42+08:00" level=error msg="error msg"
time="2020-02-07T21:22:42+08:00" level=fatal msg="fatal msg"
exit status 1
```

由于logrus.Fatal会导致程序退出,下面的logrus.Panic不会执行到。
输出中有三个关键信息,time、level和msg
- time:输出日志的时间；
- level:日志级别；
- msg:日志信息。

### 输出文件名

调用logrus.SetReportCaller(true)设置在输出日志中添加文件名和方法信息

```go
package main

import (
  "github.com/sirupsen/logrus"
)

func main() {
  logrus.SetReportCaller(true)

  logrus.Info("info msg")
}
```

输出如下
```bash
$ go run main.go
time="2020-02-07T21:46:03+08:00" level=info msg="info msg" func=main.main file="D:/code/golang/src/github.com/darjun/go-daily-lib/logrus/caller/main.go:10"
```

### 自定义字段打印

有时候需要在输出中添加一些字段,可以通过调用logrus.WithField和logrus.WithFields实现.logrus.WithFields接受一个logrus.Fields类型的参数,其底层实际上为map[string]interface{}

```
// github.com/sirupsen/logrus/logrus.go
type Fields map[string]interface{}
```

下面程序在输出中添加两个字段name和age：

```go
package main

import (
  "github.com/sirupsen/logrus"
)

func main() {
  logrus.WithFields(logrus.Fields{
    "name": "dj",
    "age": 18,
  }).Info("info msg")
}
```

如果在一个函数中的所有日志都需要添加某些字段,可以使用WithFields的返回值.例如在 Web 请求的处理器中,日志都要加上user_id和ip字段：

```go
package main

import (
  "github.com/sirupsen/logrus"
)

func main() {
  requestLogger := logrus.WithFields(logrus.Fields{
    "user_id": 10010,
    "ip":      "192.168.32.15",
  })

  requestLogger.Info("info msg")
  requestLogger.Error("error msg")
}
```

实际上,WithFields返回一个logrus.Entry类型的值,它将logrus.Logger和设置的logrus.Fields保存下来.调用Entry相关方法输出日志时,保存下来的logrus.Fields也会随之输出。


### 重定向输出

默认情况下,日志输出到io.Stderr.可以调用logrus.SetOutput传入一个io.Writer参数.后续调用相关方法日志将写到io.Writer中.现在,我们就能像上篇文章介绍log时一样,可以搞点事情了.传入一个io.MultiWriter,同时将日志写到bytes.Buffer、标准输出和文件中：

```go
package main

import (
  "bytes"
  "io"
  "log"
  "os"

  "github.com/sirupsen/logrus"
)

func main() {
  writer1 := &bytes.Buffer{}
  writer2 := os.Stdout
  writer3, err := os.OpenFile("log.txt", os.O_WRONLY|os.O_CREATE, 0755)
  if err != nil {
    log.Fatalf("create file log.txt failed: %v", err)
  }

  logrus.SetOutput(io.MultiWriter(writer1, writer2, writer3))
  logrus.Info("info msg")
}
```

### 日志格式

logrus支持两种日志格式,文本和JSON,默认为文本格式.可以通过logrus.SetFormatter设置日志格式:
- TextFormatter
- JSONFormatter

```go
package main

import (
  "github.com/sirupsen/logrus"
)

func main() {
  logrus.SetLevel(logrus.TraceLevel)
  logrus.SetFormatter(&logrus.JSONFormatter{})

  logrus.Trace("trace msg")
  logrus.Debug("debug msg")
  logrus.Info("info msg")
  logrus.Warn("warn msg")
  logrus.Error("error msg")
  logrus.Fatal("fatal msg")
  logrus.Panic("panic msg")
}
```
输出
```bash
$ go run main.go 
{"level":"trace","msg":"trace msg","time":"2020-02-07T21:40:04+08:00"}
{"level":"debug","msg":"debug msg","time":"2020-02-07T21:40:04+08:00"}
{"level":"info","msg":"info msg","time":"2020-02-07T21:40:04+08:00"}
{"level":"info","msg":"warn msg","time":"2020-02-07T21:40:04+08:00"}
{"level":"error","msg":"error msg","time":"2020-02-07T21:40:04+08:00"}
{"level":"fatal","msg":"fatal msg","time":"2020-02-07T21:40:04+08:00"}
exit status 1
```


### 第三方日志格式

除了内置的TextFormatter和JSONFormatter，还有不少第三方格式支持。我们这里介绍一个nested-logrus-formatter。

安装
```bash
go get github.com/antonfisher/nested-logrus-formatter
```

```go
package main

import (
  nested "github.com/antonfisher/nested-logrus-formatter"
  "github.com/sirupsen/logrus"
)

func main() {
  logrus.SetFormatter(&nested.Formatter{
    HideKeys:    true,
    FieldsOrder: []string{"component", "category"},
  })

  logrus.Info("info msg")
}
```

输出：


```bash
Feb  8 15:22:59.077 [INFO] info msg
```

nested格式提供了多个字段用来定制行为：

```go
// github.com/antonfisher/nested-logrus-formatter/formatter.go
type Formatter struct {
  FieldsOrder     []string
  TimestampFormat string  
  HideKeys        bool    
  NoColors        bool    
  NoFieldsColors  bool    
  ShowFullLevel   bool    
  TrimMessages    bool    
}
```

### 日志输出到邮件
email这里只需用NewMailAuthHook方法得到hook,再添加即可

```go
func Email(){
    logger:= logrus.New()
    //parameter"APPLICATION_NAME", "HOST", PORT, "FROM", "TO"
    //首先开启smtp服务,最后两个参数是smtp的用户名和密码
    hook, err := logrus_mail.NewMailAuthHook("testapp", "smtp.163.com",25,"username@163.com","username@163.com","smtp_name","smtp_password")
    if err == nil {
        logger.Hooks.Add(hook)
    }
    //生成*Entry
    var filename="123.txt"
    contextLogger :=logger.WithFields(logrus.Fields{
        "file":filename,
        "content":  "GG",
    })
    //设置时间戳和message
    contextLogger.Time=time.Now()
    contextLogger.Message="这是一个hook发来的邮件"
    //只能发送Error,Fatal,Panic级别的log
    contextLogger.Level=logrus.FatalLevel

    //使用Fire发送,包含时间戳,message
    hook.Fire(contextLogger)
}
```


### Logrus-Hook-Slack
安装slackrus github.com/johntdyer/slackrus

```go
package main

import (
  logrus "github.com/sirupsen/logrus"
  "github.com/johntdyer/slackrus"
  "os"
)

func main() {

  logrus.SetFormatter(&logrus.JSONFormatter{})

  logrus.SetOutput(os.Stderr)

  logrus.SetLevel(logrus.DebugLevel)
  
  logrus.AddHook(&slackrus.SlackrusHook{
    HookURL:        "https://hooks.slack.com/services/abc123/defghijklmnopqrstuvwxyz",
    AcceptedLevels: slackrus.LevelThreshold(logrus.DebugLevel),
    Channel:        "#slack-testing",
    IconEmoji:      ":ghost:",
    Username:       "foobot",
  })

  logrus.Warn("warn")
  logrus.Info("info")
  logrus.Debug("debug")
}

```

## 参考

- [Go 每日一库之 logrus](https://zhuanlan.zhihu.com/p/105759117)
- [logrus Hooks](https://github.com/sirupsen/logrus/wiki/Hooks)