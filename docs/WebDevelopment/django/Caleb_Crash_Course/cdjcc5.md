---
title: Using Templates - Caleb Django Crash Course
tags:
    - django
---
## Using Templates
- Modify views.py
``` python
from django.http import HttpResponse
from django.shortcuts import render

# 3 parameters for render - request, template name / location, data dictionary
def movies(request):
    return render(request, "movies/movies.html", {"movies": ["movie1", "movie2"]})

def home(request):
    return HttpResponse("Home Page")
```
- create folder movies/templates/movies
- create file movies.html in movies/templates/movies
``` html
<!-- Refers to the dictionary in views.py which we called movies -->

{{ movies }}
```
- in movies/settings.py add movies to installed apps so that django can find the template
- Now see `['movie1', 'movie2']` at movies/
- Easier to understand maybe with dictionary created separately
``` python
from django.http import HttpResponse
from django.shortcuts import render

data = {"movies": ["movie1", "movie2"]}

# 3 parameters for render - request, template name / location, data dictionary
def movies(request):
    #   return render(request, "movies/movies.html", {"movies": ["movie1", "movie2"]})
    return render(request, "movies/movies.html", data)

def home(request):
    return HttpResponse("Home Page")

```
