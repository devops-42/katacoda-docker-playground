Now we‘re going to pull a Nginx image from Dockerhub. Issue the command:

`docker pull nginx`{{execute}}

and see, whether the image has been stored locally:

`docker images`{{execute}}

What happened? The Docker daemon contacted the default registry (i.e. Docker hub) and checked, whether an images exists with the id 'nginx'
We didn‘t specify a special tag so the daemon requested to pull the 'latest' tag.