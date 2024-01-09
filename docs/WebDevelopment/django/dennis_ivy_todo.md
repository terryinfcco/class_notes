##  Dennis Ivy Django ToDo List 
### March 12, 2021 - YouTube

My intention is that this be a list of the steps and that the detail will be in the program files (hopefully well commented) in this Django project. 

### Setup Process

* Created dennisivy/todo directory
* Go to that directory

```
	cd /home/terrystudent/todo
```

* Created virtual environment called .venv (so it's hidden)
* Activated virtual environment .venv
* Install django:

```
	python -m pip install django
```

* He's on 3.0.2 and I just installed 4.0.6
* Create the project:

```
	django-admin startproject todo_list
```

* Create the app

```
	python manage.py startapp base
```

### First Steps

* Connect the app and project together - see comment and code in dennisivy/todo/todo_list/settings.py
* Create a urls.py file in the app dennisivy/todo/base/urls.py
* 
