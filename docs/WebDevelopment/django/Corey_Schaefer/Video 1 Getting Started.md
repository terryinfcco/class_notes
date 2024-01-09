---
title: Corey Schaefer Django Video Series 01
tags:
    - django
---

#### Length 15:32

## Summary
- Overview of the application that's being built
- Installation of Django
- Creation of new project, and overview of the folders and files created by Django
- Running the default server

## Notes

- Building a blog style application
	- Authentication System
	- Multiple Users
	- Profile including a profile picture
	- Can update and delete owned posts
	- Can view posts by others
	- Source code available
- Install Packages Needed
	- Use a virtual environment
	- Install django  - Installed version 2.1
``` bash
pip install django
```
	- Use at least python 3.7
- Create a new project
``` bash
django-admin startproject django_project
```
		- django_project folder now contains folder django_project (yup - 2 folders with the same name), and program manage.py
		- in sub folder django_project: 
			- `__init__.py` empty file that tells python this is a python package
			- settings.py - 
				- SECRET_KEY - Adds security to Django
				- DEBUG = True
				- INSTALLED_APPS
			- urls.py -
				- path admin already setup 
			- wsgi.py - used to communicate with web server
- See the default site 
``` bash 
python manage.py runserver
# To run on a different port
python manage.py runserver 7000
```
	- Warnings about migrations
	- Site at localhost:8000 or 127.0.0.1:8000
	- Can got to localhost:8000/admin for admin screen. No way to login yet.




