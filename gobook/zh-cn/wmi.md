## Quickstart
[wmi](https://github.com/yusufpapurcu/wmi) provides a WQL interface to Windows WMI.


## Usage

**查询services**


```go

type ServiceInfo struct {
    Caption   string // 描述信息
    Name      string // 服务名称
    PathName  string // 服务程序路径
    Started   bool   // 是否已启动
    StartMode string // 启动模式
    StartName string // 启动用户
}

func GetServiceInfo() ( []ServiceInfo, error ){
    var infos []ServiceInfo
    var result []ServiceInfo
    err := wmi.Query("SELECT * FROM Win32_Service", &infos)
    if err != nil {
        return result
    }
    for _, v := range infos {
        if v.Started {
            result = append(result, v)
        }
    }
    return result, err
}

```
**查询进程**
```go
package main  
  
import (  
    "fmt"  
    "github.com/yusufpapurcu/wmi"  
)  
  
type process struct {
    Name            string
    CommandLine     *string
    ProcessId       uint32
    ParentProcessId uint32
    CreationDate    *string
}

func GetProcessList() (resultData []map[string]string) {
    var dst []process
    err := wmi.Query("SELECT * FROM Win32_Process", &dst)
    if err != nil {
        log.Println("Windows get process info wmi Query error:",err)
        return
    }
    if len(dst) != 0 {
        for _, v := range dst {
            m := make(map[string]string)
            m["name"] = v.Name
            m["pid"] = fmt.Sprintf("%d", v.ProcessId)
            m["ppid"] = fmt.Sprintf("%d", v.ParentProcessId)
            m["command"] = *v.CommandLine
            m["starttime"] = parseTime(*v.CreationDate)
            log.Println("Process data:", m)
            resultData = append(resultData, m)
        }
    }
    return resultData
}

```

## References


[process_windows.go](https://github.com/ysrc/yulong-hids-archived/blob/master/agent/collect/process_windows.go)