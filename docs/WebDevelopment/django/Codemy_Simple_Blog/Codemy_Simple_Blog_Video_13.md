---
title: Codemy Django Simple Blog Series 13
tags:
    - django
---

## Youtube 37 Video Course
### Blog Category Pages
#### Length 16:12

- Wants to be able to click on a category next to the post title on the home page and go to a page that shows all the posts that share that category.
- Going to use function based views for this instead of class based views. Points out that you can have both kinds of views in views.py
- In theblog/urls.py add to pattens: `path('category/<str:cats>/', CategoryView, name='category'`
- Also in theblog/urls.py add CategoryView to the from .views import statement
- Add a function to views.py - he put it after HomeView
``` python
def CategoryView(request, cats):
	# Create a query
	category_posts = Post.objects.filter(category=cats)
	return render(request, 'categories.html', {'cats':cats.title(), 'category_posts':category_posts})
```
- Create categories.html in theblog/templates
- Paste contents of home.html into categories.html 
- Change the h1 to {{ cats }}
- Change to for loop to `{% for post in category_posts %}`
- Remove post.category line because it's redundant
- Ahead of the h1 `{% if category_posts %}`, then after closing ul `{% else %} <h2>Sorry This Page Does Not Exist</h2> {% endif %} ` (all on separate lines.)
- In home.html change the post.category line to `- <a href="{% url 'category' post.category %}">{{ post.category }}</a>`
