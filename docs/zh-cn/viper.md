> 本指南介绍了如何在 Tornado 中使用 pyecharts。

## Quickstart

**install**
```
go get github.com/spf13/viper
```

## 读取配置, 失败就用默认配置

```go
package main  
  
import (  
    "fmt"  
    "log"  
  
    "github.com/spf13/viper"  
)  
  
func main() {  
    // 设置配置文件名称和类型  
    viper.SetConfigName("config")  
    viper.SetConfigType("yaml")  
  
    // 添加配置文件搜索路径  
    viper.AddConfigPath(".")  
  
    // 尝试读取配置文件  
    if err := viper.ReadInConfig(); err != nil {  
        if _, ok := err.(viper.ConfigFileNotFoundError); ok {  
            // 配置文件未找到，使用默认值  
            fmt.Println("Config file not found; using defaults")  
        } else {  
            // 配置文件存在，但读取发生其他错误  
            log.Fatalf("Fatal error in config file: %s \n", err)  
        }  
    }  
  
    // 设置默认值，如果配置文件中没有相应的键，将使用这些默认值  
    viper.SetDefault("username", "default_user")  
    viper.SetDefault("password", "default_pass")  
  
    // 读取配置值  
    username := viper.GetString("username")  
    password := viper.GetString("password")  
  
    // 输出配置值  
    fmt.Printf("Username: %s\n", username)  
    fmt.Printf("Password: %s\n", password)  
}
```

## 按模块读写配置
例如，你的YAML配置文件可能看起来像这样：

```yaml
module1:  
  setting1: value1  
  setting2: value2  
  
module2:  
  settingA: valueA  
  settingB: valueB
```
然后，你可以使用`viper.Get("module1")`或`viper.GetString("module1.setting1")`来获取特定模块的配置。
通过 `viper.SetDefault("module1.setting1", false)`来写默认值

```go
package main  
  
import (  
    "fmt"  
    "log"  
  
    "github.com/spf13/viper"  
)  
  
func main() {  
    viper.SetConfigName("config")  
    viper.SetConfigType("yaml")  
    viper.AddConfigPath(".")  
  
    if err := viper.ReadInConfig(); err != nil {  
        if _, ok := err.(viper.ConfigFileNotFoundError); ok {  
            log.Println("配置文件未找到，使用默认值")  
        } else {  
            log.Fatalf("读取配置文件时发生错误: %s", err)  
        }  
    }  
  
    // 获取module1的所有设置  
    module1Settings := viper.Get("module1")  
    if module1Settings != nil {  
        fmt.Printf("Module 1 Settings: %+v\n", module1Settings)  
    }  
  
    // 获取module1的特定设置  
    setting1 := viper.GetString("module1.setting1")  
    fmt.Printf("Module 1 Setting 1: %s\n", setting1)  
  
    // 获取module2的特定设置  
    settingA := viper.GetString("module2.settingA")  
    fmt.Printf("Module 2 Setting A: %s\n", settingA)  
}
```

## 配置转成JSON字符串

```go
// 假设你的配置文件中有一个叫做"database"的键  
databaseConfig := viper.Get("database")  
  
// 将databaseConfig转换为JSON  
jsonDatabaseConfig, err := json.Marshal(databaseConfig)  
if err != nil {  
    log.Fatalf("无法将数据库配置转换为JSON: %s", err)  
}  
  
// 输出JSON格式的数据库配置  
fmt.Println(string(jsonDatabaseConfig))
```

## 读取所有配置

```go
// 将Viper中的配置映射到一个map中  
allSettings := viper.AllSettings()  

// 将map转换为JSON字符串  
jsonSettings, err := json.Marshal(allSettings)  
if err != nil {  
    log.Fatalf("无法将配置转换为JSON: %s", err)  
}  

// 输出JSON格式的配置  
fmt.Println(string(jsonSettings))  
```