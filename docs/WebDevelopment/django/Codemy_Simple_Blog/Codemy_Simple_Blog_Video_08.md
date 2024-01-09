---
title: Codemy Django Simple Blog Series 08
tags:
    - django
---

## Youtube 37 Video Course
### Order Blog Posts by Date
#### Length 13:34

So my plan is to watch the video and take notes - not code but flow, bash instructions, etc. Then go back through the same video and write the code.

- Primary key is automatically created by django when you create a database
- Add a date field to our model after body in the Post class. 
- Import standard python date classes.
- auto_now_add=True adds the current date when we create a post
``` python
from datetime import datetime, date
post_date = models.DateField(auto_now_add=True)
```
- Now `python manage.py makemigrations` but you'll get an error that something is needed for existing items that don't have a date. He picked the one-off default option and the default date of timezone.now.
- Then `python manage.py migrate`
- In article_details.html after post.author.last_name `- {{ post.post_date }} - `
- He did the same on the home.html template to show the date after the first name.
- In views.py class HomeView(Listview) add `ordering = ['-post_date']` which sorts by post_date in reverse date - latest first.
- 
