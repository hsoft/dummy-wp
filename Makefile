LOCALCONF=.env
WPCONFMODELS=initial/wp-config.php
WPCONF=wordpress/wp-config.php
DBIMPORTED=initial/dbimported
DUMPGZ=initial/dump.sql.gz
SHELL=/bin/bash

.PHONY: all
all: $(WPCONF)

$(LOCALCONF):
	test -f $@ || echo "You need a $(LOCALCONF). Use env.sample as a model" && exit 1

wordpress:
	composer install

$(WPCONF): $(LOCALCONF) $(WPCONFMODELS).top $(WPCONFMODELS).bottom wordpress
	source $(LOCALCONF) && envsubst < $(WPCONFMODELS).top | cat - $(WPCONFMODELS).bottom > $@

$(DBIMPORTED): | $(DUMPGZ)
	source $(LOCALCONF) && mysql -u $$DBUSER -h $$DBHOST --password=$$DBPASS -e "create database if not exists $$DBNAME"
	source $(LOCALCONF) && gzip -dc $(DUMPGZ) | mysql -u $$DBUSER -h $$DBHOST --password=$$DBPASS -U $$DBNAME
	touch $@

.PHONY: run
run: all $(DBIMPORTED)
	cd wordpress && php -S localhost:8080 ../devrouter.php
