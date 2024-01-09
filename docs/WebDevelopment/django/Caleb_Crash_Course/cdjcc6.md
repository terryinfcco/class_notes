---
title: More Complicated Data - Caleb Django Crash Course
tags:
    - django
---

## More complicated data
- made movies a dictionary with a list of dictionaries inside and each 
- entry having an id, title, and year
- Then a for loop using django templating language to show the movie titles.
``` python
# Views.py at this point
from django.http import HttpResponse
from django.shortcuts import render

data = {
    "movies": [
        {"id": 5, "title": "Jaws", "year": 1969},
        {"id": 6, "title": "Sharknado", "year": 2000},
        {"id": 7, "title": "The Meg", "year": 2000},
    ]
}

# 3 parameters for render - request, template name / location, data dictionary
def movies(request):
    #   return render(request, "movies/movies.html", {"movies": ["movie1", "movie2"]})
    return render(request, "movies/movies.html", data)

def home(request):
    return HttpResponse("Home Page")

```
``` html
<!-- movies.html at this point -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movies Caleb Django Crash Course</title>
</head>
<body>
    <h1>Movies</h1>
    <!-- Refers to the dictionary in views.py which we called movies -->
    <ul>
    {% for movie in movies %}
        <li>{{ movie.title }}</li>
    {% endfor %}
    </ul>
</body>
</html>
```
