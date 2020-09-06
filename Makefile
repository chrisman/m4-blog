LATEST := $(shell cat LATEST)

SRCDIR=src
OUTDIR=out

_PAGES=$(shell find src/*.m4 ! -name "feed.m4")
BLOG_PAGES=$(patsubst src/%.m4,%.html,$(_PAGES))

_STATIC_FILES=$(shell find static -type f -name \*)
STATIC_OUT=$(patsubst static/%,out/%,$(_STATIC_FILES))

.PHONY: all watch serve clean upload publish

all: index.html $(BLOG_PAGES) rss.xml $(STATIC_OUT)

out/%: static/%
	@mkdir -p $(@D)
	@cp -r $< $@

index.html: src/$(LATEST).m4
	@echo $@
	@m4 -D__latest=$(LATEST) $< | pandoc -f markdown -t html > out/$@

%.html: src/%.m4
	@echo $@
	@m4 -D__latest=$(LATEST) $< | pandoc -f markdown -t html > out/$@

rss.xml: src/feed.m4
	@echo $@
	@m4 -D__latest=$(LATEST) $< > out/$@

watch:
	@echo $(_PAGES) | tr " " "\n" | entr -r make

serve: all
	@cd out; ls *.html | entr -c -r python -m http.server 3001

clean:
	@rm -rf out/*; echo "...so clean"

upload: publish
publish:
	./upload.sh
