---
title: Create Detailed View - Caleb Django Crash Course
tags:
    - django
---
## Click on a Movie and go to a Detailed View
- First create a new view in views.py
``` python
def detail(request, id):
    # This time the data is one record. The id will come from the url when the user clicks on a movie name
    data = Movie.objects.get(pk=id)
    return render(request, "movies/detail.html", {"movie": data})
```
- Now in urls.py add a new url
`    path("movies/<int:id>", views.detail),`
- now make the detail template
``` html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<!-- Just show the move (remember the __str__ method gives us a formatted string -->
    {{ movie }}
</body>
</html>
```
- Now modify movies.html to make the title a link and pass an id

