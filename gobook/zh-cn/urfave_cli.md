> 了解urfave/cli的使用

## 介绍

[urfave/cli](https://github.com/urfave/cli) is a declarative, simple, fast, and fun package for building command line tools in Go featuring:

- commands and subcommands with alias and prefix match support
- flexible and permissive help system
- dynamic shell completion for bash, zsh, fish, and powershell
- man and markdown format documentation generation
- input flags for simple types, slices of simple types, time, duration, and others
- compound short flag support (-a -b -c ➡️ -abc)
- input lookup from:
  - environment variables
  - plain text files
  - structured file formats supported via the urfave/cli-altsrc package


[V2](https://cli.urfave.org/v2/getting-started/)版本的文档


在命令行工具中可以参考linux中命令行帮助理解，命令行格式：command [flags] [argument1] [argument2]，命令，选项，参数直接用空格隔开，flags直接以"-"连起来。

cli 差不多是基于 flag 来开发的哈，我们需要了解一下flag包的的使用，这里简要说明一下flag接受语法

 - -isbool (一个 - 符号，布尔类型该写法等同于 -isbool=true)
 - -age=x  (一个 - 符号，使用等号)
 - -age x  (一个 - 符号，使用空格)
 - --age=x (两个 - 符号，使用等号)
 - --age x (两个 - 符号，使用空格)

## Usage

### 简单示例
```go
package main

import (
    "fmt"
    "log"
    "os"
    "github.com/urfave/cli/v2"  //引入包
)

func main() {
    app := &cli.App{    //实例化app对象
        Action: func(cCtx *cli.Context) error {
            fmt.Printf("Hello %q", cCtx.Args().Get(0))   
            //cCtx.Args()，可以获取运行命令后的参数列表，是一个切片，cCtx.Args().Get(0)是获取
            //第一个位置的参数，第二个第三个以此类推
            return nil
        },
    }

    if err := app.Run(os.Args); err != nil {
        log.Fatal(err)
    }
}
```

```bash
go run main.go test
Hello test
```

### Flags用法

```
package main

import (
    "fmt"
    "log"
    "os"

    "github.com/urfave/cli/v2"
)

func main() {
    var language string

    app := &cli.App{
        Flags: []cli.Flag{
            &cli.StringFlag{
                Name:        "lang",
                Value:       "english",
                Usage:       "language for the greeting",
                Destination: &language,  //此处的变量只能在函数内被取到值
            },
        },
        Action: func(cCtx *cli.Context) error {
            name := "someone"
            if cCtx.NArg() > 0 {  //统计参数的个数
                name = cCtx.Args().Get(0)
            }
            if language == "spanish" {  //判定选项值，如果为spanish则走Hola分支
                fmt.Println("Hola", name)
            } else {
                fmt.Println("Hello", name)
            }
            return nil
        },
    }

    if err := app.Run(os.Args); err != nil {
        log.Fatal(err)
    }
}
```

解读代码：
通过flags设立选项，name表示选项名称，valus表示默认值，usage表示用法，
destination表示将扫描的结果绑定到language上，通过命令行可以观察。
```
PS E:\hsops\go_study\greet> go run greet.go -h
NAME:                                                                 
   greet.exe - A new cli application                                  
                                                                      
USAGE:                                                                
   greet.exe [global options] command [command options] [arguments...]
                                                                      
COMMANDS:                                                             
   help, h  Shows a list of commands or help for one command          

GLOBAL OPTIONS://表示选项
   --lang value  language for the greeting (default: "english")
   --help, -h    show help
```

```
PS E:\hsops\go_study\greet> go run .\greet.go --lang=english test //次数--lang表示选项，zhangpl为参数，注意参数跟选项不能混淆
运行结果：Hello test
```

### Commands用法
如果是使用多个命令，则可以使用Commands
```go
package main

import (
   "fmt"
   "log"
   "os"
   "sort"

   "github.com/urfave/cli/v2"
)

func main() {
   app := &cli.App{
      Commands: []*cli.Command{
         {
            Name:    "sex",
            Aliases: []string{"s"},
            Usage:   "你可以通过我来获取性别",
            Action: func(c *cli.Context) error {
               fmt.Println("难人")
               return nil
            },
         },
         {
            Name:    "age",
            Aliases: []string{"a"},
            Usage:   "你可以通过我来获取年龄",
            Action: func(c *cli.Context) error {
               fmt.Println("100岁了")
               return nil
            },
         },
      },
   }

   sort.Sort(cli.CommandsByName(app.Commands)) // 通过命令函数来排序，在help中进行展示

   err := app.Run(os.Args)
   if err != nil {
      log.Fatal(err)
   }
}
```
代码解析：
```
PS E:\hsops\go_study\greet> go run .\greet.go -h
NAME:
   greet.exe - A new cli application

USAGE:
   greet.exe [global options] command [command options] [arguments...]

COMMANDS:
   age, a   你可以通过我来获取年龄
   sex, s   你可以通过我来获取性别
   help, h  Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --help, -h  show help
```
通过执行不同的命令获取不同的结果

```
PS E:\hsops\go_study\greet> go run .\greet.go age
100岁了
```

## 参考

[关于urfave/cli的使用](https://juejin.cn/post/7195725894870384698)