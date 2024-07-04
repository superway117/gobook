> 了解yapscan的编译、使用

> yapscan源码分析


## 介绍

[Yapscan](https://github.com/fkie-cad/yapscan) is a YAra based Process SCANner, aimed at giving more control about what to scan and giving detailed reports on matches.

The report format is now versioned and a stable version 1.1.0 is released with compatibility guarantees, see the [report format documentation](https://github.com/fkie-cad/yapscan/blob/master/report/v1.1.0/README.md).



## 源码分析
---
### 上报数据相关代码
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


** 客户端上报**
> yapscan\archiver\remoteClient.go

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

**上报数据**
```go

func (a *RemoteArchiver) create(reportName string) error {
  resp, err := a.postJson("/report", map[string]interface{}{
    "name": reportName,
  })
  if err != nil {
    return err
  }
  data, err := a.parseResponse(resp)
  reportID, ok := data["reportID"]
  if !ok {
    return fmt.Errorf("invalid response body")
  }
  reportIDStr, ok := reportID.(string)
  if !ok {
    return fmt.Errorf("invalid response body")
  }

  a.reportID = reportIDStr
  return nil
}


func (f *remoteFile) Write(d []byte) (int, error) {
  resp, err := f.archiver.patch(fmt.Sprintf("/report/%s/%s", f.archiver.reportID, f.filepath), d)
  if err != nil {
    return 0, err
  }
  _, err = f.archiver.parseResponse(resp)
  if err != nil {
    return 0, err
  }
  return len(d), nil
}

func (a *RemoteArchiver) closeResource(resource string) error {
  url := fmt.Sprintf("/report/%s", a.reportID)
  if resource != "" {
    url += "/" + resource
  }

  resp, err := a.put(url)
  if err != nil {
    return err
  }
  _, err = a.parseResponse(resp)
  return err
}
```


### 服务器代码
> yapscan\app\receive.go

> yapscan\archiver\remoteServer.go

**router相关代码**
```go
func NewArchiverServer(addr, outdir, outerExt string, builder WriteCloserBuilder) *ArchiverServer {
  router := gin.Default()
  router.SetTrustedProxies([]string{})
  router.Use()

  s := &ArchiverServer{
    router:      router,
    outdir:      outdir,
    outerExt:    outerExt,
    wcBuilder:   builder,
    reportsMux:  &sync.RWMutex{},
    openReports: make(map[string]*reportHandler),
  }

  v1 := router.Group("/v1")

  v1.POST("/report", s.createReport)
  v1.PUT("/report/:report", s.closeReport)
  v1.POST("/report/:report/*filepath", s.createFile)
  v1.PATCH("/report/:report/*filepath", s.writeFile)
  v1.PUT("/report/:report/*filepath", s.closeFile)

  s.server = &http.Server{
    Addr:    addr,
    Handler: router,
  }

  return s
}
```

### 上报统计信息

> yapscan\output\analysisReporter.go

```go
func (r *AnalysisReporter) ReportScanningStatistics(stats *yapscan.ScanningStatistics) error {
  w, err := r.archiver.Create(r.filenamePrefix + report.ScanningStatisticsFileName)
  if err != nil {
    return err
  }

  err = json.NewEncoder(w).Encode(stats)
  if err != nil {
    return errors.NewMultiError(err, w.Close())
  }
  return w.Close()
}
```

### 上报单个文件扫描结果

> yapscan\output\progressReporter.go

```go
func (r *progressReporter) receiveFS(progress *fileio.FSScanProgress) {
  if progress.Matches != nil && len(progress.Matches) > 0 {
    r.allClean = false
  }

  matchOut := r.formatter.FormatFSScanProgress(progress)
  if matchOut != "" {
    fmt.Fprintln(r.out, "\r", matchOut)
  }

  if progress.Error == nil {
    format := "Scanning \"%s\""
    fmt.Fprintf(r.out, "\r%-128s", fmt.Sprintf(format, r.formatter.FormatPath(progress.File.Path(), 117)))

    logrus.WithFields(logrus.Fields{
      "file": progress.File.Path(),
    }).Info("Scan of file complete.")
  } else if progress.Error != yapscan.ErrSkipped {
    logrus.WithFields(logrus.Fields{
      "file":          progress.File.Path(),
      logrus.ErrorKey: progress.Error,
    }).Error("Scan of file failed.")
  }

  if (progress.Error != nil && progress.Error != yapscan.ErrSkipped) || (progress.Matches != nil && len(progress.Matches) > 0) {
    fmt.Sprintln(r.out)
    fmt.Sprintln(r.out, r.formatter.FormatFSScanProgress(progress))
    logrus.WithFields(logrus.Fields{
      "file": progress.File.Path(),
    }).Warn(r.formatter.FormatFSScanProgress(progress))
    
  }
}
```