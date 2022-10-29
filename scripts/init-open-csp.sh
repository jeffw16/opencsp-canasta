#! /bin/bash

MW_PATH="/var/www/mediawiki/w"

php $MW_PATH/extensions/SemanticMediaWiki/maintenance/rebuildElasticIndex.php

mkdir -p $MW_PATH/extensions/Widgets/compiled_templates && \
    chown -R www-data $MW_PATH/extensions/Widgets/ && \
    chmod -R u+rwx $MW_PATH/w/extensions/Widgets/compiled_templates/