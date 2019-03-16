Docker compose facilitates the management of one or more container by means of a centralized template file named `docker-compose.yml`. 

In the first example we see a setup for a Nginx container (details on configuration options within the file later in this tutorial). The image used is `nginx:latest`, the container's name is `web`, an external volume will be mounted and some ports exposed. Sounds familiar, eh?

<pre class="file" data-filename="docker-compose.yml" data-target="replace">version: '3'
services:
  nginx: 
    image: nginx:latest
    container_name: web
    volumes:
      - /root/tutorial/conf.d:/etc/nginx/conf.d
    ports:
      - 80:80
      - 443:443
</pre>
 
To start the container with the configuration run:

`docker-compose up -d`{{execute}}

The `-d` flag means `detached` i.e. the container will started in background mode. 
 
https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/
