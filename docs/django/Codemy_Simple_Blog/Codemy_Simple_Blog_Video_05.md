## Youtube 37 Video Course
### Style Django Forms With Bootstrap
#### Length 15:45

So my plan is to watch the video and take notes - not code but flow, bash instructions, etc. Then go back through the same video and write the code.

- In add_post.html we've got {{ form.as_p }}. That means that every field in our form is surrounded by p tags.
- You can also do {{ form.as_ul }} which puts in an unordered list and every field has a dot in front of it
- And {{ form.as_table }}

So we have to create a Django form to do this. 
- Create new file ablog/theblog/forms.py

``` python
from django import forms
# Need to import our model.
from .models import Post
# ModelForm lets us use fields from our model.
class PostForm(forms.ModelForm):
	class Meta:
		model = Post
		fields = ('title', 'title_tag', 'author', 'body')
		# Create widgets dictionary
		widgets = {
			# Change the attributes of the TextInput fields. form-control is a bootstrap class
			'title': forms.TextInput(attrs={'class': 'form-control'}),
			'title_tag': forms.TextInput(attrs={'class': 'form-control'}),
			'author': forms.Select(attrs={'class': 'form-control'}),
			'body': forms.Textarea(attrs={'class': 'form-control'}),
		}
```

- Have to surround the django form in add_post.html in a div with the class='form-group' 
- In views.py we now have to import the form we just created. `from .forms import PostForm`
- In views.py in class AddPostView, after model=Post, add `form_class = PostForm` and comment out or delete `fields = __all__ ` because we designated which fields we wanted in PostForm
- Could add other stuff in our PostForm - e.g. to add a placeholder to the title field just add more stuff to the appropriate dictionary:
``` python
			'title': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Blog Post Title Goes Here'}), 
```