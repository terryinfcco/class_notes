# Flask Tutorial for Beginners - Clever Programmer Youtube

### Section 1 Very Basic Flask App

* Micro Framework - lightweight and bare bones
* Created directory called Flask App
* After creating a virtual environment called venv: `pip install flask` to install Flask
* `flask --version` to make sure Flask is installed. He was on 1.1.1  and Python 2.7. So fairly old. We'll see if that messes me up.
* Create new file `app.py`

``` Python
from flask import Flask

app = Flask(__name__)

@app.route('/')   # Set up the root page of the website
# Could put multiple routes for one function so:
@app.rount('/home')
def hello():
    return "Hello World"

if __name__ == "__main__":  # only true if running from command line on localhost
    app.run(debug=True)
    
```

* To run `python app.py` and should run at localhost:5000


### Section 2


