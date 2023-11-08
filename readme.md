# Dynu on Docker
The smallest (7 MB) Docker image that implements the IP update service for the dynu.com DDNS.

## Usage (Linux)
In order to use this image, move inside the directory in which you want to download the `docker-compose.yml` file,
then issue the following command:

> wget https://raw.githubusercontent.com/iamryusei/dynu-on-docker/master/docker-compose.yml

now edit the  `docker-compose.yml` file with your favourite text editor, and replace the desired environmental properties.
Finally, issue the following command to start the service:

> docker compose up -d