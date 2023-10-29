---
title: Corey Schaefer Flask Video Series 2
tags:
    - flask
    - coreyschaefer
    - flasktemplates
---
## Corey Schaefer Flask Video 2 From 2019

### Learn to use templates and pass variables to web pages

#### Using templates

Flask expects the html templates in a specific place so create a folder called templates in Flask_Blog

Then create about.html and home.html - just using the emmet ! in vscode and then adding header 1 to the body.

  ``` html
  <body>
      <h1>Home Page</h1>
  </body>
  ```

  ``` html
  <body>
      <h1>About Page</h1>
  </body>
  ```
Then you have to import render_template and change the return statements in the home and about functions to `return render_template('home.html')` and the same for the about function.

``` python
from flask import Flask, render_template # import Flask class

app = Flask(__name__) # helps Flask find templates static files

# You can have multiple decorators for one function so both / and /home go to the same page
@app.route("/home")
@app.route("/") # oreate home page route
def hello():
	return render_template('home.html')

@app.route("/about")
def about():
	return render_template('about.html')

if __name__ == '__main__':
	app.run(debug=True)
```

If all you wanted to use Flask for was serving static pages you'd be done. More detailed HTML pages and some CSS and you're done.

### Passing Data to HTML template

He created a list of dictionaries at the top of the flaskblog.py file. In each dictionary were author, title, content, and date_posted fields. He called the list posts and then added `, posts = posts)` to the return statement in the home function. The first posts is the variable that's being passed to the html template and the second posts is the list of dictionaries that he created.

``` python
from flask import Flask, render_template # import Flask class

app = Flask(__name__) # helps Flask find templates static files

# List of dictionaries - dummy data
posts = [
	{
		'author': 'Terry Dutcher',
		'title': 'Blog Post 1',
		'content': 'First Post content',
		'date_posted': 'April 20, 2018'
	},
	{
		'author': 'Jacqui Ward',
		'title': 'Blog Post 2',
		'content': 'Second Post content',
		'date_posted': 'April 21, 2018'
	}
]

# You can have multiple decorators for one function so both / and /home go to the same page
@app.route("/home")
@app.route("/") # oreate home page route
def hello():
	return render_template('home.html', posts=posts)

@app.route("/about")
def about():
	return render_template('about.html')

if __name__ == '__main__':
	app.run(debug=True)
```

Now to change home.html so it can use the data we're passing, we add code blocks. Code blocks in Jinja2 (the templating engine that Flask uses) are surrounded by opening curly brace, percent sign, percent sign, closing curly brace. In this example he does a for loop. Code blocks have to be closed, using in this case the endfor statement. 

Printing a variable you need to use double curly braces `{{ variable }}`. And dot notation works so to print the title he uses post.title.

``` python
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
</head>

<body>
    <h1>Home Page</h1>
    <!-- Jinja2 loop to go through posts passed from flaskblog.py -->
    {% for post in posts %}
    <h1>{{ post.title }}</h1>
    <p>By {{ post.author }} on {{ post.date_posted }}</p>
    <p> {{ post.content }} </p>
    {% endfor %}
</body>

</html>
```

Jinja2 also supports if else logic. So in the head section he adds logic to look for a page title and use that instead of the default if we pass in a title. He did that in both the home and about templates. Then he passed a title to the about template but not to the home template.

``` python
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    {% if title %}
    <title>Flask Blog - {{ title }}</title>
    {% else %}
    <title>Flask Blog</title>
    {% endif %}
</head>

<body>
    <h1>About Page</h1>
</body>

</html>
```
### Including Blocks in our Templates - Template Inheritance

He creates a layout.html template and puts all of the common sections (like the head section with the if else title code) into layout.html and then includes that in home.html and about.html. Then there are block sections in layout.html for the unique parts of each page. In about.html and home.html he now surrounds the unique part of the html (all in the body in this case) with block tags. Then at the top of each template is an extends tag to refer to the layout.html template.

To show the power of this he adds bootstrap links to the layout.html file and is now able to use bootstrap specific classes in the templates. At this point he grabs some html from a snippets folder to add a navbar to the layout.html template. Then he creates a static folder in the Flask_Blog project and adds a main.css file to the static folder. Finally he adds a link to the stylesheet using the url_for function. He recommends using url_for for as many links as possible. 

This was all done really fast and was hard to follow, but it's just html, css and bootstrap and has nothing to do with flask, so if you want more you'd have to study those three in more detail.  
