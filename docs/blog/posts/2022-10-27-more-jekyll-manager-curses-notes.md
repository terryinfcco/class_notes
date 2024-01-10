---
title: "More Jekyll Manager Curses Notes"
date: 2022-10-27 17:01:05
categories: [jekyll]
tags: [curses manager]
---

# More Jekyll Manager Curses Notes

One of the stack overflow articles recommends using curses.endwin() before exiting to a subprocess like vim, and stdscr.refresh() upon returning. 

I also need to fix the system so that the number of entries shown on the main screen is variable and calculated based on the number of rows (which curses calls lines) available in the terminal. Pretty much working, but when there's less than a full page at the end, the highlight doesn't work well. Got that.  

I should also create a menu entry which lets the user run the update jekyll script from the manager, so they don't have to do it separately. Got that. Nice.

