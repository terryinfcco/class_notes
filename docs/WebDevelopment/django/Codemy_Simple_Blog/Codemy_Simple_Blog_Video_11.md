---
title: Codemy Django Simple Blog Series 11
tags:
    - django
---

## Youtube 37 Video Course
### Escape HTML for Blog Posts
#### Length 07:39


So my plan is to watch the video and take notes - not code but flow, bash instructions, etc. Then go back through the same video and write the code. I'm capturing more code in these notes and I think it's working well.

- By default Django gets rid of html formatting, so no matter how you format your input, it just all gets smushed together.
- So at the bottom of article_detail.html in the body variable `{{ post.body|safe }}`
- Then you can include html in your blog post bodies. Like Headers, paragraphs, lists, etc. 
- Add `|safe` after the slice on the snippet we're showing on the home page. Not a great way to do snippets, so he said we'll probably add a separate snippet field at some point. 
