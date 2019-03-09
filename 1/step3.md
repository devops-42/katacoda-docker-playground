Now we run our first Docker container. The command used is `docker run`. The first example is very simple and well-known: "Hello World":

`docker run hello-world`{{execute}}

The container starts, prints a message and exits.

Note, that the `run` command checks automatically whether the image to run has been pulled already. In our case we did not pull the images `hello-world` yet, so an image pull will be triggered.

As suggested in the output of the "Hello, World" example we try a more ambitious example. Back to our Nginx image pulled in the steps before we want to start a container from the `latest` Nginx image:

`docker run nginx`{{execute}}

It seems that nothing happens, no output at all. Abort the `run` command by hitting <kbd>⌃CTRL</kbd>-<kbd>c</kbd> 

What happened? The Docker daemon created a container base on the parameter we specified in the `docker run` command. We only specified the image name, thus the container has been started in foreground (default behaviour).

To start the container in `detached` mode add the flag `-d`:

`docker run -d nginx`{{execute}}

The container starts up, the docker daemon returns a unique hash. We can verify that the container had been started with the `docker ps` command:

`docker ps`{{execute}}

This command gives status information about running containers, such as:
- `CONTAINER ID`: A unique container id (generated)
- `IMAGE`: Image name (and tag)
- `COMMAND`: Started process in container (we'll cover this later)
- `CREATED`: When created
- `STATUS`: Current status
- `PORTS`: Exposed ports (we'll cover this in the next exercise)
- `NAMES`: Generated alias name (we'll cover this in the next exercise)

Note, that the `CONTAINER ID` coincide with the first 12 characters of the hash value returned after `docker run ...`.