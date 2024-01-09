---
title: Codemy Django Simple Blog Series 03
tags:
    - django
---

## Youtube 37 Video Course

#### Length 19:50

So my plan is to watch the video and take notes - not code but flow, bash instructions, etc. Then go back through the same video and write the code.

## Summary

- Work with django's version of jinja2 to create a base.html file and use that as the basis for both home.html and article_detail.html
- Redo article_detail.html and home.html so that they only contain stuff unique to their particular web pages and use base.html for the rest

## Style the blog using Bootstrap

- Grabs version 4.4 starting template
- Create base.html in templates and paste the starting Bootstrap template into it
- In body of base.html before the javascript tags, add `{% block content %} and {% endblock %}`. This is where code for the individual web pages will go.
- In home.html first add `{% extends 'base.html' %}`, then add same tags as base.html - block content and endblock at top and bottom of the template.
- Check to see that bootstrap is working by making sure font, etc of home page is different.
- In base.html wrap block, endblock tags in a div with a class of container, and add a line break before the div.
- Make same changes as home.html in article_detail.html
- Uses button bootstrap classes to turn back link to a button.
- Grabs navbar from getbootstrap.com and pastes it after body tag in base.html. Changes navbar-light and bg-light to dark.
- Makes more changes to the navbar. Changes links, deletes search box, dropdown box. 
- Uses block title tags to make title changeable in the template. So what's in base.html is the default title, but if we put block title tags with a different title in the webpage template, django will use that.
- Then he adds a title_tag to the database so the blogger can specify the title. Gives the field a default so the blogger doesn't have to specify unless they  want to. Have to do makemigrations, migrate. Change templates to pick up title_tag.

- base.html at end of video
``` html
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>{% block title %}My Freakin' Awesome Blog{% endblock %}</title>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="{% url 'home' %}" >My Freakin' Awesome Blog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
    </nav>
    <br>
    <div class="container">
        {% block content %}

        {% endblock %}
    </div>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    -->
  </body>
</html>

```
- home.html at the end of the video
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
- article_detail.html at the end of the video
``` html
{% extends 'base.html' %}
{% block title %} {{post.title_tag}} {% endblock %}

{% block content %}

<h1>{{ post.title }}</h1>
<small>By: {{ post.author.first_name }} {{ post.author.last_name }}</small>
<hr>
<br>
{{ post.body }}

<br><br>
<a href="{% url 'home' %}" class="btn btn-secondary">Back</a>

{% endblock %}
```
