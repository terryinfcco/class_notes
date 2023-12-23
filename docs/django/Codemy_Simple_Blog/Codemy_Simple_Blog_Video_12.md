## Youtube 37 Video Course
### Add Blog Categories
#### Length 20:10


So my plan is to watch the video and take notes - not code but flow, bash instructions, etc. Then go back through the same video and write the code. I'm capturing more code in these notes and I think it's working well.

- Put a new class in models.py - he placed it before class Post
``` python
class Category(models.Model):
	name = models.CharField(max_length=255)
	def __str__(self):
		return self.name
	def get_absolute_url(self):
		return reverse('home')
```
- Add to end of class Post in models.py:
``` python
category = models.CharField(max_length=255, default='coding')
```
- Do makemigrations and migrate
- In theblog/admin.py import Category after Post, and register Category just like Post is registered.
- Using admin page he added coding, sports and entertainment to categorys
- In theblog/forms.py, put 'category' between author and body on fields line
- Then in widgets after author, copy author line and change author to category
- Could hard code your categories in forms.py by creating a list `choices = [('coding', 'coding'), ('sports', 'sports'), ('entertainment', entertainment')`
- Then in widgets first thing in 'category': forms.Select(choices = choices)
- Not doing that in this case - so still in forms.py add Category to the from .models import
- Then after the import statements do a query of the Category class
``` python
choices = Category.objects.all().values_list('name','name')
choice_list = []
for item in choices:
	choice_list.append(item)

# then in widgets:
'category': forms.Select(choices=choice_list, attrs......)
```
- Now create a page to manage categories rather than having to use the admin page.
- In views.py `from .models import Post, Category ` and add a class:
``` python
class AddCategoryView(CreateView):
	model = Category
	template_name = 'add_category.html'
	fields = '__all__'
```
- Create new template add_category.html
- Copy contents of add_post.html and change title to Create a New Category, h1 to Add Category and button text to Add Category.
- In urls.py import AddCategoryView and new path after add_category `path('add_category/', AddCategoryView.as_view(), name='add_category'`
- In base.html copy add_post li block, changing url to 'add_category' and text to Add Category
- In home.html in the for loop after post.title add a line `- {{ post.category }}` 
- Need to add an edit category page and a way to just list posts with a certain category.