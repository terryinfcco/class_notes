## Youtube 37 Video Course
### Update and Edit Blog Posts
#### Length 14:52

So my plan is to watch the video and take notes - not code but flow, bash instructions, etc. Then go back through the same video and write the code.

- Create update_post.html in templates
- Paste in add_post.html, change title to Edit Blog Post and h1 Update Post, change button to say update
- Import UpdateView in views.py
- Add new class to views.py
``` python
class UpdatePostView(UpdateView):
	model = Post
	template_name = 'update_post.html'
	fields = ['title', 'title_tag', 'body']
```
- import UpdatePostView in urls.py
- add to urlpatterns in urls.py:
``` python
path('article/edit/<int:pk>', UpdatePostView.as_view(), name='update_post'),
```
- In home.html add a link to edit each entry
``` python
post.author.last_name }} - <small><a href="{% url 'update_post' post.pk %}">(Edit)</a></small><br>
```
- In article_detail add the same edit link inside the small tags where the authors name is:
``` python
post.authorl.last_name }} - <a href="{% url 'update_post' post.pk %}">(Edit)</a>
```
- In forms.py copy PostForm class and rename it to EditForm, remove field author from fields and comment out author in widgets. 
- In views.py import EditForm after PostForm, then in class UpdatePostView add `form_class = EditForm`, and comment out the fields line. 