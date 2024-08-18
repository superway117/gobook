## Quickstart
Microsoft Windows File Properties/Version Info and Icon Resource Generator for the Go Language

Package creates a syso file which contains Microsoft Windows Version Information and an optional icon. When you run "go build", Go will embed the version information and an optional icon and an optional manifest in the executable. Go will automatically use the syso file if it's in the same directory as the main() function.

在 Go 中，你可以使用 github.com/josephspurrier/goversioninfo 这个库来嵌入资源文件到 Windows 可执行文件中。这个库可以帮助你将图标、版本信息以及其他资源文件嵌入到你的 Windows 可执行文件中。

## References


[github goversioninfo](https://github.com/josephspurrier/goversioninfo)