#### `ARG`

Image builds can be parameterized. This is achieved by the `ARG` directive.

Copy the content of this file into the editor:

<pre class="file" data-filename="Dockerfile" data-target="replace">FROM alpine:latest

ARG VERSION_STRING
                                                                 
RUN echo "Building version ${VERSION_STRING}"
</pre>

Issue the `docker build` command with the parameter `--buil-darg`:

`docker build --build-arg VERSION_STRING=1.0 -t dockerfundamentals-echo:alpine .`{{execute}}

During the build process the message `Building version 1.0` should appear.

#### `ENV`

In order to preset some environment variables you can use the `ENV` keyword.

Copy the content of this file into the editor:

<pre class="file" data-filename="Dockerfile" data-target="replace">FROM alpine:latest

ARG VERSION_STRING

ENV JAVA_HOME=/usr/lib/jvm/java
                                                                 
RUN echo "Building version ${VERSION_STRING}"
</pre>

Build and run the image:

`docker build --build-arg VERSION_STRING=1.1 -t dockerfundamentals-echo:alpine .`{{execute}}

`docker run -ti dockerfundamentals-echo:alpine env`{{execute}}

A set of all environment variables should be displayed:

`
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=0e31925c68db
TERM=xterm
JAVA_HOME=/usr/lib/jvm/java
HOME=/root
`

#### `USER`

As you might recognize the container runs with user `root`. To avoid security issues it is recommended to switch to another user. The user can be create during the image build. To switch the user you can use the `USER` directive.

Copy the content of this file into the editor:

<pre class="file" data-filename="Dockerfile" data-target="replace">FROM alpine:latest

ARG VERSION_STRING

ENV JAVA_HOME=/usr/lib/jvm/java
                                                                 
RUN echo "Building version ${VERSION_STRING}"

RUN adduser -u 1000 -D -h /home/testuser -g "Test User" testuser

USER testuser

</pre>

Build and run the image:

`docker build --build-arg VERSION_STRING=1.1 -t dockerfundamentals-echo:alpine .`{{execute}}

`docker run -ti dockerfundamentals-echo:alpine /bin/sh`{{execute}}

Check the current logged in user:

`id`{{execute}}

The container now runs as `testuser`:

`uid=1000(testuser) gid=1000(testuser)`

Exit the container:

`exit`{{execute}}