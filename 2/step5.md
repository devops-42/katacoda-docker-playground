In this step we will consider `ADD` and `COPY`.

### `ADD`

`ADD` copies images either from local directory or from a remote URL to a given location on the image. 

Copy the content of this file into the editor:

<pre class="file" data-filename="Dockerfile" data-target="replace">FROM alpine:latest

RUN adduser -u 1000 -D -h /home/testuser -g "Test User" testuser

ADD README.md /home/testuser

USER testuser

ENTRYPOINT ["ls", "-l", "/home/testuser"]
</pre>

Build and run:

`docker build  -t dockerfundamentals-echo:alpine . && docker run dockerfundamentals-echo:alpine`{{execute}}

