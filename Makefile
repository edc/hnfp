.SUFFIXES: .out .html
.PHONY: all, dbrestore

all: index.html

dbrestore:
	mongorestore hn/dump

index.out:
	mongo hn_db --quiet hn-stat.mongo.js > $@

.out.html:
	python render.py $<

