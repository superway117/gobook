## Bazar介绍

Bazar是什么，影响力，xxx


## 验证PCAP

[2021-11-05-TA551-BazarLoader-with-BackConnect-and-Cobalt-Strike-and-Dark-Cat-VNC](./static/bazar/pcap/2021-11-05-TA551-BazarLoader-with-BackConnect-and-Cobalt-Strike-and-Dark-Cat-VNC.pcap)

[原始下载地址](http://xxxx.com)


## 验证规则

[emerging-malware.rules](./static/bazar/rules/emerging-malware.rules)

[原始下载地址](http://xxxx.com)

```
alert tcp $HOME_NET any -> $EXTERNAL_NET 25 (msg:"ET MALWARE SC-KeyLog Keylogger Installed - Sending Log Email Report"; flow:established,to_server; content:"SC-KeyLog log report"; nocase; content:"See attached file"; nocase; content:".log"; nocase; reference:url,www.soft-central.net/keylog.php; classtype:trojan-activity; sid:2008348; rev:2; metadata:created_at 2010_07_30, updated_at 2019_07_26;)
```

## 验证截图

打入针对性的pcap
```
suricata 命令
```
结果截图

打入测试白流量，然后截图，表示没有命中


## 参考

- [](https://.xxxx)