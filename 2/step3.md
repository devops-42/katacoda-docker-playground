Image build can be parameterized. This is achieved by the `ARG` directive.

Copy the content of this file into the editor:

<pre class="file" data-filename="Dockerfile" data-target="replace">FROM alpine:latest

ARG VERSION_STRING
                                                                 
RUN echo "Building version ${VERSION_STRING}
</pre>

Issue the `docker build` command with the parameter `--buildarg`:

`docker build --buildarg VERSION_STRING=1.0 -t dockerfundamentals-echo:alpine .`{{execute}}
