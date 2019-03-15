In this step we will consider `VOLUME`

### `VOLUME`

Volumes decouples storage from container. With the `VOLUME` keyword a mount point will be declared, to which external volumes can be bound.

First we create a volume:

`docker volume create myvol`{{execute}}

Copy the content of this file into the editor:

<pre class="file" data-filename="Dockerfile" data-target="replace">FROM alpine:latest

RUN adduser -u 1000 -D -h /home/testuser -g "Test User" testuser
RUN mkdir /myvol
RUN echo "foobar" > /myvol/foobar

VOLUME ["/myvol"]

USER testuser

ENTRYPOINT ["ls", "-l", "/myvol"]
</pre>

Build and run:

`docker build  -t dockerfundamentals-vol1:alpine . && docker run dockerfundamentals-vol1:alpine`{{execute}}

The container prints out a list of files within the mount point `/myvol`

To use this volume with another container we build a second image:

pre class="file" data-filename="Dockerfile" data-target="replace">FROM alpine:latest

RUN mkdir /myvol

VOLUME ["/myvol"]

ENTRYPOINT ["ls", "-l", "/myvol"]
</pre>

Build and run again:

`docker build  -t dockerfundamentals-vol2:alpine . && docker run dockerfundamentals-vol2:alpine`{{execute}}