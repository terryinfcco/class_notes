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
- In the app's views.py file (ablog/theblog/views.py) we have to import our  Post model.
- Change home view in ablog/theblog/views.py to a class based view.
- Pass the ListView to the HomeView class
- Then tell the class that the model we are using is Post (our only model)
- Then `template_name = 'home.html'` tells the class what template to use.
- Pretty much same process for the Article's Detail View class.
``` python
from django.shortcuts import render
# import some of Django's generic views. 
from django.views.generic import ListView, DetailView
from .models import Post

# Create your views here.
# def home(request):
#     return render(request, 'home.html', {})

# Going to use class based views.
# Inherit the built in Django form ListView to be able to create a list of posts
class HomeView(ListView):
    # Tell Django what model we're using
    model = Post
    template_name = 'home.html'

# Inherit the built in Django form DetailView to allow us to see a post's detail
class ArticleDetailView(DetailView):
    model = Post
    template_name = 'article_detail.html'


```
- In template home.html a for loop to loop through the object_list which seems to get passed automatically.
- Show the items in an unordered list.
``` html
{% extends 'base.html' %}

{% block content %}

<h1>Post</h1>
<!-- Do a Django for loop to go through the posts -->
<!-- object_list is the query set automatically created by Django -->
<ul>
    {% for post in object_list %}
        <li><a href="{% url 'article-detail' post.pk %}">{{ post.title }}</a> - {{ post.author.first_name }} {{ post.author.last_name }} <br>
        {{ post.body }}</li>
    {% endfor %}
</ul>

{% endblock %}
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
```
- In home.html put a tags around the post title and use a django link to article-detail (name of the url ) followed by post.pk for primary key. See earlier.
- In article_details.html use post.title in h1 for page header, then name of author, then post.body and a button to go back to the home page.
``` html
<h1>{{ post.title }}</h1>
<small>By: {{ post.author.first_name}}{{ post.author.last_name}}</small><br>
<hr>
<br>
{{ post.body }}
<br><br>
<a href="{% url 'home' %}">Back</a>
```
