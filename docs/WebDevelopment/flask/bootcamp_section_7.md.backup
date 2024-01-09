# Flask Bootcamp Jose Section 7

## Flask Basics

### Virtual Environments. 

He uses Anaconda, so I'll just do it my way. Each project can have it's own development environment. He created an enviroment called myflaskenv, activated it, and installed flask. 

### Flask Hello World Site

He created the following program and called it basic.py

``` python
from flask import Flask # import the Flask Class
app = Flask(__name__)   # creates Flask application object. 

@app.route('/') # decorator links page to root route. 
def index(): # defines page named index 
	return '<h1>Hello Puppy!'</h1>
	
if __name__ == '__main__': # Only run if we are running program directly
	app.run()
```

### Basic Routes

String passed in the decorator determines the URL extension that will link to the function that directly follows the decorator. Also known as a view.

``` python
# points to http://localhost:5000/some_page
@app.route("/some_page")
``` 

Add an info page to our application

``` python
from flask import Flask # import the Flask Class
app = Flask(__name__)   # creates Flask application object. 

@app.route('/') # decorator links page to root route. 
def index(): # defines page named index 
	return '<h1>Hello Puppy!'</h1>
	
@app.route('/information') #127.0.0.1:5000/information
def info():
	return "<h1>Puppies are cute!</h1>"
	
if __name__ == '__main__': # Only run if we are running program directly
	app.run()
```

### Dynamic Routing

Example would be when we want a landing page for each user, so after the user logs in, the page could be www.site.com/user/unique_user_name. 

``` python
@app.route('/some_page/<name>')
def other_page(name):
	return 'User: {}'.format(name)
```

Adding to our program

``` python
from flask import Flask # import the Flask Class
app = Flask(__name__)   # creates Flask application object. 

@app.route('/') # decorator links page to root route. 
def index(): # defines page named index 
	return '<h1>Hello Puppy!'</h1>
	
@app.route('/information') #127.0.0.1:5000/information
def info():
	return "<h1>Puppies are cute!</h1>"

# Example of dynamic routing	
@app.route('/puppy/<name>')
def puppy(name):
	return "<h1>This is a page for {}</h1>".format(name)
	
# Example of dynamic routing	and return upper case
@app.route('/puppy/<name>')
def puppy(name):
	return "<h1>Upper Case: {}</h1>".format(name.upper())
	
if __name__ == '__main__': # Only run if we are running program directly
	app.run()
```

### Debug Mode

```
# to get better error messages in the browser. You get a debugger PIN when you
launch the application and can use that to start a python console. 
app.run(debug=True)
```

## Summary



## Category

