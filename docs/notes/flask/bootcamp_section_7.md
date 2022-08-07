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

String passed in the decorator determines the URL extension that will link to the function that directly follows the decorator.



## Summary



## Category
