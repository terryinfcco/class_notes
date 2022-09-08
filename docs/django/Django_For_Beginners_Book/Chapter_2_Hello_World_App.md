# Django for Beginners
## Build websites with Python & Django
### William S. Vincent

## Chapter 2: Hello World App

In this chapter we will build a Django project that simply says “Hello, World” on the homepage.
This is the traditional way to start a new programming language or framework. We’ll also work
with Git for the first time and deploy our code to GitHub.

### Initial Setup

```bash
% cd ~/code
% mkdir helloworld
% cd helloworld
```

Create a new virtual environment called .venv, activate it, and install Django with Pip as we did
in the previous chapter.

Now we’ll use the Django startproject command to make a new project called django_project.
Don’t forget to include the period (.) at the end of the command so that it is installed in our
current directory.

```bash
(.venv) > django-admin startproject django_project .
```

Django has added a django_project directory and a manage.py file. Within directory django_project are five new files:
* `__init__.py` indicates that the files in the folder are part of a Python package. Without this file, we cannot import files from another directory which we will be doing a lot of in Django!
* asgi.py allows for an optional Asynchronous Server Gateway Interface to be run
* settings.py controls our Django project’s overall settings
* urls.py tells Django which pages to build in response to a browser or URL request
* wsgi.py stands for Web Server Gateway Interface which helps Django serve our eventual web pages.

The manage.py file is not part of django_project but is used to execute various Django commands such as running the local web server or creating a new app.

Let’s try out our new project by using Django’s lightweight built-in web server for local development purposes. The command we’ll use is runserver which is located in manage.py.

Note that the full command line output will contain additional information including a warning about 18 unapplied migrations. Technically, this warning doesn’t matter at this point. Django is complaining that we have not yet “migrated” our initial database. Since we won’t actually use a database in this chapter the warning won’t affect the end result. However, since warnings are still annoying to see, we can remove it by first stopping the local server with the command Control+c and then running `python manage.py migrate`.

What Django has done here is create a SQLite database and migrated its built-in apps provided for us. This is represented by the new file db.sqlite3 in our directory.

The Django MVT pattern is as follows:
* Model: Manages data and core business logic
* View: Describes which data is sent to the user but not its presentation
* Template: Presents the data as HTML with optional CSS, JavaScript, and Static Assets
* URL Configuration: Regular-expression components configured to a View

When you type in a URL, such as https://djangoproject.com, the first thing that happens within our Django project is a URL pattern (contained in urls.py) is found that matches it. The URL pattern is linked to a single view (contained in views.py) which combines the data from the model (stored in models.py) and the styling from a template (any file ending in .html). The view then returns a HTTP response to the user.

### Create an App

Django uses the concept of projects and apps to keep code clean and readable. A single top-level Django project can contain multiple apps. Each app controls an isolated piece of functionality. For example, an e-commerce site might have one app for user authentication, another app for payments, and a third app to power item listing details. That’s three distinct apps that all live within one top-level project. How and when you split functionality into apps is somewhat subjective, but in general, each app should have a clear function.

```bash
(.venv) % python3 manage.py startapp pages
```

If you look visually at the helloworld directory Django has created within it a new pages directory.

Let’s review what each new pages app file does:

* admin.py is a configuration file for the built-in Django Admin app
* apps.py is a configuration file for the app itself
* migrations/ keeps track of any changes to our models.py file so it stays in sync with our database
* models.py is where we define our database models which Django automatically translates into database tables
* tests.py is for app-specific tests
* views.py is where we handle the request/response logic for our web app

Notice that the model, view, and url from the MVT pattern are present from the beginning. The only thing missing is a template which we’ll add shortly. Even though our new app exists within the Django project, Django doesn’t “know” about it until we explicitly add it to the django_project/settings.py file. Add pages.apps.PagesConfig at the bottom.

