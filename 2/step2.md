Committng Docker images is fine for short-term changes or test scenarios. In the step we take a look at building reproducable Docker images. First we need a file in which all build steps are described. This file is called `Dockerfile`.

Copy the content of this file into the editor:

<pre class="file" data-filename="Dockerfile" data-target="replace">FROM alpine:latest
                                                                   
RUN apk update
RUN apk add curl
</pre>

Now issue the `docker build` command in order to build the image. The command syntax is:

`docker build -t <IMAGE_NAME>:<IMAGE_TAG> </PATH/TO/Dockerfile>`

With the `-t` flag you can assign an image name and tag. Last parameter is the path where the Dockerfile resides. In our scenario the Dockerfile is in the working directory:

`docker build -t dockerfundamentals-curl:alpine .`{{execute}}

The build process starts, after building Docker should display:

`Successfully tagged dockerfundamentals-curl:alpine`

Verify, whether the image appears in the list of locally available Docker images:

`docker images`{{execute}}

Now the image can be used to instantiate containers. We start the container with an interactive shell:

`docker run -ti dockerfundamentals-curl:alpine /bin/sh`{{execute}}

First we check whether we got the right OS version:

`cat /etc/issue`{{execute}}

Issue a curl command, which we installed according to the `Dockerfile`:

`curl google.com`{{execute}}

Exit the container:

`exit`{{execute}}

If we need additional packages (e.g. a text editor like `nano`) we have several possibilities:
* Install the package and commit the image
* Add the package to the `Dockerfile` and run the build again
* Create a new Dockerfile using the image `dockerfundamentals-curl:alpine` as base image and extend it by adding the package

The first variant has been shown in Step 1. Consider the second variant:

<pre class="file" data-filename="Dockerfile" data-target="replace">FROM alpine:latest
                                                                   
RUN apk update
RUN apk add curl
RUN apk add nano
</pre>

Build the image again:

`docker build -t dockerfundamentals-curl:alpine .`{{execute}}

You will see, that build step 1-3 will perform fast. There were no changes, therefore these layers have been cached locally. Run the image again:

`docker run -ti dockerfundamentals-curl:alpine /bin/sh`{{execute}}

and try to start `nano`:

`nano`{{execute}}

Exit from `nano` by hitting <kbd>⌃CTRL</kbd>-<kbd>x</kbd> 