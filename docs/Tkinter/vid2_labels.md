---
title: Tkinter Labels - Brocode Video 02
tags:
    - python
    - tkinter
---
# Bro Code Youtube Channel Video 2

## Labels

``` python
from tkinter import *

window = Tk()

# label is an area widget that holds text or an image
# window is the container where the label goes.
# text puts text in the label
# font changes the font color
# fg is the foreground color - color name or hex value works for all these colors
# bg is the background color
# relief is the border style
# bd is the width of the border in pixels
# padx is horizontal spacing between text and border
# pady is vertical spacing between text and border
label = Label(window,
     text="Hello World", 
     font=("Arial",40,'bold','underline'), 
     fg='green',
     bg='black',
     relief=RAISED,
     bd=10, 
     padx=20,
     pady=20)
# label.place(relx = 0.35 , rely = 0.0)
label.pack()

# 2nd label to show SUNKEN relief
label2 = Label(window,
     text="Label 2", 
     font=("Arial",40,'bold','underline'), 
     fg='green',
     bg='black',
     relief=SUNKEN,
     bd=10)
# label.place(relx = 0.35 , rely = 0.0)
label2.pack()

# Put an image in a label
# make it a photoimage, compound shows where the image goes relative to the text. 
# so in this case the image is above the text. 
photo = PhotoImage(file="linux.png")
label3 = Label(text="Linux Penguin",
	font=("Arial", 20), 
	image=photo, compound="top")
label3.pack()
window.mainloop()
```