```python
# django_project/settings.py
INSTALLED_APPS = [
"django.contrib.admin",
"django.contrib.auth",
"django.contrib.contenttypes",
"django.contrib.sessions",
"django.contrib.messages",
"django.contrib.staticfiles",
"pages.apps.PagesConfig", # new
]
```

What is PagesConfig you might ask? Well, it is the name of the solitary function within the pages/apps.py file at this point.

### Create First View

The next step is therefore to create our first view. Start by updating the views.py file in our pages app to look as follows:

```python
# pages/views.py
from django.http import HttpResponse

def homePageView(request):
	return HttpResponse("Hello, World!")
```

There are two types of views in Django: function-based views (FBVs) and class-based views (CBVs).
Our code in this example is a function-based view: it is relatively simple to implement and explicit.
Django originally started with only FBVs but over time added CBVs which allow for much greater
code reusability, keeps things DRY (Don’t-Repeat-Yourself), and can be extended via mixins. The
additional abstraction of CBVs makes them quite powerful and concise, however it also makes
them harder to read for Django newcomers.

Because web development quickly becomes repetitive Django also comes with a number of built-
in generic class-based views (GCBVs) to handle common use cases such as creating a new object, forms, list views, pagination, and so on. We will be using GCBVs heavily in this book in later
chapters.

There are therefore technically three ways to write a view in Django: function-based views (FBVs),
class-based views (CBVs), and generic class-based views (GCBVs). This customization is helpful
for advanced developers but confusing for newcomers. Many Django developers–including your
author–prefer to use GCBVs when possible and revert to CBVs or FBVs when required. 

We need to configure our URLs. In your text editor, create a new file called urls.py within the pages app. Then update it with the following code:

```python
# pages/urls.py
from django.urls import path
from .views import homePageView

urlpatterns = [
	path("", homePageView, name="home"),
]
```

On the top line we import path from Django to power our URL pattern and on the next line we
import our views. By referring to the views.py file as .views we are telling Django to look within
the current directory for a views.py file and import the view homePageView from there. Our URL pattern has three parts:
* a Python regular expression for the empty string ""
* a reference to the view called homePageView
* an optional named URL pattern22 called "home"

In other words, if the user requests the homepage represented by the empty string "", Django should use the view called homePageView.

The last step is to update our django_project/urls.py file. It’s common to have multiple apps within a single Django project, like pages here, and they each need their own dedicated URL path.

```python
# django_project/urls.py
from django.contrib import admin
from django.urls import path, include
 # new
urlpatterns = [
	path("admin/", admin.site.urls),
	path("", include("pages.urls")), # new
]
```

This need for two separate urls.py files is often confusing to beginners. Think of the top-level
django_project/urls.py as the gateway to various url patterns distinct to each app.

### Git

initialize (or add) Git to our repository. Make sure you’ve stopped the local server with Control+c, then run the command git init.

If you then type git status you’ll see a list of changes since the last Git commit. Since this is our
first commit, this list is all of our changes so far.

Note that our virtual environment .venv is included which is not a best practice. It should be
kept out of Git source control since secret information such as API keys and the like are often
included in it. The solution is to create a new file called .gitignore which tells Git what to
ignore. In this new file, add a single line for .venv.

We do want a record of packages installed in our virtual environment. The current best practice is to create a requirements.txt file with this information. The command `pip freeze` will output the contents of your current virtual environment and by using the > operator we can do all this in one step: output the contents into a new file called requirements.txt.

```bash
(.venv) > pip freeze > requirements.txt
```

We next want to add all recent changes by using the command add -A and then commit the
changes along with a message (-m) describing what has changed.

```bash
(.venv) > git add -A
(.venv) > git commit -m "initial commit"
```

```bash
cd existing_repo
git remote add origin https://gitlab.com/terryinfcco/hello-world.git
git branch -M main
git push -uf origin main

```

Note I added an ssh key to gitlab from the beelink i5 kubuntu 21.10 upgraded to 22.04 build. I couldn't make the ssh work, so I finally did the git push with username and password, deleted all the local stuff and then cloned the hello-world repo using ssh. Now it works.



