1. copy go.zbstream.com to /etc/nginx/sites-available
```
cp go.zbstream.com /etc/nginx/sites-available
```
6. 创建link:

```
cd /etc/nginx/sites-enabled
ln -s ../sites-available/go.zbstream.com go.zbstream.com

```
7. 重启nginx

```
service nginx restart
```
```
nginx -t
nginx -s reload
```


