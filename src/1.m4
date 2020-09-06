define(__title, `A cool blog post')dnl
define(__subtitle, `in which I talk about some cool things')dnl
define(__keywords, `blog introductions hello-world')dnl
define(__timestamp, 2020-08-08)dnl
define(__id, 1)dnl
include(src/partials/header.html)
changequote(<!,!>)dnl Or else `code blocks` confuse m4

include(src/1.md)

## inline markdown
This is markdown from inside the m4 file!

changequote`'dnl change quotes `back to default'
include(src/partials/footer.html)
