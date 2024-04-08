# JCharisTech on Youtube

## Various screen output elements
- st.text("This is a text") # Text widget
- st.title("This is a title:H1 tag")
- st.header("This is a header")
- st.subheader("This is a subheader")
- st.write("This is a super function")
- st.markdown("""This is *markdown* """)
- st.latex("\int")
- st.json("""{"data":"This is streamlit"}""")
- st.code("""
print("Hello Streamlit")
a = 40
""", language="python", line_numbers=True) 
st.success("This is success") # Using Bootstrap Colors
st.error("this is error")
st.exception("TypeError")
st.warning("Warning")

## Input elements
- first_name = st.text_input("First Name")
- password = st.text_input("Password", type="password") # Will put asterisks where typing
- message = st.text_area("Message")
- date = st.date_input("Date") # shows a calendar to click on
- appointment_time = st.time_input("Appointment Time") # time entry
- age = st.number_input("Age", min_value=0, max_value=120)
- gender = st.radio("Gender", ["Male", "Female"])
- enable = st.toggle("Enable Picker")
- level = st.checkbox("Level")

## Sliders - Selectors
countries = st.selectbox("Countries", ["Ghana", "UK", "India", "German", "USA"]) - One at a time
programming_languages = st.multiselect("Programming",["Python", "Golang", "Javascript"]) # can select multiple
rating = st.slider("Rating", 0, 10)
ranking = st.select_slider("Ranking", ["Junior Dev", "Mid Dev", "Senior Dev", "Architect"])

st.divider() # horizontal line
color = st.color_picker("Pick a Color")
st.write(color)