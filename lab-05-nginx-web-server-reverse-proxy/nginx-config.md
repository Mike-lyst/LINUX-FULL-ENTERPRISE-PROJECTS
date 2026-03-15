server {

    listen 8081;

    server_name localhost;

    root /var/www/peace-site;

    index index.html;

    location / { proxy_pass http://127.0.0.1:3000;

proxy_set_header Host $host;

proxy_set_header X-Real-IP $remote_addr;

}

}
