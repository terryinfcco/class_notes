- Create a folder called: First-Django-Project
- Create Virtual Environment called: venv:  `python3 -m venv venv`
- Activate venv: `source venv/bin/activate`
- Install Django - pip install django
	- other pip commands: pip uninstall, pip list, pip freeze (save to file - pip freeze > requirements.txt)
- Create requirements.txt: `pip freeze > requirements.txt`
- Start the project
``` bash
# The . at the end is to keep the directory structure simpler
django-admin startproject core .
```
- Run the server to make sure things worked OK
``` bash
python manage.py runserver
```

