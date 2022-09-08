# 02-These Are Steps to Add an App to a Django Project

## Create the App

An app is one section of a large website, but this project has only one app.

```
python manage.py startapp pages
# Creates code/djangoproject/pages
```

## Add the App to the Project

In code/djangoproject/mysite/settings.py add 'pages', to INSTALLED_APPS list.

## Add urls.py at app level

It's cleaner to keep urls separated by app. So in code/djangoproject/pages create urls.py. Then set up a skeleton in the new urls.py

``` python
from django.urls import path
urlpatterns = []
```

## Create the Views
Every web page created in our app has to have a view so in pages/views.py:

``` python
from django.shortcuts import render
def home(request):
	return render(request, "home.html", {})
def about(request):
	return render(request, "about.html", {})
```
In each function, request is required, the html files are the names of the templates we're going to use. {} is a dictionary that we can use to pass data to the template

## Add Templates
Add a subdirectory in pages called templates. Create home.html and about.html and add a header in each page. HOME PAGE and ABOUT PAGE.

## Add the views to pages/urls.py

``` Python
# import the views.py file so we can connect them to urls.
from . import views
# Then in usrpatterns list add a url for each view
path ('', views.home, name='home'),
path ('about/', views.about, name='about'),
# First is the page name that follows localhost:8000,
# Then the name of the function in views.py that we're attaching to that url,
# Then a name we can use for linking to this page.
```

## Link App urls.py to Project urls.py
So in project urls.py 

```
from django.urls import path, include
# then add to urlpatterns list
path('', include('pages.urls)),
```
