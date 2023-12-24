---
title: Models and Databases
tags:
    - django
    - caleb
    - dj_models
---
## Models and Databases
- Run this to do the built in database stuff. 
- Also now the admin page will work
- `python manage.py migrate` 
- `python manage.py createsuperuser`
- just used terry/jacqui
- Django uses ORM - Object Relational Mappers
- Meaning you write Python stuff and it gets converted to SQL stuff
- Makes converting from a test db like sqlite3 to mariadb or postgres much easier

## Create First Model
- create models.py inside movies
``` python
from django.db import models

# Django automatically creates an id field unique to each row in the table
class Movie(models.Model):
    title = models.CharField(max_length=200)
    year = models.IntegerField()
```
- Now tell django that we need to create / update our model
- movies in this case is the name of the app in settings.py/INSTALLED_APPS
`python manage.py makemigrations movies`
- Now migrate the changes - if you're working with multiple apps you can specify an app like in makemigrations
`python manage.py migrate`

## Add the New Model to the Admin Section
- Create movies/admin.py
``` python
# Import our Model and the Django Admin Stuff

from .models import Movie
from django.contrib import admin

# Now register the model with the admin site
admin.site.register(Movie)
```
- Now you can add movies on the admin site. But right now the admin page just shows Movie object(1)
- To get the title to show we need to add a method to our class in models.py
``` python
    def __str__(self):
        return f"{self.title} from {self.year}"
```