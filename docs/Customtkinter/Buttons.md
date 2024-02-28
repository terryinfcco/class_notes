---
title: Customtkinter Buttons
tags:
    - customtkinter
    - ctkbutton
---
## Adding a button to a Customtkinter application
``` python
# also have to import tkinter to use the CENTER keyword
import tkinter
# function to be executed when button is clicked
def button_function():
    print("button pressed!")

# Create button variable 
# window where it should appear, button text, 
# function to execute when clicked
button = customtkinter.CTkButton(master=app, text="CTKBUTTON", 
    command=button_function)
button.place(relx=0.5, rely=0.8, anchor = tkinter.CENTER)
app.mainloop()
```
