> 了解如何给Wails的浏览器添加代理

## Quickstart

```go
wails3 init -n myfirstapp -t vue
```

- build: Contains files used by the build process.
- frontend: Contains your web frontend code.
- go.mod & go.sum: Go module files.
- main.go: The entry point for your Wails application.
- Taskfile.yml: Defines all the tasks used by the build system. Learn more at the Task website.

To build your application, execute:
```go
wails3 build
```
To dev
```go
wails3 dev
```


## 窗口设置

```
window := app.NewWebviewWindowWithOptions(application.WebviewWindowOptions{
    Width:         500,
    Height:        800,
    Frameless:     false,
    AlwaysOnTop:   false,
    Hidden:        false,
    DisableResize: false,
    ShouldClose: func(window *application.WebviewWindow) bool {
      println("close")
      window.Hide()
      return false
    },
    Windows: application.WindowsWindow{
      HiddenOnTaskbar: true,
    },
  })

```
## 设置代理

- [设置代理](https://wails.io/docs/guides/troubleshooting/#im-having-getting-proxy-errors-when-trying-to-install-wails)


## References
- [application options](https://v3alpha.wails.io/API/application/#options)
- [awesome-wails](https://github.com/wailsapp/awesome-wails)
- [wails v3 start](https://v3alpha.wails.io/getting-started/your-first-app/)