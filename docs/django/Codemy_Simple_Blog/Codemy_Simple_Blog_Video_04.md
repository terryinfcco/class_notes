## Youtube 37 Video Course
### Add a Post Page
#### Length 19:13

So my plan is to watch the video and take notes - not code but flow, bash instructions, etc. Then go back through the same video and write the code.

## Summary
- Create a page to add a post without using the Admin page. 3 step process
	1 Create a view - AddPostView
	2 Create a URL - AddPostView at end of from .views import and a path
	3 Create a template - add_post.html
	
- Add Add Post link to the navbar in base.html
- Have to add to models.py so that Django knows what to do with the post button on the new form.
``` python
	def get_absolute_url(self):
	return reverse('home')
```
 

- Whenever create a webpage in Django it's a three step process
	- Create a template
	- Create a view
	- Create a URL
- Create add_post.html in templates and use same format as article_details.html
- In ablog/theblog/views.py import CreateView 
``` python
class AddPostView(CreateView):
	model = Post
	template_name = 'add_post.html'
	# This will put all the fields from the model on the page.
	fields = '__all__'
	# Or to just include certain fields:
	fields = ('title', 'body')
```
- In ablog/theblog/urls.py:
	- `from .views import ....., AddPostView`
	- in urlpatterns - `path('add_post/', AddPostView.as_view(), name='add_post'),`
- In base.html set the second link (called Link which I think I deleted) to `href="{% url 'add_post'%}">Add Post</a>`
- Then in add_post.html:
``` html
<form method="POST">
	# csrf_token is a security thing that all frameworks use.
	{% csrf_token %}
	{{ form.as_p }}
	<button class="btn btn-secondary">Post</button>
```
- In ablog/theblog/models.py create another method under class Post that tells django what to do when you click the post button from above:
``` python
from django.urls import reverse
...
def get_absolute_url(self):
	return reverse('article-detail', args=(str(self.id)))
	# Or if you want to return to the home page:
	return reverse('home')
```
- Change the title_tag on the add_post.html template to Create a New Blog Post
- He deleted the default from the title_tag field in models.py because it's not needed anymore.