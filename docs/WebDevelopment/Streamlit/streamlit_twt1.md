# Streamlit Tech With Tim 
## 95 minute video October 20, 2024

**Installation - can use a virtual environment of course**
``` shell
pip install streamlit pandas numpy matplotlib
```
### Basics of Streamlit
**First Program**
``` python
import streamlit as st

st.write("Hello World")
```
**Run the program on port 8501**
``` shell
streamlit run main.py
```
- Bring up `localhost:8501` in a browser
- You'll see an option 'Always Rerun' which will refresh the screen every time you save your file

### Streamlit Text Display Commands
- `st.write()` # streamlit will make a best effort to format whatever you put inside the parentheses
- streamlit will try to write python expressions if you just put them in the code.
    - `3+4` will display as 7. 
    - "hello world" will show up on the screen
- `st.title("Super Simple Title")` # basically an h1 tag
- `st.header("This is a header")` # Slightly smaller - like an h2
- `st.subheader("Subheader")` # Smaller again
- `st.markdown("This is **Markdown**")` # Markdown
- `st.caption("small text")` # Smaller text
``` python
code_example = """
def greet(name):
    print('Hello', name)
"""
- st.code(code_example, language="python")
```
`st.divider()` # Horizontal Rule
### Streamlit Dataflow
Everytime an event occurs - button clicked, text entered, etc. Streamlit reruns the entire python file.
### Images
- need a directory at same level as main.py called static
- then put your images inside the static directory
``` python
import streamlit as st
import os
# getcwd is get current working directory, then the subdirectory and finally the actual file
st.image(os.path.join(os.getcwd(), "static", "BG.jpg"))
# There are other options like width for images
st.image(os.path.join(os.getcwd(), "static", "BG.jpg"), width=50)
```
