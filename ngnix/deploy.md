1. copy gobook.zbstream.com to /etc/nginx/sites-available
```
cp gobook.zbstream.com /etc/nginx/sites-available
```
6. 创建link:

```
cd /etc/nginx/sites-enabled
ln -s ../sites-available/gobook.zbstream.com gobook.zbstream.com

```
7. 重启nginx

```
service nginx restart
```



