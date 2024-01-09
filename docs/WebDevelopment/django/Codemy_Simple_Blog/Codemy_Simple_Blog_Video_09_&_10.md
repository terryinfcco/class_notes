---
title: Codemy Django Simple Blog Series 09 & 10
tags:
    - django
---

## Youtube 37 Video Course
### User Authentication
#### Length 19:13


So my plan is to watch the video and take notes - not code but flow, bash instructions, etc. Then go back through the same video and write the code.

- Using the Django Authentication System
- Create a separate app for this. Make sure virt is active and you're in the directory that contains manage.py
	- `python manage.py startapp members`
- Add the new app to ablog/settings.py after theblog. `'members',`
- create ablog/members/urls.py 
``` python
from django.urls import path

urlpatterns = [
	
]
```
- Add it to ablog/urls.py after theblog. Point it to the django auth urls as well as to members.url.  
``` python
path('members/', include('django.contrib.auth.urls')),
path('members/', include('members.urls')),
```
- Add a templates directory to the members app - `ablog/members/templates`
- Then add a subfolder to templates called registration `ablog/members/templates/registration`
- inside registration create login.html and register.html
- He copied theblog/addpost.html contents to login.html
- Change title to Login, header 1 to Login..., and button text to Login
- He copied members/login.html contents to register.html
- Change title to Register, h1 to Register... and button text to Register.
- Now add to members/views.py:
``` python
from django.views import generic
from django.contrib.auth.forms import UserCreationForm
from django.urls import reverse_lazy

class UserRegisterView(generic.CreateView):
	form_class = UserCreationForm
	template_name = 'registration/register.html'
	success_url = reverse_lazy('login')
```
- Back to members/urls.py
``` python
from .views import UserRegisterView

# In UrlPatterns:
path('register/', UserRegisterView.as_view(), name='register'),
```
- In theblog/templates/base.html copy the list item for Add Post and  change the text to Register and the url to  'register'. Do the same for login and change text to Login and the url to 'login'. Note login is a built in django form so we don't need to create a template. 
- Then at the bottom of ablog/settings.py 
``` python
LOGIN_REDIRECT_URL = 'home'
LOGOUT_REDIRECT_URL = 'home'
```
- You can see new users that get added in the Admin area.

### Video 10 User Authentication Part 2  13:40

- In base.html copy login li block and change url to 'logout' and text to Logout
- Logout is another built in function. So we don't have to do anything else. (We did set up  redirect for logout in settings.py in the previous video)
- There's a built in function called is_authenticated to check if a user is logged in or not. So make a block where the navbar Add Post, etc is in base.html
``` python
{% if user.is_authenticated %}
	# Add Post li block
	# Logout li block
{% else %}
	# Register li block
	# Login li block
{% endif %}
```
- in home.html same kind of thing:
``` python
{% if user.is_authenticated %}
	# move the dash after the date inside this if block
	# update / edit post link
	# delete post link
{% endif %}
```
- And have to do something similar in update_post.html
``` python
{% if user.is_authenticated %}
# Stuff from the h1 to the closing div tag
{% else %}
You are not allowed here! Please login to edit posts
{% endif %}
```
- Need to do also for add_post.html
``` python
{% if user.is_authenticated %}
# Stuff from the h1 to the closing div tag
{% else %}
You are not allowed here! Please login to add posts
{% endif %}
```
- And for delete_post.html
``` python
{% if user.is_authenticated %}
# Stuff from the h1 to the closing div tag
{% else %}
You are not allowed here! Please login to delete posts
{% endif %}
```
- Same thing in article_detail page
``` python
{% if user.is_authenticated %}
# Move the dash after the date here
# Link for update_post
# Link for delete_post
{% endif %}
```
- Separate issue - just show a snippet of a long blog post on the home page.
-  Add a slice at 200 characters to the body django variable line:
``` python
{{ post.body|slice:":200" }}
```
