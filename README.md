# m4 blog

this is boilerplate for a static blog generator that uses m4 and pandoc.

[read the blog post about it](https://chrisman.github.io/9.html)

## About

I've started using this structure for a couple different blogs now, so I thought I'd make a boilerplate for myself and in case anybody else finds it useful.

It uses m4 for includes and macros, and pandoc for markdown -> HTML conversion.

pros:

- you probably don't need to install *anything* to get started
- uses m4

cons:

- uses m4

## Features

- auto updates an rss feed
- your index page is your most recent blog entry = visitors immediately start reading your content
- `make watch` and `make serve` for dev / preview

## Dependencies

- m4
- pandoc
- entr (optional): used for `make watch`
- python (optional): used for `make serve`

## Structure

```
.
├── LATEST # contains the number of blog posts
├── Makefile
├── README.md
├── out
├── src
│   ├── 1.m4 # all posts must be `number.m4`
│   ├── about.m4
│   ├── contact.m4
│   ├── feed.m4
│   ├── footer.html
│   ├── header.html
│   └── list.m4
└── static
    ├── img
    └── styles
        ├── main.css
        └── reset.css

5 directories, 12 files
```

## Getting started

There are some places you will need to edit and add your own information. I've tried to mark each of these places with a `FIXME`.

`$ ag FIXME`

```
Makefile:18:	rsync -azP out/ FIXME:some_site
src/contact.m4:5:✉️ FIXME:your@email.com
src/header.html:3:<link>FIXME:yoursite.com/__id.html</link>
src/header.html:7:  <meta charset="utf-8"> <title>__title</title> <meta name="author" content="FIXME:your_name"> <meta name="viewport" content="width=device-width, initial-scale=1"> <link rel="alternate" type="application/rss+xml" href="/rss.xml" title="FIXME:site_title"> <link rel="stylesheet" href="styles/reset.css"> <link rel="stylesheet" href="styles/main.css"> <link rel="index" href="/list" /> ifdef(`__timestamp', `ifelse(__id,1,,`<link rel="prev" href="/decr(__id)">')') ifdef(`__timestamp', `ifelse(__id,__latest,,`<link rel="next" href="/incr(__id)">')')
src/feed.m4:4:    <title>FIXME:site name</title>
src/feed.m4:5:    <link>FIXME:link to your site</link>
src/feed.m4:6:    <description>FIXME:bla bla bla</description>
```

## Blogging

1. Increment the number in LATEST. Start `./src/<number>.m4`

2. (optional) start `make watch` in one terminal, and `make serve` in another. Then you can open up http://localhost:3001 to see your changes. The watcher will rebuild files on save. You just need to refresh your browser.

3. build: `make`

4. publish: `make publish` Option: if you're making a Github Pages site, change the Makefile so that all the outputs are written to the project root directory instead of to `/out`. Then just push to master.

