LATEST := $(shell cat LATEST)
SRC=$(shell find src/*.m4 ! -name "feed.m4")
OUTS=$(patsubst src/%.m4,%.html,$(SRC))

all: index.html $(OUTS) rss.xml assets
assets: static/styles static/img ; @cp -r $< out
index.html: src/$(LATEST).m4
	@m4 -D__latest=$(LATEST) $< | pandoc -f markdown -t html > out/$@
%.html: src/%.m4
	@m4 -D__latest=$(LATEST) $< | pandoc -f markdown -t html > out/$@
rss.xml: src/feed.m4
	@m4 -D__latest=$(LATEST) $< | pandoc -f markdown -t html > out/$@
watch: ; @echo $(SRC) | tr " " "\n" | entr -r make
serve: all ; @cd out; ls *.html | entr -c -r python -m http.server 3001
clean: ; @rm -rf out/*; echo "...so clean"
publish:
	rsync -azP out/ FIXME:some_site
	make clean
