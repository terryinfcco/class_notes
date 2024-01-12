---
title: Codemy Django Simple Blog Series 02
tags:
    - django
---

## Youtube 37 Video Course

#### Length 19:46

## Summary

- Create a home page that loops through the posts in the model and shows the title as a link
- Create an article detail page that shows the post that was clicked on the home page.

## Blog post links on home page

- In the app's views.py file (ablog/theblog/views.py) import ListView and DetailView - generic list and detail forms included with Django.
- In the app's views.py file (ablog/theblog/views.py) we have to import our Post model.
- Change home view in ablog/theblog/views.py to a class based view.
- Pass the ListView to the HomeView class
- Then tell the class that the model we are using is Post (our only model)
- Then `template_name = 'home.html'` tells the class what template to use.
- Pretty much same process for the Article's Detail View class.

``` python
from django.shortcuts import render
# Import Django's generic listview and detailview
from django.views.generic import ListView, DetailView
# Have to import our model so the views can find it
from .models import Post

# Create your views here.

# def home(request):
#     return render(request, 'home.html', {})

class HomeView(ListView):
    model = Post
    template_name = 'home.html'

class ArticleDetailView(DetailView):
    model = Post
    template_name = 'article_details.html'
```

- In template home.html a for loop to loop through the object_list which seems to get passed automatically.
- Show the items in an unordered list.
``` html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Articles</title>
</head>
<body>
    <h1>Post</h1>
    <!-- for loop to get all the posts -->
    <!-- object_list is the query set from ListView -->
    <ul>
    {% for post in object_list %}
        <li><a href="{% url 'article-detail' post.pk %}">{{ post.title }}</a> - {{ post.author.first_name }} {{ post.author.last_name }} <br>
        {{ post.body }}</li>
    {% endfor %}
    </ul>
</body>
</html>
```
- Anything in the model can be used in the template. e.g. email.
- The url patterns also changes to a class, have to import HomeView from .views
``` python
from django.urls import path
from .views import HomeView
path('', HomeView.as_view(), name="home"),
```

## Detail Views

- Create article_details.html in templates.
- New class in ablog/theblog/views.py ArticleDetailView - pass it DetailView - see earlier.
- In urls.py import the ArticleDetailView and locate the entry in article/primary_key, name article-detail. 
``` python
from django.urls import path
from .views import HomeView, ArticleDetailView
path('', HomeView.as_view(), name="home"),
path('article/<int:pk>', ArticleDetailView.as_view(), name="article-detail")

``` html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Articles</title>
</head>
<body>
    <h1>Post</h1>
    <!-- for loop to get all the posts -->
    <!-- object_list is the query set from ListView -->
    <ul>
    {% for post in object_list %}
        <li><a href="{% url 'article-detail' post.pk %}">{{ post.title }}</a> - {{ post.author.first_name }} {{ post.author.last_name }} <br>
        {{ post.body }}</li>
    {% endfor %}
    </ul>
</body>
</html>
```
