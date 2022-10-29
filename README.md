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
7. Ensure the working directory is the one that the Canasta CLI created in step 3, then run `docker compose exec web bash /install-open-csp-canasta-runtime.sh /var/www/mediawiki/w`.
8. You're done! Now visit your Open CSP wiki.

## Run instructions
Currently, a patch script is required immediately after a new Canasta container is launched.

Run `sudo docker compose exec web /init-open-csp.sh` to finish initializing Open CSP.

## Troubleshooting

### SMW invalid schema key error
0. Run the patch script specified above. If that doesn't work, then:
1. Restart the Canasta instance using `canasta restart`.
2. If that doesn't fix it, run `canasta maintenance` to run maintenance scripts to fix it.
3. If that doesn't fix it, try running:
```
sudo docker compose exec web php /var/www/mediawiki/w/extensions/SemanticMediaWiki/maintenance/rebuildElasticIndex.php
sudo docker compose exec web chown -R www-data /var/www/mediawiki/w/extensions/Widgets/ && chmod -R u+rwx /var/www/mediawiki/w/extensions/Widgets/compiled_templates/
```
4. If that doesn't fix it, run this as a last resort:
```
sudo docker compose exec web php /var/www/mediawiki/w/extensions/SemanticMediaWiki/maintenance/rebuildData.php
```