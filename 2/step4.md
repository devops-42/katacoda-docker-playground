In this step we will consider `CMD` and `ENTRYPOINT`.

### `ENTRYPOINT`

`ENTRYPOINT` sets the first command (and parameters) when running a container. For most images in Dockerhub it will be `/bin/sh` or `/bin/bash`. In our example we use a different command.

Copy the content of this file into the editor:

<pre class="file" data-filename="Dockerfile" data-target="replace">FROM alpine:latest

RUN adduser -u 1000 -D -h /home/testuser -g "Test User" testuser
RUN apk add --update iputils

USER testuser

ENTRYPOINT ["ping", "-c", "3", "localhost"]
</pre>

`docker build -t dockerfundamentals-ping:alpine .`{{execute}}

`docker run --rm dockerfundamentals-ping:alpine`{{execute}}

Instead of a bash command you may provide a path to an executable script, usually named `/entrypoint.sh`


#### `CMD`

`CMD` is used to set the default executive on an image. Sound similar to `ENTRYPOINT`... 

Copy the content of this file into the editor:

<pre class="file" data-filename="Dockerfile" data-target="replace">FROM alpine:latest

RUN adduser -u 1000 -D -h /home/testuser -g "Test User" testuser
RUN apk add --update iputils

USER testuser

CMD ping -c 3 localhost
</pre>

Issue the `docker build` command with the parameter `--build-arg`:

`docker build -t dockerfundamentals-ping:alpine .`{{execute}}

Run the image, the container should ping the localhost three times.

`docker run --rm -ti dockerfundamentals-ping:alpine /bin/sh`{{execute}}


### `ENTRYPOINT` and `CMD` combined

Look at the following example:

<pre class="file" data-filename="Dockerfile" data-target="replace">FROM alpine:latest

RUN adduser -u 1000 -D -h /home/testuser -g "Test User" testuser
RUN apk add --update iputils

USER testuser

ENTRYPOINT ["ping", "-c", "3"]
CMD ["localhost"]
</pre>

`docker build -t dockerfundamentals-ping:alpine .`{{execute}}

`docker run --rm dockerfundamentals-ping:alpine`{{execute}}

As you see, `ENTRYPOINT` preceedes the `CMD` declaration. Moreover, when starting the container `ENTRYPOINT` takes the values of `CMD` as an additional parameter. Here the command:

`ping -c 3 localhost`

will be executed.