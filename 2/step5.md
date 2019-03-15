In this step we will consider `COPY` and `ADD`.

### `COPY`

`COPY` copies local stored files 

Copy the content of this file into the editor:

<pre class="file" data-filename="Dockerfile" data-target="replace">FROM alpine:latest

RUN adduser -u 1000 -D -h /home/testuser -g "Test User" testuser

COPY README.md /home/testuser

USER testuser

ENTRYPOINT ["ls", "-l", "/home/testuser"]
</pre>

Build and run:

`docker build  -t dockerfundamentals-echo:alpine . && docker run dockerfundamentals-echo:alpine`{{execute}}

The container starts and prints out the content of the `/home/testuser` directory. As you can see, the file `README.md` has been added properly.


### `ADD`

`ADD` copies images either from within the local directory or from a remote URL to a given location on the image. Moreover it has the ability to extract compressed source files in the target directory.

Copy the content of this file into the editor:

<pre class="file" data-filename="Dockerfile" data-target="replace">FROM alpine:latest

RUN adduser -u 1000 -D -h /home/testuser -g "Test User" testuser

ADD README.md /home/testuser
ADD http://mirror.centos.org/timestamp.txt /home/testuser

USER testuser

ENTRYPOINT ["ls", "-l", "/home/testuser"]
</pre>

Build and run:

`docker build  -t dockerfundamentals-echo:alpine . && docker run dockerfundamentals-echo:alpine`{{execute}}

The container starts and prints out the content of the `/home/testuser` directory. As you can see, the file `README.md` has been added properly.