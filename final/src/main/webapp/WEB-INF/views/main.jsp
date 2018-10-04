<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- zz -->
<!-- sdfa -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- Our Custom CSS -->
<link rel="stylesheet" href="style5.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Font Awesome JS -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
	integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
	integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta charset="UTF-8">
<style>
	b{
		font-size : 25px;
	}
	.contentContainer{
		border: 1px solid gold;
	}
</style>
<title>main</title>
</head>
<body>
	<%@include file="./topui.jsp"%>
	<div style="width: 1920px; height: 1080px;">
		<div style="width: 260px; height: 100%; float: left;">
			<%@include file="./sidebar.jsp"%>
		</div>
		<div>
		<c:if test="${sessionScope.id !=null }">
			<b>맞춤</b>
			<br>
			<div class="contentContainer">
				
			</div>
			<br>
		</c:if>
		<b>인기</b>
		<br>
		<div class="contentContainer">
			
		</div>
		<br>
		<b>채널(회원)</b>
		<br>
		<div class="contentContainer">
			
		</div>
		<br>
		<b>주제</b>
		<br>
		<div class="contentContainer">
			
		</div>
		<br>
		</div>
	</div>
</body>
<script>
	
</script>
</html>