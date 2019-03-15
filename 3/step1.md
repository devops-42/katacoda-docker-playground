For the tool `docker-compose` everything is described in a file named `docker-compose.yml`.

Copy the content of this file into the editor:

<pre class="file" data-filename="docker-compose.yml" data-target="replace">version: '3'
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