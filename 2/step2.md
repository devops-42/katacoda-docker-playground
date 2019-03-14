Committng Docker images is fine for short-term changes or test scenarios. In the step we take a look at building reproducable Docker images.

Copy the content of this file into the editor:

<pre class="file" data-filename="Dockerfile" data-target="replace">FROM alpine:latest
                                                                   
RUN apk update
RUN apk add vim
RUN apk add curl
</pre>


Now issue the `docker build` command in order to build the image. `docker build` expects a file named `Dockerfile` in the working directory. The built image can be named and tagged after creation by using the `-t` flag:

`docker build -t dockerfundamentals-curl:alping`{{execute}}

