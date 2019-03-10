At first we create a directory in which we store our compose file:

`cd ~/tutorial`{{execute}}

Copy the content of this file into the editor:

<pre class="file" data-filename="tutorial/docker-compose.yml" data-target="replace">
version: '3'
services:
  nginx: 
    image: nginx:latest
    container_name: web
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
    ports:
      - 80:80
      - 443:443
</pre>

To start run:

`docker-compose up -d`{{execute}}