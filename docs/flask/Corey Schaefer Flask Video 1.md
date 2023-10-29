---
title: Corey Schaefer Flask Video Series 1
tags:
    - flask
    - coreyschaefer
    - flask_start
---

## Corey Schaefer Flask Video 1 From 2019

The series will create  a blog with multiple users, profile pictures, and the ability to create, update and delete posts. The same site built in Django is also available. I’m pretty sure that Flask is easier, but there are a lot more examples and videos for Django.

## Setup Folders, and Environment

- Created online and cloned github/csflask
* Create virtual environment “flaskblog’
- Activate venv flaskblog
* pip install Flask
- add flaskblog/ to .gitignore
* mkdir Flask_Blog

## First Program demonstrating routes

Create flaskblog.py in Flask_Blog

``` python
from flask import Flask #  import Flask class

app = Flask(__name__) # helps Flask find templates static files

@app.route("/") #  oreate home page route
def hello():
    return 'Hello World!'
```

``` bash
cd Flask_Blog
export FLASK_APP=flaskblog.py
Flask run # 1270.0.0.1:5000
```

To show use of html change return to `“<h1>Hello World</h1>"`and had to stop and start server. To fix that `export FLASK_DEBUG = 1`

To avoid export of environment variables at bottom of flaskblog.py add:

``` python
if __name__ == '__main__':
    app.run(debug=True)

```

Then just run python3 flaskblog.py.

There are debug advantages to the environment variable process.

Add an about page by adding another decorator and another function.

```python
@app.route("/about")
def about():
    return "<h1>About Page</h1>"

```

You can have multiple decorators for one function. So here both terryinfcco.com/ and terryinfcco.com/home would both go to the home page.

``` python
@app.route("/")
@app.route("/home")
def home():
    return "<h1>Home Page</h1>"

```
