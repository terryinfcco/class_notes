# Chapter 1 Initial Setup
## Build websites with Python & Django
### William S. Vincent

#### Create a folder where we're going to build our first project.

```
mkdir code			# Create a directory for our projects
cd code				# Change to that directory
mkdir ch1-setup		# Make a subdirectory for Chapter 1
cd ch1-setup		# Change to that subdirectory
```

#### To create a virtual environment within this new directory use the format:

```
python3 -m venv <name_of_env> # This creates a venv
```

It is up to the developer to choose a proper environment name but a common choice is to call it .venv. That hides the venv and is therefore one less piece of clutter on screens.

#### Activate the virtual environment
```
 source .venv/bin/activate
 
```

The shell prompt now has the environment name (.venv) prefixed which indicates that the virtual environment is active. Any Python packages installed or updated within this location will
be confined to the active virtual environment. To deactivate and leave a virtual environment type ```deactivate```.

#### Install Django
```
python -m pip install django~=4.0.0
```
The comparison operator ∼= ensures that subsequent security updates for Django, such as 4.0.1, 4.0.2, and so on are automatically installed. Note that while it is possible to use the shorter version of pip install <package>, it is a best practice to use the longer but more explicit form of python -m pip install <package> to ensure that the correct version of Python is used. This can be an issue if you have multiple versions of Python installed on your computer.

#### First Django Project

A Django project can have almost any name but we will use django_project in this book. 
```
(.venv) > django-admin startproject django_project .
```

It’s worth pausing here to explain why you should add a period (.) to the end of the previous command. If you don't include the period, Django creates another django_project directory. This feels redundant to me which is why I prefer adding a period to the end which installs Django in the current directory.

#### Runserver to test installation

Now let’s confirm everything is working by running Django’s internal web server via the runserver command. This is suitable for local development purposes, but when it comes time to deploy our project’s online we will switch to a more robust WSGI server like Gunicorn.

```
python manage.py runserver
```

#### Code Editor and Git

Make sure you have a code editor and git installed. He recommends both the microsoft python extension for vscode and an extension called black which formats python code. 
