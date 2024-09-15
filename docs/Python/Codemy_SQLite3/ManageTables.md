---
title: 06_07 - Adding Data in SQLite3 - Codemy
tags:
    - python
    - sqlite3
---
# Adding Data in SQLite3

## Add One Record to a table - Video 6

``` python
import sqlite3

# Connect to the database
conn = sqlite3.connect('customer.db')

# Create a Cursor
c = conn.cursor

# These correspond to the fields we added to our table, first_name,
# last_name, email

c.execute("INSERT INTO customers VALUES ('John', 'Elder', 'john@codemy.com')")
c.execute("INSERT INTO customers VALUES ('Tim', 'Smith', 'tim@codemy.com')")
c.execute("INSERT INTO customers VALUES ('Mary', 'Brown', 'mary@codemy.com')")


# Commit our command
conn.commit()

# Close our connection
conn.close()

```

### Insert many records into the database - Video 7

``` python
import sqlite3

# Connect to the database
conn = sqlite3.connect('customer.db')

# Create a Cursor
c = conn.cursor

# These correspond to the fields we added to our table, first_name,
# last_name, email

many_customers = [('Wes', 'Brown', 'wes@brown.com'), 
	('Steph', 'Kuewa', 'steph@kuewa.com'), 
	('Dan', 'Pas', 'dan@pas.com'),
]

c.executemany("INSERT INTO customers VALUES (?,?,?)", many_customers)

# Commit our command
conn.commit()

# Close our connection
conn.close()

```
