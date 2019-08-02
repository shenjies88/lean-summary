## 常用控制指令

```bash
nginx #启动
nginx -s stop #快速停止
nginx -s quit #完美退出
nginx -s reload #重新加载配置
nginx -s reopen #重新打开日志文件
```

## demo

```nginx
server {
    listen       80;
    server_name  $serverName;

    location / {
	    proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header REMOTE-HOST $remote_addr;
            add_header Cache-Control no-store;
            add_header Pragma no-cache;
            proxy_pass $后端ip+端口或域名; 
            root   $静态路径;
            index  index.html;

            if (!-e $request_filename) {
               rewrite ^/(.*) /index.html last;
               break;
           } 

    }
  
    location /api {
      rewrite  /api/(.*)  /$1  break;
      proxy_pass $后端ip+端口或域名;
  }
 
}

}
        
server {
    listen       443;
    server_name  $serverName;

    ssl on;
    ssl_certificate      /etc/nginx/ssl/nav.asoco.com.cn/214904169970690.pem;
    ssl_certificate_key  /etc/nginx/ssl/nav.asoco.com.cn/214904169970690.key;

    location / {
        add_header Cache-Control no-store;
        add_header Pragma no-cache;
	      proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header REMOTE-HOST $remote_addr;
        root  $静态路径;  
        index  index.html;
    }
  
      location /api {
    		rewrite  /api/(.*)  /$1  break;
     	  proxy_pass $后端ip+端口或域名;
  }
}
```

