## exec.Command的窗口隐藏

在 Go 语言中,你可以使用`syscall`包来实现隐藏控制台窗口.

你可以使用`CreateProcess` 函数的`CreationFlags` 参数来指定创建进程时的一些标志,其中包括`CREATE_NO_WINDOW` 标志,可以隐藏控制台窗口.

```
package main

import (
    "syscall"
    "os"
    "os/exec"
)
func main() {
    cmd := exec.Command("cmd", "/C", "echo Hello, hidden window!")
    cmd.SysProcAttr = &syscall.SysProcAttr{HideWindow: true}

    cmd.Stdout = os.Stdout
    cmd.Stderr = os.Stderr

    if err := cmd.Run(); err != nil {
        panic(err)
    }
}
```

## 控制台程序如何隐藏自己

控制台程序无法隐藏自己，只能通过编译成gui程序来隐藏窗口
```
go build -ldflags "-s -w"  -gcflags="-N -l"  -ldflags -H=windowsgui xxx.go
```