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

The `-d` flag means `detached` i.e. the container will started in background mode. The startup consists of several steps:

- Network: A separate network will be created to isolate containers grouped in the configuration from other containers
- Image pull: If the image is not present yet, `docker-compose` pulls the immage first 
- Container start

Once the container has started successfully, `docker-compose` returns:

`Creating network "tutorial_default" with the default driver
Pulling nginx (nginx:latest)...
latest: Pulling from library/nginx
f7e2b70d04ae: Pull complete
08dd01e3f3ac: Pull complete
d9ef3a1eb792: Pull complete
Digest: sha256:98efe605f61725fd817ea69521b0eeb32bef007af0e3d0aeb6258c6e6fe7fc1a
Status: Downloaded newer image for nginx:latest
Creating web ... done`
 
The webserver should available below this link: https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/

You can check by `docker-compose`, whether the container is running:

`docker-compose ps`{{execute}}

The output should be similar to:

```
Name         Command          State                    Ports
------------------------------------------------------------------------------
web    nginx -g daemon off;   Up      0.0.0.0:443->443/tcp, 0.0.0.0:80->80/tcp`
```

To stop the Nginx container use:

`docker-compose down`{{execute}}

Docker compose stops the container, removes the container and the formerly created network:

`Stopping web ... done
Removing web ... done
Removing network tutorial_default`

You may check with `docker ps -a` that even no stopped containers appear:

`docker ps -a`{{execute}}