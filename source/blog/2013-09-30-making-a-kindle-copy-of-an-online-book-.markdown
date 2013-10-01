---
title: Getting a fanfiction story on to my Kindle
tags:
  - programming
date: "2013-09-30"
hours_to_write: 0
---

<div class="authors-note">
  Out of respect for Charles Sonnenburg, this is not a step by step guide on how to pirate his work. Copies of my custom kindle version of his book will only be found on my machines. I will not distribute it. 

  I leave getting my script running as an exercise for the reader. 
</div>

 * * * 

I've been wanting to read Charles Sonnenburg's book series ["The Unity Saga"](http://unitysaga.com/) for some time. Unfortunately, it's only available online on his website. I want to read it offline on my kindle. 

Naturally, I choose the difficult option. I could have read it on my iPad but that didn't appeal to me. Instead, since I am a programmer, I wrote a script. 

The script is a pretty straightforward use of ruby's nokogiri library to extract the body text of the chapters and massage the html a little. It runs through an offline copy of the site and slurps up all of the chapters and book headings. Then it dumps the result into a single large html file, complete with some of the site's original styling. 

From there, I did more massaging to remove navigation links and manually edited the styling to my liking. All that remained is how to get it into my kindle. 

This is where the real trick is. It's also the easiest step in the process. I just email the html file to my Kindle! Amazon's [Kindle Personal Document Service](http://www.amazon.com/gp/help/customer/display.html/ref=hp_pdoc_main_short_us?nodeId=200767340) converts the html file into an ebook. Now, the author is my email address and the title is the filename of the file I attached but good enough for me.
 
Gist of my script below

<script src="https://gist.github.com/epochwolf/6773715.js"></script>
