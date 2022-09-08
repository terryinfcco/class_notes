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

This is a separate block from block content and isn't nested.

Then in base.html:

```django
<title>{% block title %}Hello, world! {% endblock %}</title>
```

What happens is if the page we're displaying has a block named title, that name will be used, so in the above example the about page will show About John Elder. However on a page that doesn't have a block named title we'll see Hello, world! (like on our home page since we haven't added a block title to it).

## Add a Navbar

Grabs the navbar example at the top of the Bootstrap 4.1 Components navbar page and pastes it into base.html right below the opening body tag. 

At the opening nav tag, he changed navbar-light to navbar-dark and bg-light to bg-dark. 

Again in base.html, he wraps the block content and endblock statements in a div with the class of container, and adds a line break above the div that he just added.

Then clean up the navbar. Delete the form that's a search box. Deletes the dropdown menu. Deletes the disabled link, and the home link. Change the label that says Navbar to John Elder.

Then change the navbar links to Django style:

```django
          <li class="nav-item">
            <a class="nav-link" href="{% url 'home' %}">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="{% url 'about' %}">About</a>
          </li>
```

