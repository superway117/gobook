## get logic driver on windows

```
package main

import (
   "fmt"
   "syscall"
   "unsafe"
)

var (
   kernel32                = syscall.NewLazyDLL("kernel32.dll")
   getLogicalDriveStringsW = kernel32.NewProc("GetLogicalDriveStringsW")
)

func getLogicalDrives() ([]string, error) {
   buf := make([]uint16, 254) // Buffer to store drive letters
   getLogicalDriveStringsW.Call(uintptr(len(buf)), uintptr(unsafe.Pointer(&buf[0])))

   drives := make([]string, 0)
   drive := ""
   for _, v := range buf {
      if v == 0 {
         if drive != "" {
            drives = append(drives, drive)
            drive = "" // Reset the drive string for the next drive letter
         }
      } else {
         drive += string(v)
      }
   }

   return drives, nil
}

func main() {
   drives, err := getLogicalDrives()
   if err != nil {
      return
   }
 
   for _, drive := range drives {
      fmt.Println(drive)
   }
}
```
```
go run test.go
C:\
```

`getLogicalDriveStringsW.Call(uintptr(len(buf)), uintptr(unsafe.Pointer(&buf[0])))`
传递给`getLogicalDriveStringsW`的参数为什么都要转成`unitptr`?

在上面的代码中，getLogicalDriveStringsW.Call函数接受的参数是uintptr类型，因此我们需要将len(buf)和&buf[0]转换为uintptr类型。这是为了与底层的Windows API函数调用兼容。

在Go中，uintptr是一个无符号整数类型，用于存储指针或者指针运算的结果。在这种情况下，我们需要将参数转换为uintptr类型以适应syscall包的调用方式。

`GetLogicalDriveStringsW`的函數原型
```
DWORD GetLogicalDriveStringsW(
  [in]  DWORD  nBufferLength,
  [out] LPWSTR lpBuffer
);
```

## References 
- [man getlogicaldrivestringsw](https://learn.microsoft.com/en-us/windows/win32/api/fileapi/nf-fileapi-getlogicaldrivestringsw)