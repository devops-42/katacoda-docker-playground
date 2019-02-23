In the last step we just started a container without any customiziation. Let's have a look at the `docker run` options. At first we'll start the container in detached mode:

`docker run -d nginx`{{execute}}

The container starts up, the docker daemon returns a unique hash. We check the container's run state by the already known command:

`docker ps`{{execute}}

Note the `CONTAINER ID`, which coincide with the first 12 characters of the printed hash.

In the `PORTS` column we see, that the Nginx running inside the container exposes a port 80 for HTTP access. In order to access the port from the outside the container, we need to add more options to the `docker run` command. At first we need to stop the running container:

`docker stop <CONTAINER ID>`

To simplify the stopping process we just `grep` it from the list of running containers:

`docker stop $(docker ps | grep nginx | awk '{print $1}')`{{execute}}

The Nginx container is stopped, check it by issuing:

`docker ps -a`{{execute}}

Now re-run the container and assign a port for outside access:

`docker run -d -p 80:80 nginx`{{execute}}

Verify, whether Nginx is accessible from outside:

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/