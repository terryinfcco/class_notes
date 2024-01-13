# Net Ninja Bootstrap 5 Videos

## Tutorial 1 Intro and Setup

- Using VSCode - highly recommends it. 
- Created a github repo `nnbs` so far Video1 folder.
- In index.html he did `doc<tab>`rather than `!<tab>` to boilerplate the html. But looks identical to me.
- Changed the title to Net Ninja Pro - the Book and an h1 that says Net Ninja Pro
- Grabbed the CDN via jsDelivr (the top one, not the one that does popper separately). Place the css tag in the head after the meta links, and paste the javascript link with the script tag at the end of the body.
- Installed the live server extension in VSCode
- Then right click in the html file and select live server to see the web page.
- Create an assets folder under the main folder. Using the github repo that's linked download the two png files and put them in the assets folder.
- You should have a basic grasp of html and css before you start.

## Tutorial 2 New Features

- Dropped jQuery - one less dependency
- Forms revamped
- New utility classes (positioning, font size, border radius, ...)
- Jumbotron gone - but fairly easy to replicate
- Bootstrap icons
- New Components Offcanvas and Accordion
	- Canvas is ability to have a side, top, or bottom pop up bar
	- Accordion - expand text by clicking title
## Tutorial 3 Colors and Typography

### Typography

- Bootstrap has default styles that you get as soon as you include the css and javascript links. These override the browser's built in defaults.
- The bootstrap classes that you apply to elements override these defaults.
- For h1 through h6 can do display classes `<h1 class="display-1">display 1 heading</h1>` - Bigger, non bold font compared to standard h1 .. h6
- These can be applied to any element, so you can have a paragraph with a display-1 class and get a really big paragraph
- Lead text can be used for the first line of a paragraph e.g. where you want it a little bigger than the rest of the paragraph. `<p class="lead">Lorem</p>`
- Text alignment: text-start is the default - left aligned. Also text-center and text-end.
- Text decoration: `class="text-decoration-underline"` and `class="text-decoration-line-through"`
- Font weight: `class="fw-bold"`
- small tag - not bootstrap `<small>this is small text</small>`

### Colors

- Primary - blue; Secondary - gray; Success - green; Danger - red; Warning - yellow; Info - Teal; Light - light gray; Dark - black;
- Use: `class="text-primary"`, `class="text-secondary"`, etc.
- Background on elements: `class="text-light bg-danger"`, `class="text-white bg-primary"` etc.

## Tutorial 4 Buttons and Button Groups

- Basic button: `<button class="btn btn-primary">Basic Primary Button</button>` Button class, plus specify a color
- Links as buttons: `<a href="#" class="btn btn-info">info anchor tag</a>`
- Button sizes: `class="btn btn-lg btn-danger"` or `class="btn btn-sm btn-success"`
- Outlined buttons: `class="btn btn-outline-primary"`
- Button groups - a series of buttons that belong together. Put several buttons inside a div with a class of btn-group. No space between the buttons.

## Tutorial 5 Utility Classes

- Margin and Padding: Margin - `class="m-1"` 1 to 6, 1 is the smallest amount of margin. Margin is outside the element. Padding is the same p-1 to p-6. Padding is inside the element so makes the background color bigger. Can do mx, my, px, py to get margin and padding in only one axis, x or y. mt, mb, ms (margin start), me (margin end) for margin and padding in only direction - top, bottom, start, end.
- Borders: `class="border"` to get default border. border-top, border-bottom, border-start, border-end for border only on one side. Colors of border add border-success, etc. border-1 to border-5 for thickness of the border. For a rounded element class='rounded'. Class = "rounded-pill " for a border shaped like a pill.
- Box shadow: shadow, shadow-sm, shadow-lg. 
- Font weight: fw-bold, fw-bolder, fw-light, fst-italic.

## Tutorial 6 Containers

- Required when using the Bootstrap grid system
- Several container classes which mostly affect the max-width of the screen. 
- `class=container-fluid` always 100% of the width
- container-lg: 100% width until large screen reached. 
- container-xl: 100% until reach extra large screen

## Tutorial 7 Grid System Part 1

- 12 column system so any row can have from 1 to 12 elements
- Grids have to be inside one of the containers
- Columns don't have to be same width. 
- Basic grid 
	- Create a row of content and then create columns inside that row.
	- If you just say col for the class of each column, then each column takes up equal space.
	- In basic grid as the screen gets smaller the columns will start to stack.
``` html
	<div class="container-lg my-5">
		<h2>basic grid</h2>
		<div class="row">
			<div class="col">
				<div class="p-5 bg-primary text-light">col 1</div>
			</div>
			<div class="col">
				<div class="p-5 bg-primary text-light">col 2</div>
			</div>	
			<div class="col">
				<div class="p-5 bg-primary text-light">col 3</div>
			</div>	
		</div>
	</div>	
```

- To specify how many cells each column should take up use col-x, so to have the above with the first column taking half the screen: col-6, col-3, col-3
- This never stacks so at very small sizes looks pretty squished.
- To make it responsive: `class="col-sm-4 col-lg-6"` so on small screens the column takes 4 cells, on large screens use 6 cells. On the smallest screens these stack.
``` html
	<div class="container-lg my-5">
		<h2>basic grid</h2>
		<div class="row">
			<div class="col-sm-4 col-lg-6">
				<div class="p-5 bg-primary text-light">col 1</div>
			</div>
			<div class="col-sm-4 col-lg-3">
				<div class="p-5 bg-primary text-light">col 2</div>
			</div>	
			<div class="col-sm-4 col-lg-3">
				<div class="p-5 bg-primary text-light">col 3</div>
			</div>	
		</div>
	</div>	
```

- To justify content. `class="row justify-content-start"` and end for right justified and center for centered. The example he showed used 3 columns with class col-md-3 so that he didn't specify a full 12 cells. Default was justify start and there were 3 columns with a blank column on the right. Plus it stacked on very small screens.
- To space them out on the row justify-content-between puts the extra space between the columns.
- These are very similar to CSS flexbox which bootstrap is using to do these layouts.

## Tutorial 8 Grid Layout part 2

- Web Page will have several sections
- Working on the intro section - each section will be in a section tag.
- In the head he put some style to create some padding - top and bottom 60px, left and right zero.
- container-lg means 100% of the width until the lg breakpoint and then goes into a column structure.
``` html
<style>
	section {
		padding: 60px 0;
	}
<section id="intro">
	<div class="container-lg">
		<div class="row justify-content-center">
			<div class="co-md-5 text-center text-md-start">
				
			</div>
		</div>
	</div>
</section>
```
