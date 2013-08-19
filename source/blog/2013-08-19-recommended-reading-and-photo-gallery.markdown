---
title: Recommended Reading and Photo Gallery
date: "2013-08-19"
hours_to_write: 0
tags:
  - blog
  - programming
---

In the last week, in between packing boxes for my move to Ohio, I've made some updates to my blog. 

By popular request I've created a [recommended reading][0] page. It gave me a chance to play around with the Amazon Affiliate program. Since all of my paperbacks are packed away, I only had the books on my [Kindle][3]{: title="Oh yeah, affiliate link!"} to draw from. Once I'm moved into my snazzy new apartment in Ohio, I'll update the page with any books I forgot about. 

I also took the chance to create a photo gallery. I used the blog plugin for MiddleMan to configured a third blog for photos. (The [writing][1] section of this site is set up as a blog.) This didn't go as well as I hoped. 

The first problem was the blog extension's multiple blog support had some gaps in it. Most glaringly, it didn't support pagination on index pages for any blog other than the first blog configured. So I forked the project and found a way to [fix the problem][2]. 

The second problem was image size. Most of the source images are over 3 megabytes in size. With the addition of thumbnails, the size of the build ballooned from a few megabytes to half a gigabyte and took 15 minutes to generate. To fix the problem, I reduced all of the images to 2048 pixels wide and only did a small 400 pixel wide thumbnail. This got the build to an acceptable size, under 100 megabytes and less than a minute to build.

From there, all I needed to do was fill it with some the better photos of [landscapes][4], [family][5], [friends][6], and the odd bit of [Wisconsin weather][7] I've taken in the last 6 years.

[0]: /pages/recommended-reading/
[1]: /writing/
[2]: https://github.com/epochwolf/middleman-blog/commit/af666ad0dfeb8e3fbcfc42666836893e4265127a
[3]: http://amzn.to/1cZ6mYv
[4]: /photos/tags/landscapes/
[5]: /photos/tags/family/
[6]: /photos/tags/friends/ 
[7]: /photos/winter-in-wisconsin-2/