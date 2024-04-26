> 了解zstd的编译、使用

## 介绍

[zstd](https://github.com/facebook/zstd) Zstandard, or zstd as short version, is a fast lossless compression algorithm, targeting real-time compression scenarios at zlib-level and better compression ratios. It's backed by a very fast entropy stage, provided by Huff0 and FSE library.

Zstandard's format is stable and documented in RFC8878. Multiple independent implementations are already available. This repository represents the reference implementation, provided as an open-source dual BSD OR GPLv2 licensed C library, and a command line utility producing and decoding .zst, .gz, .xz and .lz4 files. Should your project require another programming language, a list of known ports and bindings is provided on Zstandard homepage.



## 源码分析

### 上报
下面的命令设置上报地址
```
yapscan.exe scan -r rules -rr    --report-server http://127.0.0.1:8000  --full-report true c:\workshop\sample\whiterabbit\
```

服务器执行执行监听
```go
yapscan.exe  receive  --verbose :8000
```

上报的地址
```go
 POST     "/v1/report/7701d2a52fe66ebf5da1c66ca96530aa1785961a79e3de5c0de2d835a106ce46/dev_internal/meta.json"
```

```go
func NewRemoteArchiver(server string) (*RemoteArchiver, error) {
  client := &http.Client{}

  server = strings.TrimRight(server, "/")

  archiver := &RemoteArchiver{
    url:    fmt.Sprintf("%s/v1", server),
    client: client,
  }

  return archiver, nil
}
```
