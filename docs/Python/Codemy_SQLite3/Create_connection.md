---
title: 04 -Create SQLite Connection Codemy.com
tags:
    - python
    - sqlite3
---

# Using SQLite3 Databases with Python

## Create SQLite Connection Codemy.com Video 4

SQLite comes with Python. 

### This code creates the Database:

``` Python

# import sqlite3 object
import sqlite3

# Create a connection called conn and create a database called customer.db
# if db already exists this will just connect to it. 
conn = sqlite3.connect('customer.db')

# You can create an in memory database that only lasts the duration of your
# program and isn't saved. Use ':memory:' as the argument.

# conn = sqlite3.connect(':memory:')

```

## This Creates a Database Table

Tables contain all the data in a database. Pretty much like a spreadsheet, tables and columns. 

``` Python
# import sqlite3 object
import sqlite3

# Create a connection called conn and create a database called customer.db
# if db already exists this will just connect to it. 
conn = sqlite3.connect('customer.db')

# Most activities require a cursor. Build it once, call it anything
c = conn.cursor()

# Now create the table using a docstring
# sqlite3 only has 5 datatypes. NULL, INTEGER, REAL, TEXT, BLOB
# NULL is does it exist, BLOB for things like videos, images, mp3, etc. 
c.execute("""CREATE TABLE customers (
	first_name text,
	last_name text,
	email text
)

	""")
	
# To actually create the table have to commit our connection
conn.commit()

# Close the connection
conn.close()


```
