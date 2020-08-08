<?xml version="1.0" ?>
<rss version="2.0">
  <channel>
    <title>Dozens and Dragons</title>
    <link>https://dozensanddragons.neocities.com</link>
    <description>ttrpg blog</description>
define(__feed)dnl
define(`for',`ifelse($#,0,``$0'',`ifelse(eval($2>=$3),1,
    `pushdef(`$1',$2)$4`'popdef(`$1')$0(`$1',decr($2),$3,`$4')')')')
dnl The obvious thing here would be to define <, >, and & as macros.
dnl Sadly those are not valid macro names according to m4.
for(`__i',__latest,ifelse(eval(__latest>10),true,eval(__latest - 10),1),`
    syscmd(m4 -D__feed src/__i.m4 | sed "s/\&/\&amp;/g;s/>/\&gt;/g;s/</\&lt;/g")')
  </channel>
</rss> 
