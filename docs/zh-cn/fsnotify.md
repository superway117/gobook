> 了解字符串类型的数据结构

> 了解如何通过`reflect`进行指针类型转换

> 了解如何通过`reflect`把指针类型转换uint



## 介绍

[fsnotify](https://github.com/fsnotify/fsnotify) is a Go library to provide cross-platform filesystem notifications on Windows, Linux, macOS, BSD, and illumos.

Go 1.17 or newer is required; the full documentation is at https://pkg.go.dev/github.com/fsnotify/fsnotify


## Usage

```go
package main

import (
    "log"

    "github.com/fsnotify/fsnotify"
)

func main() {
    // Create new watcher.
    watcher, err := fsnotify.NewWatcher()
    if err != nil {
        log.Fatal(err)
    }
    defer watcher.Close()

    // Start listening for events.
    go func() {
        for {
            select {
            case event, ok := <-watcher.Events:
                if !ok {
                    return
                }
                log.Println("event:", event)
                if event.Has(fsnotify.Write) {
                    log.Println("modified file:", event.Name)
                }
            case err, ok := <-watcher.Errors:
                if !ok {
                    return
                }
                log.Println("error:", err)
            }
        }
    }()

    // Add a path.
    err = watcher.Add("/tmp")
    if err != nil {
        log.Fatal(err)
    }

    // Block main goroutine forever.
    <-make(chan struct{})
}
```