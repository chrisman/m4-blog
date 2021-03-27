# m4 blog

this is boilerplate for a static blog generator that uses m4 and pandoc.

## About

I've started using this structure for a couple different blogs now, so I thought I'd make a boilerplate for myself and in case anybody else finds it useful.

[Read the blog post about it.](https://chrisman.github.io/9.html)

It uses m4 for includes and macros, and pandoc for markdown -> HTML conversion.

pros:

- you probably don't need to install *anything* to get started
- uses m4

cons:

- uses m4

## Features

- auto updates an rss feed and an "all posts" page
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
├── LATEST # includes the total number of posts
├── Makefile
├── README.md
├── out
│   ├── img
│   └── styles
├── src
│   ├── 1.m4 # every post must be titled <number>.m4
│   ├── about.m4
│   ├── contact.m4
│   ├── feed.m4
│   ├── list.m4
│   └── partials
│       ├── footer.html
│       ├── header.html
│       └── nav.html
└── static
    ├── img
    └── styles
        └── main.css

8 directories, 12 files
```

## Getting started

1. Create a new project called `my-blog`: `npx tiged chrisman/m4-blog my-blog`

2. Fixups: There are some places you will need to edit and add your own information. I've tried to mark each of these places with a `FIXME`. So definitely run a `grep -r FIXME .` and correct all those.


## Blogging

1. Increment the number in LATEST and edit `src/<number>.m4`

2. (optional) start `make watch` in one terminal, and `make serve` in another. Then you can open up http://localhost:3001 to see your changes. The watcher will rebuild files on save. You just need to refresh your browser.

3. build: `make`

4. publish: `make publish` Option: if you're making a Github Pages site, change the Makefile so that all the outputs are written to the project root directory instead of to `/out`. Then just push to master.

## Adding new pages and partials

Every `.m4` file in `/src` will be turned into an `.html` file in `/out`. If you want to add a new page, look at pages like `/src/about.m4` and `/src/contact.m4` as examples.

Files in `/src/partials` can be HTML or markdown
