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



