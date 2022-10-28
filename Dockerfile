FROM ghcr.io/canastawiki/canasta:latest AS base

COPY ./LocalSettings.default.php /var/www/mediawiki/w/LocalSettings.default.php
COPY ./install-open-csp-canasta-compile.sh /tmp/
COPY ./install-open-csp-canasta-runtime.sh /tmp/

RUN set -x && \
	cd /var/www/mediawiki/w && \
	mv LocalSettings.php LocalSettings.canasta.php && \
	mv LocalSettings.default.php LocalSettings.php

RUN set -x && \
	cd /var/www/mediawiki/w/extensions && \
	ln -s /var/www/mediawiki/w/canasta-extensions/* /var/www/mediawiki/w/extensions

RUN set -x && \
	cd /var/www/mediawiki/w && \
	composer config repositories.38 composer https://gitlab.wikibase.nl/api/v4/group/38/-/packages/composer/

RUN set -x && \
	cd /tmp && \
	chmod u+x install-open-csp-canasta-compile.sh && \
	chmod u+x install-open-csp-canasta-runtime.sh && \
	./install-open-csp-canasta-compile.sh /var/www/mediawiki/w

RUN set -x && \
	mv LocalSettings.php LocalSettings.default.php && \
	mv LocalSettings.canasta.php LocalSettings.php

CMD ["/run-apache.sh"]