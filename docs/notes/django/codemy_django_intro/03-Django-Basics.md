# 03-Django Basics

## Creating Links

You could use regular old html links:

```html
<a href="/">Home</a> | <a href="/about">About</a>
```

But it's more flexible and easier to change later if necessary if we use Django links:

```html
<a href="{% url 'home' %}">Home</a> | <a href="{% url 'about' %}">About</a>
```

The 'home' and 'about' refer to the names in the urlpatterns list in urls.py.  Later if we want to change a path, we don't have to change it on every page, we just have to change the path in urls.py.

## Extends Base File

Sharing common things among web pages. 

* Create a template file called base.html in pages/templates and paste the bootstrap template.

* At beginning of body in base.html put a block where the code that's unique to the various web pages goes. 

  ```django
  {% block content %}
  {% endblock %}
  ```

* Then in each web page put the content of that web page in:

  ```django
  {% extends 'base.html' %}
  
  {% block content %}
  <h1>
      Home Page
  </h1>
  {% endblock %}
  ```

## Block Title

This will allow unique titles on each page of the website (what goes on the tab in the browser)

So in about.html he put:

```django
{% block title %}About John Elder{% endblock %}
```

Then in base.html:

```django
<title>{% block title %}Hello, world! {% endblock %}</title>
```

What happens is if the page we're displaying has a block named title, that name will be used, so in the above example the about page will show About John Elder. However on a page that doesn't have a block named title we'll see Hello, world! (like on our home page since we haven't added a block title to it).
