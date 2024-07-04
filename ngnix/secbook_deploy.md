1. copy secbook.zbstream.com to /etc/nginx/sites-available
```
cp secbook.zbstream.com /etc/nginx/sites-available
```
6. 创建link:

```
cd /etc/nginx/sites-enabled
ln -s ../sites-available/secbook.zbstream.com secbook.zbstream.com

```
7. 重启nginx

```
service nginx restart
```
```
nginx -t
nginx -s reload
```


