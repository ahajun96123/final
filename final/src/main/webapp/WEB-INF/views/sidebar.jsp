<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<html lang="en">
<head>
<script type="text/javascript">


</script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>ui</title>
<meta charset="utf-8">
</head>

<style>
/*
    DEMO STYLE
*/
@import
	"https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";

body {
	font-family: 'Poppins', sans-serif;
	background: #fafafa;
}

p {
	font-family: 'Poppins', sans-serif;
	font-size: 1.1em;
	font-weight: 300;
	line-height: 1.7em;
	color: gray;
}

a, a:hover, a:focus {
	color: inherit;
	text-decoration: none;
	transition: all 0.3s;
}

.navbar {
	padding: 15px 10px;
	background: #fff;
	border: none;
	border-radius: 0;
	margin-bottom: 40px;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
}

.sidemenu {
	background: #a0a0a0;
}

#sidebar ul li.active {
	background: #a0a0a0;
}

.navbar-btn {
	box-shadow: none;
	outline: none !important;
	border: none;
}

.line {
	width: 100%;
	height: 1px;
	border-bottom: 1px dashed B #ddd;
	margin: 40px 0;
}

/* ---------------------------------------------------
    SIDEBAR STYLE
----------------------------------------------------- */
#sidebar {
	min-width: 220px;
	max-width: 220px;
	height: 100%;
	background: #b4b4b4;
	color: #fff;
	transition: all 0.6s cubic-bezier(0.945, 0.020, 0.270, 0.665);
	transform-origin: bottom left;
}

#sidebar.active {
	margin-left: -250px;
	transform: rotateY(100deg);
}

#sidebar .sidebar-header {
	padding: 20px;
	background: #a0a0a0;
}

#sidebar ul.components {
	padding: 20px 0;
	border-bottom: 1px solid #47748b;
}

#sidebar ul p { : #fff;
	padding: 10px;
}

#sidebar ul li a {
	padding: 10px;
	font-size: 1.1em;
	display: block;
}

#sidebar ul li a:hover {
	color: #aaaaaa;
	background: #a0a0a0;
}

a[data-toggle="collapse"] {
	position: relative;
}

.dropdown-toggle::after {
	display: block;
	position: absolute;
	top: 50%;
	right: 20px;
	transform: translateY(-50%);
}

ul ul a {
	font-size: 0.9em !important;
	padding-left: 30px !important;
	background: #a0a0a0;
}

ul.CTAs {
	padding: 20px;
}

ul.CTAs a {
	text-align: center;
	font-size: 0.9em !important;
	display: block;
	border-radius: 5px;
	margin-bottom: 5px;
}

a.post {
	background: #a0a0a0;
	color: #fff;
}

a.Livechat, a.Livechat:hover {
	background: #a0a0a0 !important;
	color: #fff !important;
}

/* ---------------------------------------------------
    CONTENT STYLE
----------------------------------------------------- */
#content {
	width: 100%;
	padding: 20px;
	min-height: 100vh;
	transition: all 0.3s;
}

#sidebarCollapse {
	width: 40px;
	height: 40px;
	background: #f5f5f5;
	cursor: pointer;
}

#sidebarCollapse span {
	width: 80%;
	height: 2px;
	margin: 0 auto;
	display: block;
	background: #555;
	transition: all 0.8s cubic-bezier(0.810, -0.330, 0.345, 1.375);
	transition-delay: 0.2s;
}

#sidebarCollapse span:first-of-type {
	transform: rotate(45deg) translate(2px, 2px);
}

#sidebarCollapse span:nth-of-type(2) {
	opacity: 0;
}

#sidebarCollapse span:last-of-type {
	transform: rotate(-45deg) translate(1px, -1px);
}

#sidebarCollapse.active span {
	transform: none;
	opacity: 1;
	margin: 5px auto;
}

