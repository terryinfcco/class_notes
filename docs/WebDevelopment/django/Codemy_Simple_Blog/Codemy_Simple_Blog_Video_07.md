---
title: Codemy Django Simple Blog Series 07
tags:
    - django
---

## Youtube 37 Video Course
### Delete Blog Posts
#### Length 11:56

So my plan is to watch the video and take notes - not code but flow, bash instructions, etc. Then go back through the same video and write the code.

- In views.py add DeleteView to the built in views we're importing
- We also need to: `from django.urls import reverse_lazy`
- Then another class in views.py
``` python
class DeletePostView(DeleteView):
	model = Post
	template_name = 'delete_post.html'
	success_url = reverse_lazy('home')
```
- Create delete_post.html in templates
- Copy update_post.html into delete_post.html
- Change title to Delete Blog Post and h1 to Delete Post
- Change the rest of the body:
``` html
<h3>Delete: {{ post.title }}</h3>

<br>
<div class="form-group">
	<form method="POST">
		{% csrf token %}
		<strong>Are you sure?!</strong><br><br>
		<button class="bth btn-secondary">Delete Post!</button>
	</form>
</div> 
```
- In urls.py
	- add to import DeletePostView
	- `path('article/<int:pk>/remove', DeletePostview.as_view(), name='delete_post'),`
- In home.html after the edit link add a delete link: `<a href="{% url 'delete_post' post.pk %}">(Delete)</a>`
- Copy that same link tag to article_detail.html again right after the edit tag.
- To change the order of the home page list of blog entries so that the most recent one appears first, in views.py add to the HomeView class `ordering = ['-id']`
- At this point we've got all the main features of the blog. 
