Lets focus on managing more than one container with `docker-compose`. We'll try a more complex example. The following compose file consists of two services:

- `db`: Database service
- `phpmyadmin`: PHPMyAdmin application

Copy the content of this file into the editor:

<pre class="file" data-filename="docker-compose.yml" data-target="replace">version: '3'

services:
    db:
        image: mysql
        command: --default-authentication-plugin=mysql_native_password
        environment:
            - MYSQL_DATABASE=katacoda
            - MYSQL_USER=katacoda
            - MYSQL_PASSWORD=password
            - MYSQL_ROOT_PASSWORD=mysql
        volumes:
            - ./db:/var/lib/mysql
        ports:
            - "3306:3306"
    phpmyadmin:
        image: phpmyadmin/phpmyadmin
        environment:
            - PMA_ARBITRARY=1
            - MYSQL_USER=katacoda
            - MYSQL_PASSWORD=password
            - MYSQL_ROOT_PASSWORD=mysql
        ports:
            - "80:80"
volumes:
    db:
        driver: "local"
</pre>
 
To start the services run:

`docker-compose up -d`{{execute}}
 
The service `phpmyadmin` exposes a HTTP port, it is accessible below this link: https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/

Just login to Host `db` with the login and password provided in the environment section.
