`docker-compose` can also used to build an image and running services upon building. Take a look at the following example:

<pre class="file" data-filename="docker-compose.yml" data-target="replace">version: '3'

services:
   web:
    build:
      dockerfile: Dockerfile
      context: ./web
    ports:
      - 8080:80
</pre>
 
To start the services run:

`docker-compose up -d`{{execute}}
 
The service `phpmyadmin` exposes a HTTP port, it is accessible below this link: https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/
