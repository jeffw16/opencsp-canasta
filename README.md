# opencsp-canasta
Open CSP on Canasta

## Setup instructions
This is very much a WIP

1. Download this repo somewhere on your server.
2. Download the Canasta CLI and Docker.
3. Create a wiki using the Canasta CLI (i.e. `canasta create`). Keep note of where the resulting directory is located.
4. `cd` back to the instance of this repo on your server. Run the following: `docker build -t opencsp-canasta:latest .`
5. In the `docker-compose.override.yml`, change the `image:` to `opencsp-canasta:latest`.
6. Run `canasta start`.
7. Ensure the working directory is the one that the Canasta CLI created in step 3, then run `docker compose exec web bash /tmp/install-open-csp-canasta-runtime.sh /var/www/mediawiki/w`.
8. You're done! Now visit your Open CSP wiki.