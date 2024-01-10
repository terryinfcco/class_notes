---
title: "Jekyll Manager Curses Version"
date: 2022-10-27 01:59:20
categories: [jekyll]
tags: []
---

# Jekyll Manager Curses Version

The Jekyll Manager Curses Version on the Beelink i3 (/home/terry/GT_blog/jmc.py) is working well. I need to add an alias to it and put it in the opening message. Did that, the alias is jm and the script it runs is jm.sh.

I tried to do things differently this time. All I did was create a python program that just used print, input, and various subprocess statements to print out the entry information and use the number of the one that I wanted to edit. Once I got that python program working, I then went ahead and slowly used that as a template to create a curses based version of the same basic logic. And it works great. I'd still like to add colors to it, but it's pretty darn good. I think I have to recall wrapper everytime I go away to vim because the bottom menu can be messed up. Or maybe I can start vim in a new window and not mess with the curses app at all. 

I think I should be able to do the same sort of thing using jekyll and the same setup to do a todo list. Just use the tags completed, progressing, perhaps, and maybe 1 or 2 more then use the tag menu on the jekyll site to view the stuff. 
