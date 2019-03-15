Image build can be parameterized. This is achieved by the `ARG` directive.

Copy the content of this file into the editor:

<pre class="file" data-filename="Dockerfile" data-target="replace">FROM alpine:latest

ARG VERSION_STRING
                                                                 
RUN echo "Building version ${VERSION_STRING}"
</pre>

Issue the `docker build` command with the parameter `--buil-darg`:

`docker build --build-arg VERSION_STRING=1.0 -t dockerfundamentals-echo:alpine .`{{execute}}

During the build process the message `Building version 1.0` should appear.

In order to preset some environment variables you can use the `ENV` keyword.

Copy the content of this file into the editor:

<pre class="file" data-filename="Dockerfile" data-target="replace">FROM alpine:latest

ARG VERSION_STRING

ENV JAVA_HOME=/usr/lib/jvm/java
                                                                 
RUN echo "Building version ${VERSION_STRING}"
</pre>

Build and run the image:

`docker build --build-arg VERSION_STRING=1.1 -t dockerfundamentals-echo:alpine .`{{execute}}

`docker run -ti dockerfundamentals-echo:alpine /bin/sh -c echo $JAVA_HOME`{{execute}}