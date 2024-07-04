proxy_cache_path /etc/nginx/secbook_cache levels=1:2 keys_zone=secbook_cache:100m inactive=1d max_size=200m;

server {
    listen 80;

    server_name go.zbstream.com;
    root /root/workshop/gobook/secbook/;

    index index.html;

    location ~ .*\.(gif|jpg|jpeg|png|bmp|swf|css)$ {
    	log_not_found off;
      expires max;
      access_log off;
      add_header Cache-Control max-age=86400;
	    proxy_cache secbook_cache;   
    }

    location ~ .*\.(html|htm)$ {
      log_not_found off;
      expires 1m ;
      access_log off;
      add_header Cache-Control no-cache;
      proxy_cache secbook_cache;   
    }

}

