> 了解通过gopsutil获取系统利用率(CPU,内存,磁盘,网络等)信息

## Quickstart

[gopsutil](https://github.com/shirou/gopsutil)是一个跨平台的 Go 语言库，用于获取系统利用率（CPU，内存，磁盘，网络等）信息。这个库封装了多种操作系统的底层调用，使得 Go 程序可以轻松地获取这些系统信息。

**支持的平台**
- FreeBSD i386/amd64/arm
- Linux i386/amd64/arm(raspberry pi)
- Windows i386/amd64/arm/arm64
- Darwin amd64/arm64
- OpenBSD i386/amd64/armv7/arm64/riscv64 (Thank you @mpfz0r!)
- Solaris amd64 (developed and tested on SmartOS/Illumos, Thank you @jen20!)


**安装**

```bash
go get github.com/shirou/gopsutil/v3
```

## Usage

### 获取 CPU 信息

```go
package main  
  
import (  
 "fmt"  
 "github.com/shirou/gopsutil/v3/cpu"  
)  
  
func main() {  
  info, err := cpu.Info()  
  if err != nil {  
    fmt.Println(err)  
    return  
  }  
  for _, i := range info {  
    fmt.Printf("CPU info: %+v\n", i)  
  }  
}
```

### 获取内存信息

```go
package main  
  
import (  
 "fmt"  
 "github.com/shirou/gopsutil/v3/mem"  
)  
  
func main() {  
  v, err := mem.VirtualMemory()  
  if err != nil {  
    fmt.Println(err)  
    return  
  }  
  fmt.Printf("Total: %v, Available: %v, UsedPercent: %.2f%%\n", v.Total, v.Available, v.UsedPercent)  
}

```

### 获取网络信息
```go
package main  
  
import (  
 "fmt"  
 "github.com/shirou/gopsutil/v3/net"  
)  
  
func main() {  
 ioCounters, err := net.IOCounters(true)  
 if err != nil {  
  fmt.Println(err)  
  return  
 }  
 for _, v := range ioCounters {  
 fmt.Printf("Interface: %s, BytesSent: %v, BytesRecv: %v\n", v.Name, v.BytesSent, v.BytesRecv)  
 }  
}
```

### 获取磁盘信息
```go
package main  
  
import (  
 "fmt"  
 "github.com/shirou/gopsutil/v3/disk"  
)  
  
func main() {  
  parts, err := disk.Partitions(true)  
  if err != nil {  
    fmt.Println(err)  
    return  
  }  
  for _, part := range parts {  
    fmt.Printf("Partition: %+v\n", part)  
    usage, err := disk.Usage(part.Mountpoint)  
    if err != nil {  
      fmt.Println(err)  
      continue  
    }  
    fmt.Printf("Usage: %+v\n", usage)  
  }  
}
```


### 获取磁盘信息
```go
package main  
  
import (  
  "fmt"  
  "github.com/shirou/gopsutil/v3/host"  
)  
  
func main() {  
  info, err := host.Info()  
  if err != nil {  
    fmt.Println("Error getting host info:", err)  
    return  
  }  
  
  // 打印主机信息  
  fmt.Printf("Hostname: %s\n", info.Hostname)  
  fmt.Printf("Uptime: %d seconds\n", info.Uptime)  
  fmt.Printf("OS: %s\n", info.OS)  
  fmt.Printf("Platform: %s\n", info.Platform)  
  fmt.Printf("Platform Family: %s\n", info.PlatformFamily)  
  fmt.Printf("Platform Version: %s\n", info.PlatformVersion)  
  fmt.Printf("Kernel Version: %s\n", info.KernelVersion)  
}
```

## 完整的代码示例

```go
package main

import (
  "fmt"
  "log"
  "time"
  "encoding/json"
  "github.com/shirou/gopsutil/v3/cpu"
  "github.com/shirou/gopsutil/v3/disk"
  psutilshost "github.com/shirou/gopsutil/v3/host"
  "github.com/shirou/gopsutil/v3/mem"
)
 
 
 
type HostInfo struct {
  CpuUsage  float64         `json:"cpuusage"`
  CPU       cpu.InfoStat         `json:"cpu"`
  Memory    mem.VirtualMemoryStat `json:"memory"`
  Disk      disk.UsageStat        `json:"disk"`
  Hostinfo  psutilshost.InfoStat  `json:"host"`
}
 

func (self HostInfo) String() string {
  jsonBytes, err := json.Marshal(self)
  if err != nil {
    log.Fatal(err)
  }
  return string(jsonBytes)
}

func (self HostInfo) Query() (string, error) {
  
  cpuInfo, err := cpu.Info()
  if err != nil {
    log.Fatal(err)
    return "",err
  }
  self.CPU = cpuInfo[0]
  percent, err:= cpu.Percent(time.Second * 5, false)
  if err != nil {
    log.Fatal(err)
    return "",err
  }
  self.CpuUsage = percent[0]
  memInfo, err := mem.VirtualMemory()
  if err != nil {
    log.Fatal(err)
    return "",err
  }
  self.Memory = *memInfo

  diskInfo, err := disk.Usage("/")
  if err != nil {
    log.Fatal(err)
    return "",err
  }
  self.Disk = *diskInfo

  hostinfo, err := psutilshost.Info()
  if err != nil {
    log.Fatal(err)
    return "",err
  }
  self.Hostinfo = *hostinfo
  jsonBytes, err := json.Marshal(self)
  if err != nil {
    log.Fatal(err)
  }
  return string(jsonBytes),nil
}
 
func main() {
  var hi HostInfo
  jsonstr,err:= hi.Query()
  if err != nil {
    log.Fatal(err)
    return
  }
  fmt.Println(jsonstr)
}


```