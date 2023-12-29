---
title: Codemy Django Simple Blog Series 1
tags:
    - django
    - codemy
    - django_start
---
## Youtube 37 Video Course

#### Length 18:10 

## Summary

- Set up both the project and an app
- Create the post model and register it.

## Install Django

- Make directory called simpleblog
- Create a virtual environment called venv in simpleblog 
- Activate virtual environment
- Install DJango using pip - he got django 3.0.5. I'm on 5.0 - this should be fun

## Create Django Project

- Create Django project called ablog 
``` bash
django-admin startproject ablog
```
- In the ablog directory to get rid of error messages and set up admin route. Then run the server to see the default site and make sure the install went OK. localhost:8000 is the default.
``` bash
python manage.py migrate
python manage.py runserver
```  

## Create Administrative User

To create the administrative user. Used admin for name, and put in an email and password. I used my hotmail email and password jacqui.
``` bash 
python manage.py createsuperuser
```

- `python manage.py runserver` and go to localhost:8000/admin and login, then click on the admin user and put in actual first and last name.

## Create Django App

- to create the app under the project.
``` bash
python manage.py startapp theblog
``` 

## Connect App and Project

- open the top ablog folder in your text editor
- Then in ablog/ablog/settings.py add theblog to the INSTALLED_APPS list.
``` python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'theblog',
]
```

## Create App Level URLS file

- In ablog/ablog/urls.py add include to the second import statement, and import include and add theblog/urls.py to the urlpatterns list. This gives our app its own urls.py file.
``` python
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('theblog.urls')),
]
```
- Now create ablog/theblog/urls.py and put a home page view in it. Also import the views.py file from ablog/theblog.
``` python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name="home"),
]
```

## Create First View Using an HTML Template

- In theblog/views.py create a function to define the home page.
``` python
from django.shortcuts import render

# Create your views here.
def home(request):
    return render(request, 'home.html', {})
```
- in ablog/theblog create a templates folder and put home.html in it.
``` html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Hello World</h1>
</body>
</html>
```
- `python manage.py runserver` to ensure that our new home page shows up at localhost:8000

## Build the Model 

- In ablog/theblog/models.py import the User so we can use our admin user, and create our data model and its fields. This is a class based model.
``` python
from django.db import models
from django.contrib.auth.models import User 

# Create your models here.
class Post(models.Model):
    title = models.CharField(max_length=255)
    # the on_delete will delete all the users blog posts if the user gets deleted.
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    body = models.TextField()

    def __str__(self):
        return self.title + ' | ' + str(self.author)


```
- Fields are title, author (set up so if author is deleted, all the associated blog posts go away), and body.
- And create a function `__str__`  function to show the title and the author on the admin page.

## Connect the Model to the App

- in ablog/theblog/admin.py import and register the Post class.
``` python
from django.contrib import admin
from .models import Post

# Register your models here.
admin.site.register(Post)
```

## Create the Database

- makemigrations and migrate to get the new database to work.
``` bash
python manage.py makemigrations
python manage.py migrate
python manage.py runserver
```

## Populate the Database

- Then added two blog posts using the admin page.
