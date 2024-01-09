- Create a folder called: First-Django-Project
- Create Virtual Environment called: venv:  `python3 -m venv venv`
- Activate venv: `source venv/bin/activate`
- Install Django - pip install django
	- other pip commands: pip uninstall, pip list, pip freeze (save to file - pip freeze > requirements.txt)
- Create requirements.txt: `pip freeze > requirements.txt`
- Start the project
``` bash
# The . at the end is to keep the directory structure simpler
django-admin startproject core .
```
- Run the server to make sure things worked OK
``` bash
python manage.py runserver
```

# veryacademy
Django Initiation part of the Very Academy Udemy Course

### Set up a virtual environment, installed django, created a project and ran the server to see that it all worked
``` bash
python -m venv venv
source venv/bin/activate
pip install django
django-admin startproject core .
python manage.py runserver

```
### Now create an app for our project called newapp
``` bash
./manage.py startapp newapp
```
- Some tutorials will put the apps inside the project directory /core/newapp, but that's not his preference
``` bash
mkdir ./core/newapp
./manage.py startapp newapp ./core/newapp
```
- Generally apps used to make project easier to manage by creating components

### Registering a Django App
- Need to add our app to the INSTALLED_APPS list in core/settings.py
``` python
"newapp",
```

### More About the Django Development Server
- `./manage.py runserver 8080` is how you change to a different port

### Django Request-Response Cycle
- browser sends request to server, then server grabs url (/about, /help, etc.)
- url then points at a view which grabs a template, static files and stuff from the database to build web page
- web page then gets sent back to the user
- admin page is pre built by Django, but have to `./manage.py migrate` to get it to work
- admin page is at `localhost:8000/admin`

### URL Pattern - Create a urls file in the app and connect it to the project
- Notice on the urls the / goes at the end not the beginning
- Create urls.py in newapp directory
- In project urls.py add `,include` to `from django.urls import path`
- In project urls.py add the app urls file to urlpatterns list
``` python
path("", include('newapp.urls'))
```
- Edit the app urls.py file and create a url for the index page of the website
``` python
from django.urls import path
from . import views

urlpatterns = [
    path("", views.home)
]
```
### Create a view
- Now in the views.py file in the app directory 
``` python
from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.
# Using function based views here

def home(request):
    return HttpResponse("Hello World")

```
### Create an HTML Template
- Use template instead of typing html directly into the home view
- Create a folder called templates in the app folder.
- Create index.html inside the templates folder
- I just used emmet for an html template and added an h1 saying Hello World

### Connect the template to a view
- In views.py in the app folder return a template rather than html
- `return render(request, 'index.html')`

### Django Application from a requirements.txt file
- `requirements.txt` contains what the project needs
- To install from a requirements.txt file
``` bash
python -m venv venv
source venv/bin/activate
pip -r requirements.txt
./manage.py migrate
``` 
- To create `pip freeze > requirements.txt`

