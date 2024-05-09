## 如何安装

**安装**

参考`Go`[官方网站](https://go.dev/doc/install)

**查看版本**

`console`执行`go version`,如返回如下版本号,即表示安装成功.
```shell
$ go version
go version go1.22.0 windows/amd64
```

## 设置代理

如果后续下载依赖关系的时候,碰到无法连接的情况,可以尝试设置如下环境变量

七牛 CDN
```
GOPROXY = https://goproxy.cn,direct
```

阿里云
```
GOPROXY = https://mirrors.aliyun.com/goproxy/,direct

```
官方
```
GOPROXY = https://goproxy.io,direct
```



在Windows中,执行如下步骤
1. 输入 `env`打开环境变量编辑页面
2. 点击 `新建`
3. 输入 变量名`GOPROXY`,变量值`https://goproxy.cn,direct`

参考页面

[Go 国内加速：Go 国内加速镜像](https://learnku.com/go/wikis/38122)