/* ---------------------------------------------------
    MEDIAQUERIES
----------------------------------------------------- */
@media ( max-width : 768px) {
	#sidebar {
		margin-left: -250px;
		transform: rotateY(90deg);
	}
	#sidebar.active {
		margin-left: 0;
		transform: none;
	}
	#sidebarCollapse span:first-of-type, #sidebarCollapse span:nth-of-type(2),
		#sidebarCollapse span:last-of-type {
		transform: none;
		opacity: 1;
		margin: 5px auto;
	}
	#sidebarCollapse.active span {
		margin: 0 auto;
	}
	#sidebarCollapse.active span:first-of-type {
		transform: rotate(45deg) translate(2px, 2px);
	}
	#sidebarCollapse.active span:nth-of-type(2) {
		opacity: 0;
	}
	#sidebarCollapse.active span:last-of-type {
		transform: rotate(-45deg) translate(1px, -1px);
	}
}
</style>
<body>
	<!-- Sidebar Holder -->
	<nav id="sidebar">
		<div class="sidebar-header">
			<h3><i class="fa fa-bars"></i>  MENU</h3>
		</div>

		<ul class="list-unstyled components">
			<p>Category</p>
			<li class="active"><a href="#homeSubmenu" data-toggle="collapse"
				aria-expanded="false" class="dropdown-toggle"><i class="material-icons" style="font-size:18px">restaurant</i>  Food</a>
				<ul class="collapse in list-unstyled" id="homeSubmenu">
					<li class="sideside"><a href="boardList?which=음식">전체</a></li>
					<li class="sideside"><a href="boardList?which=음식&category=한식">한식</a></li>
					<li class="sideside"><a href="boardList?which=음식&category=중식">중식</a></li>
					<li class="sideside"><a href="boardList?which=음식&category=일식">일식</a></li>
					<li class="sideside"><a href="boardList?which=음식&category=양식">양식</a></li>
					<li class="sideside"><a href="boardList?which=음식&category=음식기타">기타</a></li>
				</ul></li>
			<li class="sidemenu"><a href="#pageSubmenu"
				data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="material-icons" style="font-size:18px">local_movies</i>  Movie</a>
				<ul class="collapse in list-unstyled" id="pageSubmenu">
					<li class="sideside"><a href="boardList?which=영화">전체</a></li>
					<li class="sideside"><a href="boardList?which=영화&category=액션">액션</a></li>
					<li class="sideside"><a href="boardList?which=영화&category=모험">모험</a></li>
					<li class="sideside"><a href="boardList?which=영화&category=판타지">판타지</a></li>
					<li class="sideside"><a href="boardList?which=영화&category=SF">SF</a></li>
					<li class="sideside"><a href="boardList?which=영화&category=스릴러">스릴러</a></li>
					<li class="sideside"><a href="boardList?which=영화&category=로맨스">로맨스</a></li>
					<li class="sideside"><a href="boardList?which=영화&category=드라마">드라마</a></li>
					<li class="sideside"><a href="boardList?which=영화&category=가족">가족</a></li>
					<li class="sideside"><a href="boardList?which=영화&category=공포">공포</a></li>
					<li class="sideside"><a href="boardList?which=영화&category=뮤지컬">뮤지컬</a></li>
					<li class="sideside"><a href="boardList?which=영화&category=스포츠">스포츠</a></li>
					<li class="sideside"><a href="boardList?which=영화&category=미스터리">미스터리</a></li>
					<li class="sideside"><a href="boardList?which=영화&category=추리">추리</a></li>
					<li class="sideside"><a href="boardList?which=영화&category=다큐">다큐</a></li>
					<li class="sideside"><a href="boardList?which=영화&category=역사">역사</a></li>
					<li class="sideside"><a href="boardList?which=영화&category=영화기타">기타</a></li>
				</ul></li>
			<li class="sidemenu"><a href="boardList?which=지름"><i class="material-icons" style="font-size:18px">shopping_cart</i>  Hot Deal</a></li>
		</ul>
		<ul class="list-unstyled CTAs">
			<li><a href="#" onclick="postCheck()"
				class="post">Post</a></li>
			<li><a href="#" onclick="chatCheck()"
				class="Livechat">Live chat</a></li>
		</ul>
	</nav>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#sidebarCollapse').on('click', function() {
				$('#sidebar').toggleClass('active');
				$(this).toggleClass('active');
			});
		});
	</script>
</body>
</html>
