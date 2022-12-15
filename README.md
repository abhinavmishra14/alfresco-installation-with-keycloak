# alfresco-installation-with-keycloak
This project is a demo on how to configure alfresco, share, proxy, content-app and keycloak in dockerized environment


## Important Configuration

>> Add your local computer IP to `.env` variable HOST_IP before running Docker Compose.

### To build use following command:

- To build the images, This command will ignore any images which are already built and no changes to DockerFile has been identified. It will use cache.

`docker-compose -f ./docker-compose.yml build`

- To build the images with no cache. It will force rebuild

`docker-compose -f ./docker-compose.yml build --no-cache`


### To launch containers use following command:

`docker-compose -f ./docker-compose.yml up`


### To build and launch containers use following command:

`docker-compose -f ./docker-compose.yml up --build`


### To shutdown use following command:

`docker-compose -f ./docker-compose.yml down`

### To tail logs use following command:

`docker-compose -f ./docker-compose.yml logs -f`


### You can use launcher.bat/launcher.sh script to build, start, stop, purge volumes and tail logs:

- For Windows:

`.\launcher.bat build`

`.\launcher.bat start`

`.\launcher.bat stop`

`.\launcher.bat purge`

`.\launcher.bat tail`


- For Linux:

`.\launcher.sh build`

`.\launcher.sh start`

`.\launcher.sh stop`

`.\launcher.sh purge`

`.\launcher.sh tail`


## URLs For Services

http://localhost:8080

Alfresco Content App

* user: admin
* password: admin

http://localhost:8080/share

Share

* user: admin
* password: admin

http://localhost:8080/alfresco

Alfresco Content Services

* user: admin
* password: admin

http://localhost:8999

Keycloak

* user: admin
* password: admin

**Basic configuration for Keycloak**

Users

* Username: admin | Password: admin
* Username: test-user | Password: admin

Roles
* editorial_role
* default-roles-alfresco

Groups

* Editorial
* Administrator
