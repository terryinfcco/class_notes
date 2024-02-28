---
title: Customtkinter Install and Basic Template
tags:
    - customtkinter
---
# Basics of Customtkinter
## To Install
- `python -m venv venv`
- `. venv/bin/activate`
- `pip install customtkinter`

## A basic customtkinter program - usable as a template
``` python
import customtkinter

# Set the theme (choices: light, dark, system)
customtkinter.set_appearance_mode("dark")

# Set the default color mode - choices he showed: green, blue
customtkinter.set_default_color_theme("blue")

# Create the desktop window and call it app
app = customtkinter.CTk()

# Add a title to the window
app.title("Customtkinter App by Turtle Code")

# Set the size of the window (widthxheight)
app.geometry("500x500")

app.mainloop()
```