# Caleb Curry Django Crash Course


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
## Models and Databases
- Run this to do the built in database stuff. 
- Also now the admin page will work
- `python manage.py migrate` 
- `python manage.py createsuperuser`
- just used terry/jacqui
