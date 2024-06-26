> 了解如何通过notifier给飞书群发消息

## Quickstart

**Install**
```
go get -u github.com/moond4rk/notifier
```
## Usage


```go
package main

import (
    "os"

    "github.com/moond4rk/notifier"
)

func main() {
    var (
        dingtalkToken     = os.Getenv("dingtalk_token")
        dingtalkSecret    = os.Getenv("dingtalk_secret")
        barkKey           = os.Getenv("bark_key")
        barkServer        = notifier.DefaultBarkServer
        feishuToken       = os.Getenv("feishu_token")
        feishuSecret      = os.Getenv("feishu_secret")
        larkToken         = os.Getenv("lark_token")
        larkSecret        = os.Getenv("lark_secret")
        serverChanUserID  = "" // server chan's userID could be empty
        serverChanSendKey = os.Getenv("server_chan_send_key")
    )
    notifier := notifier.New(
        notifier.WithDingTalk(dingtalkToken, dingtalkSecret),
        notifier.WithBark(barkKey, barkServer),
        notifier.WithFeishu(feishuToken, feishuSecret),
        notifier.WithLark(larkToken, larkSecret),
        notifier.WithServerChan(serverChanUserID, serverChanSendKey),
    )

    var (
        subject = "this is subject"
        content = "this is content"
    )
    if err := notifier.Send(subject, content); err != nil {
        panic(err)
    }
}
```