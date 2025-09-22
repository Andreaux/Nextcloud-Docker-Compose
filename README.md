Stack version 3.1

# Nextcloud docker-compose template with MariaDB, Redis, Nextcloud, Nextcloud-cronjobs and Collabora

This is my Nextcloud Docker-Compose "almost-all-in-one" template.

The stack features separate containers for:
- MariaDB (mariadb:11.5.2)
- redis (redis:alpine)
- nextcloud (nextcloud:31.0.9)
- collabora (collabora/code:latest)
- nextcloud cron jobs (rcdailey/nextcloud-cronjob)

The stack also includes dependencies to make sure the DB and Memcache (Redis) are available before the other containers are started.

Configuration for Nextcloud and the DB are mapped from within the docker-compose file (local folder next to the docker-compose.yml file). You can of course change the mount method and path to suit your installation, should you want to access a remote volume for example.

My Home Lab runs Ubuntu Virtual Machines to host my Docker Projects where I run Nginx Proxy Manager as a reverse proxy. You will need to set up a proper domain and/or reverse proxy for Nextcloud to be served over HTTPS. In my Homelab, I use Nginx Proxy Manager as reverse proxy and to issue Let's Encrypt SSL certificates through Cloudflare so I don't have to keep a port open for certbot to call in (a free Cloudflare account totally works which will enable free wildcard certificates for all your local hosts as well).

NOTE:
This docker-compose file doesn't contain the reverse proxy, if you need one, you will have to get it up and running separately. I have a stack that includes Traefik and Traefik Labels for all services, read on if interested.

## Environment variables

Docker Compose will need environment variables set. I have included an EXAMPLE.env file to make what is expected there easier to understand. Make a copy, edit your secrets and rename the file to .env

If you use Portainer, you will have to set these within Portainer (Advanced mode is easier as you just need to copy-paste the contents of the .env file) when creating the Nextcloud stack after you've pasted the docker-compose.yml file into Portainer. If you use "docker-compose" to bring up the stack, the .env file should be picked up automatically so fill in your information in there.

## Traefik / Nginx Proxy Manager

A reverse proxy is needed to be able to provide all internal services with an SSL certificate and be able to use all services without needing to write port numbers in URLs. I found the easiest for me was to use Cloudflare and get SSL certificates through Cloudflare. A free Cloudflare account is more than enough to achieve this. While you can deploy this Stack without Traefik or Nginx Proxy Manager, you would have to set up SSL certificates for each service individually. Traefik and Nginx Proxy Manager make this otherwise tedious process effortless.

This stack assumes you will be running your own Reverse Proxy (not part of this stack)
I have previously created another stack that uses Traefik, you can check it out here: [https://github.com/Andreaux/Traefik-Docker-Compose-Traefik](https://github.com/Andreaux/Nextcloud-Docker-Compose-Traefik)

## Support this project

If you find this useful, a coffee through Ko-Fi is all it takes to make me happy <3 (I love coffee :D) Click the Sponsor button on the top of this page or visit https://ko-fi.com/andreaux to buy me a coffee.

## Disclaimer

This template is provided as-is with no pretention as for its usefulness or accuracy. I provide no support, but am open to comments, suggestions or corrections (please do!). Bear in mind that I'm still learning docker and docker-compose so there's no guarantee I haven't made errors in there although this installation works fine since a few months now.
