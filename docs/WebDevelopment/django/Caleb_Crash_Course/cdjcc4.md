---
title: First View - Caleb Django Crash Course
tags:
    - django
---

## First View
- Note that the admin site already exists.
- `python manage.py runserver` runs a local django server on port 8000
- In movies/movies/urls.py add to urlpatterns list
``` python
from django.contrib import admin
from django.urls import path
from movies import views # new

urlpatterns = [
    path('admin/', admin.site.urls),
    path('movies/', views.movies), # new
    path('', views.home), # new 
]
```
- Create views.py in movies
``` python
from django.http import HttpResponse

def movies(request):
    return HttpResponse("Hello There")
def home(request):
    return HttpResponse("Home Page")
```
- at localhost:8000/movies/ should see Hello There
