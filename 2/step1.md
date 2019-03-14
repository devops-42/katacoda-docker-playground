In this step we learn how to create Docker images from a running container.

At first we query a list of all installed Docker images:

`docker images`{{execute}}

We'll see at least 3 images:

`
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
redis               latest              4760dc956b2d        12 months ago       107MB
ubuntu              latest              f975c5035748        12 months ago       112MB
alpine              latest              3fd9065eaf02        14 months ago       4.14MB
`

Pull and run the `nginx` example from the last scenario:

`docker run --name web -d -p 80:80 nginx`{{execute}}

Verify the state of the container:

`docker ps`{{execute}}

Login into the container via `docker exec` command:

`docker exec <OPTION> <CONTAINER_NAME_OR_ID> <COMMAND_TO_RUN>`

In our case we want to login to the `web` container, using the parameters are:
                                                               
* `t` - Allocate a pseudo-terminal
* `i` - Interactvie mode

The command to be run is a Bash shell.

`docker exec -ti web /bin/bash`{{execute}}

Remark: Not all containers have Bash or even Sh installed!

Now you can perform normal operations like file listing:

`ls -l`{{execute}}

Create a file named `testfile`:

`echo "This is a test" > testfile`{{execute}}

and check, whether it has been created:

`stat testfile`{{execute}}

Now leave the container's shell:

`exit`{{execute}}

Stop and re-run the container, login and verify, whether the file is still there:

`docker stop web`{{execute}}

`docker run --name web -d -p 80:80 nginx`{{execute}}

`docker exec -ti web /bin/bash`{{execute}}

`stat testfile`{{execute}}

As you see, the file is missing, all changes were lost after the container has been stopped. There are several ways to avoid this, one of them is committing the container's state into a new image.

