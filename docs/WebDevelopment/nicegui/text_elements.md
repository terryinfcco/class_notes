---
tags:
    - nicegui
    - nicegui_label
    - nicegui_link
    - nicegui_chat_message
    - nicegui_markdown
    - nicegui_mermaid
    - nicegui_html
---
``` python
# Text Elements tutorial 2

from nicegui import ui 

# A label element
ui.label('Welcome to Turtle Code Youtube Channel')

# A link element
# First parameter what gets displayed
# Second parameter internet address where the link goes
ui.link('Go to Turtle Code Youtube Channel', 
        'https://www.youtube.com/@turtlecode/videos')

# chat message element - there can be multiple instances on a page
# four parameters - Name of the object, name of message sender, 
# sending time of the message, message image
ui.chat_message('Hello Turtle',
                name='Robot',
                stamp='now',
                avatar='https://robohash.org/ui')

# markdown element showing bold text
ui.markdown('This is **Markdown**.') 

# Mermaid graphic
ui.mermaid('''
    graph LR;
        A --> B;
        A --> C;
           ''')

# Can use HTML 
ui.html('This is <strong>HTML</strong>')

ui.run()

```