
41. Lists 

`list_var = ["item1", "item2", "item3"]`
- lists have an order,  number 0 is first 
`name_of_list[index] # To Refer to items in list`
- negative indexes = -1 points to the last item in list, -2 next to second last 
`list_var, append("item4")` # appends to end of list
`list_var.extend(another list)` # adds list to end of list 
43.  Index Errors 
- Trying to access item larger than length of list.
- Off by one errors forgetting index starts at zero. 
- nested lists 
`list3 = [list1, list 2]` 
`print (list 3) `
`[[ 1, 2, 3, 4], [5, 6, 7, 8]]`
`print (list 3 [0,3])` = 4 
48. For Loops
``` python
for x in list: 
	print (x) 
```
- Prints contents of list, not the index