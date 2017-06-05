<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: sans-serif;
}

/* ---- grid ---- */
.grid {
	background: #EEE;
	max-width: 1200px;
}

/* clearfix */
.grid:after {
	content: '';
	display: block;
	clear: both;
}

/* ---- grid-item ---- */
.grid-item {
	width: 160px;
	height: 120px;
	float: left;
	background: #D26;
	border: 2px solid #333;
	border-color: hsla(0, 0%, 0%, 0.5);
	border-radius: 5px;
}

.grid-item--width2 {
	width: 320px;
}

.grid-item--width3 {
	width: 480px;
}

.grid-item--width4 {
	width: 640px;
}

.grid-item--height2 {
	height: 200px;
}

.grid-item--height3 {
	height: 260px;
}

.grid-item--height4 {
	height: 360px;
}
</style>
<script
	src="./masonry.pkgd.min.js"></script>
</head>
<body>

	<div class="grid" data-masonry='{ "itemSelector": ".grid-item"}'>
		<div class="grid-item"></div>
		<div class="grid-item grid-item--width2 grid-item--height2"></div>
		<div class="grid-item grid-item--height3"></div>
		<div class="grid-item grid-item--height2"></div>
		<div class="grid-item grid-item--width3"></div>
		<div class="grid-item"></div>
		<div class="grid-item"></div>
		<div class="grid-item grid-item--height2"></div>
		<div class="grid-item grid-item--width2 grid-item--height3"></div>
		<div class="grid-item"></div>
		<div class="grid-item grid-item--height2"></div>
		<div class="grid-item"></div>
		<div class="grid-item grid-item--width2 grid-item--height2"></div>
		<div class="grid-item grid-item--width2"></div>
		<div class="grid-item"></div>
		<div class="grid-item grid-item--height2"></div>
		<div class="grid-item"></div>
		<div class="grid-item"></div>
		<div class="grid-item grid-item--height3"></div>
		<div class="grid-item grid-item--height2"></div>
		<div class="grid-item"></div>
		<div class="grid-item"></div>
		<div class="grid-item grid-item--height2"></div>
	</div>

</body>
</html>