# Web Applications for Everyone

## Dr. Chuck

### Video 1

* Request response cycles are foundation of all web applications.

* This course is the most basic way to develop web applications. 

* End User <--> Browser (HTML, CSS, DOM, JavaScript, Jquery)  <--> Web Server (Application Software e.g. php) <--> Database / Database Model <--> Database Tools (i.e. phpMyAdmin)

* HTTP - Hypertext Transfer Protocol - very simple, can even be done by hand. Connect to a server, navigate to a document, send the document back. Not practical to do manually HTTP 2.0 and later. Doesn't work for all webservers.

* URL Uniform Resource Locator 3 components 
  *  http:// is the protocol - how will the document be transferred
  * www.dr-chuck.com is the name of the webhost - where is the document located
  * page1.htm - which document do we send back
  
* By default web servers communicate on port 80

### Video 2

* Browser Developer Mod
  * Network Tab shows requests and responses

### Video 3 - HTML Part 1

* Built with tags
* Browsers tolerate a lot of broken HTML
* Standards set by World Wide Web Consortium W3C

### Video 4 - HTML Part 2

* `<html> </html>` outer tags

* `<head> </head>` non printing info nested in html tags
  * title of page
  * links to css and javascript

* `<body> </body>` page content, nested in html tags after head tags

* index.html, index.htm, index.php, etc are usual starting web pages

* use anchor tags to point between web pages `<a> </a>`
  * Absolute references `<a href="http://www.dr-chuck.com/page2.htm">Second Page</a>`

  * Relative references `<a href="page1.htm">First Page</a>`

* white space and carriage returns usually ignored by browser (pre tag can override)

* most tags have both beginning and ending tags

* some like image are self closing

* opening tags can have attributes `<img src='somepicture.png'>`

* special characters for show characters used by html - 
  * &lt - less than
  * &gt - greater than
  * &amp - ampersand
  * Those are main 3, but there are miscellaneous - card suits, money characters, etc.

* comments: `<!-- comment syntax -->`

* lists and unordered lists:

  * `<ul><li>item 1</li><li>item2</li></ul>`

  * `<ol><li>item 1</li><li>item2</li></ol>`

* tables - Laid out logically - table, tr (table row), th(table header), td(table data), 
