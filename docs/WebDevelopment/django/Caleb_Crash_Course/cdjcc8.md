---
title: Working With Real Data - Caleb Django Crash Course
tags:
    - django
---
- Change views.py to use data from database rather than mock data
- Have to import the Movie class from model.py
``` python
from django.http import HttpResponse
from django.shortcuts import render

# Have to import the Movie class from model.py
from .models import Movie

# 3 parameters for render - request, template name / location, data dictionary
def movies(request):
    # Get all the objects from the database
    data = Movie.objects.all()
    # Have to convert the queryset data to a dictionary which he called movies
    return render(request, "movies/movies.html", {"movies": data})

def home(request):
    return HttpResponse("Home Page")

```
