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