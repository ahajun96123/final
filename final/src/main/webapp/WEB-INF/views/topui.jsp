<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>ui</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	type="text/css" rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/full-width-pics.css"
	type="text/css" rel="stylesheet">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<style>
/* The Modal (background) */
.modal {
	display: none;
	/* Hidden by default */
	position: fixed;
	/* Stay in place */
	z-index: 1;
	/* Sit on top */
	left: 0;
	top: 0;
	width: 100%;
	/* Full width */
	height: 100%;
	/* Full height */
	overflow: auto;
	/* Enable scroll if needed */
	background-color: rgb(0, 0, 0);
	/* Fallback color */
	background-color: rgba(0, 0, 0, 0.4);
	/* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	/* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
	/* Could be more or less, depending on screen size */
}

/* The Close Button */
.close {
	color: white;
	float: right;
}

.close:hover, .close:focus {
	text-decoration: none;
	cursor: pointer;
}
</style>




</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-muted navbar-fixed-top" style="margin-bottom:0px;background-image:url('img/honeybgcm3.png');">
		<!-- Brand/logo -->
		<img src="img/honeypot3.png" style="width: 200px; height: 80px;"></img>
		<div style="width:50px"></div>
		<!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link text-warning" href="main">Home</a></li>
			<li class="nav-item"><a class="nav-link text-warning" href="#">My Page</a></li>
			<li class="nav-item"><a class="nav-link text-warning" href="#">Admin Page</a></li>
			<c:choose>
			<c:when test="${which ne null}"> 
			<li class="nav-item"><form class="form-inline"
					action="boardList">
					<select class="custom-select" name="option">
					<option selected value="제목">제목</option>
					<option value="태그">태그</option>
					<option value="작성자">작성자</option>
					<option value="내용&지역">내용&지역</option>
					</select>
					<input class="form-control mr-auto" type="text"
						placeholder="search" name="search">
						<div style="width:850px;">
							<button class="btn btn-light" type="submit">Search</button>
						</div>
						<input type="hidden" name="bWhich" value="${which}">
				</form></li>
				</c:when>
				<c:otherwise>
				<li class="nav-item"><div style="width:1169px;"></div></li>
				</c:otherwise>
				</c:choose>
			<li class="nav-item">
				<div class="btn-group">
					<c:if test="${sessionScope.id == null }">
						<button class="btn btn-warning" onclick="location.href='login'">로그인</button>
						<button id="myBtn" class="btn btn-lg btn-primary btn-block">회원가입</button>
					</c:if>
					<c:if test="${sessionScope.id != null && !sessionScope.id.equals('admin') }">
						<form action="memberinfomation" method="post"><button class="btn btn-warning">내 정 보</button></form>
						<form action="memberlogout" method="post"><button class="btn btn-info">로 그 아 웃 </button></form>
					</c:if>
					<c:if test="${sessionScope.id != null && sessionScope.id.equals('admin') }">
						<form action="memberlist" method="post"><button class="btn btn-warning">회 원 관 리</button></form>
						<form action="memberlogout" method="post"><button class="btn btn-info">로 그 아 웃 </button></form>
					</c:if>
				</div>
			</li>
		</ul>
	</nav>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
				<!-- Trigger/Open The Modal -->

				<!-- The Modal -->
				<div id="myModal" class="modal">

					<!-- Modal content -->
					<div class="modal-content">

						<div class="page-header">
							<h1>HoneyPot 회원가입</h1>
						</div>
						<div class="col-md-6 col-md-offset-3">
							<form action="memberjoin" method="post">
								<div class="form-group">
									<label for="InputID">사용하실 아이디</label> 
									<input type="text" class="form-control" name="id" placeholder="아이디" required>
								</div>
								<div class="form-group">
									<label for="InputPassword">비밀번호</label> <input type="password"
										class="form-control" name="password" placeholder="비밀번호"
										required>
								</div>
								<div class="form-group">
									<label for="username">이름</label> <input type="text"
										class="form-control" name="name" placeholder="이름" required>
								</div>
								<div class="form-group">
									<label for="userage">나이</label> <input type="number"
										class="form-control" name="age" placeholder="나이" required>
								</div>
								<div class="form-group">
									<label for="useremail">이메일</label> <input type="text"
										class="form-control" name="email" placeholder="이메일" required>
								</div>
								<div class="form-group">
									<label for="useraddress">주소</label> <input type="text"
										class="form-control" name="address" placeholder="주소">
								</div>
								<div class="form-group">
									<label for="usergender">성별</label><br> <input type="radio"
										name="gender" value="남자" checked="checked" /> 남자 <input
										type="radio" name="gender" value="여자" /> 여자
								</div>
								<div class="form-group text-center">
									<button type="submit" class="btn btn-info">
										회원가입<i class="fa fa-check spaceLeft"></i>
									</button>
									<button class="btn btn-warning">
										<span class="close" style="font-size: 15pt">가입취소</span><i
											class="fa fa-times spaceLeft"></i>
									</button>

								</div>
							</form>
						</div>

					</div>

				</div>
				
				
				
				
				
				
				
				
				
				
				
				
				<!-- Bootstrap core JavaScript -->
	<%-- <script
		src="<c:url value=" /resources/vendor/jquery/jquery.min.js " />"></script>
	<script
		src="<c:url value=" /resources/vendor/bootstrap/js/bootstrap.bundel.min.js " />"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script> --%>
	<!-- <script>
		// Get the modal
		var modal = document.getElementById('myModal');

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks on the button, open the modal 
		btn.onclick = function() {
			if(!$('#newMessage').attr('id').eqals('newMessage')){
				modal.style.display = "block";	
			}
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script> -->
</body>
</html>