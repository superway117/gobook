>

## Quickstart

使用 Go 实现的完整 Trojan 代理，兼容原版 Trojan 协议及配置文件格式。安全、高效、轻巧、易用。

[Trojan-Go](https://github.com/p4gefau1t/trojan-go)支持多路复用提升并发性能；使用路由模块实现国内外分流；支持 CDN 流量中转(基于 WebSocket over TLS)；支持使用 AEAD 对 Trojan 流量进行二次加密(基于 Shadowsocks AEAD)；支持可插拔的传输层插件，允许替换 TLS，使用其他加密隧道传输 Trojan 协议流量。

## 原理

[原理](https://p4gefau1t.github.io/trojan-go/basic/trojan/)


