proxy_cache_path /etc/nginx/books_cache levels=1:2 keys_zone=books_cache:100m inactive=1d max_size=200m;

server {
    listen 80;

    server_name gobook.zbstream.com;
    root /root/workshop/gobook/gobook/;

    index index.html;

    location ~ .*\.(gif|jpg|jpeg|png|bmp|swf|css)$ {
    	log_not_found off;
      expires max;
      access_log off;
      add_header Cache-Control max-age=86400;
	    proxy_cache books_cache;   
    }

    location ~ .*\.(html|htm)$ {
      log_not_found off;
      expires 1m ;
      access_log off;
      add_header Cache-Control no-cache;
      proxy_cache books_cache;   
    }

}

