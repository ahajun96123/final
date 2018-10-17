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

<style>
/* / The Modal (background) /
.modal {
	display: none;
	/ Hidden by default /
	position: fixed;
	/ Stay in place /
	z-index: 1;
	/ Sit on top /
	left: 0;
	top: 0;
	width: 100%;
	/ Full width /
	height: 100%;
	/ Full height /
	overflow: auto;
	/ Enable scroll if needed /
	background-color: rgb(0, 0, 0);
	/ Fallback color /
	background-color: rgba(0, 0, 0, 0.4);
	/ Black w/ opacity /
}

/ Modal Content/Box /
.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	/ 15% from the top and centered /
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
	/ Could be more or less, depending on screen size /
}

/ The Close Button /
.close {
	color: white;
	float: right;
}

.close:hover, .close:focus {
	text-decoration: none;
	cursor: pointer;
} */
</style>




</head>
<body>
	<nav
		class="navbar navbar-expand-sm bg-dark navbar-muted navbar-fixed-top"
		style="margin-bottom: 0px; background-image: url('img/honeybgcm3.png');height:80px;">
		<!-- Brand/logo -->
		<img class="btn-img"src="resources/img/honeypot3.png" style="width: 200px; height: 90px;" onclick="location='main'"></img>
		<div style="width: 50px"></div>
		<!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item" style="width:100px"><a class="nav-link text-warning"
				href="main">Home</a></li>
			<c:choose>
				<c:when test="${which ne null}">
					<li class="nav-item">
						<form class="form-inline" action="boardList" style="height:45px;">
							<div class="input-group mb-1">
								<select class="custom-select" name="option">
									<option selected value="제목">제목</option>
									<option value="태그">태그</option>
									<option value="작성자">작성자</option>
									<option value="내용&지역">내용&지역</option>
								</select>
								<div class="input-group mb-1">
									<input type="text" class="form-control" placeholder="Search" name="search">
									<div class="input-group-append" style="width: 200px;">
										<button class="btn btn-warning" type="submit"><span class="fa fa-search"></span>검색	</button>
									</div>
								</div>
							</div>
							<input type="hidden" name="bWhich" value="${which}">
						</form>
					</li>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><div style="width:369;"></div></li>
				</c:otherwise>
			</c:choose>
			<li class="nav-item">
				<div class="btn-group">
					<c:if test="${sessionScope.id == null }">
						<button class="btn btn-warning" onclick="location.href='login'">로 그 인</button>
						<button class="btn btn-primary" onclick="location.href='login'">회 원 가 입</button>
					</c:if>
					<c:if
						test="${sessionScope.id != null && !sessionScope.id.equals('admin') }">
						<button class="btn btn-warning" onclick="location.href='memberinfomation?idInfo='">내 정 보</button>
						<button class="btn btn-info" onclick="location.href='memberlogout'">로 그 아 웃</button>
					</c:if>
					<c:if
						test="${sessionScope.id != null && sessionScope.id.equals('admin') }">
						<button class="btn btn-warning" onclick="location.href='memberlist'">회 원 관 리</button>
						<button class="btn btn-info" onclick="location.href='memberlogout'">로 그 아 웃</button>
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
						<label for="InputID">사용하실 아이디  </label> <input type="text"
							class="form-control" name="id" placeholder="아이디" required>
					</div>
					<div class="form-group">
						<label for="InputPassword">비밀번호</label> <input type="password"
							class="form-control" name="password" placeholder="비밀번호" required>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script>
		// Get the modal
		var modal = document.getElementById('myModal');

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks on the button, open the modal 
		/* btn.onclick = function() {
			if(!$('#newMessage').attr('id').eqals('newMessage')){
				modal.style.display = "block";	
			}
		} */

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
	</script> --%>
</body>
</html>