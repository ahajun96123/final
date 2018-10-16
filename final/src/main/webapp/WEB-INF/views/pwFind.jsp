<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
<title>꿀벌 비밀번호 찾기</title>
<link rel="shortcut icon" href="resources/img/honeypot.jpg">
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

<script>
	function goBack() {
		window.history.back();
	}
</script>
</head>
<body>
	<div class=container>
		<%@include file="./topui.jsp"%>
		<div style="width: 1130px; height: 990px;">
			<div style="width: 260px; height: 100%; float: left;">
				<%@include file="./sidebar.jsp"%>
			</div>
			<div style="width: 850px; float: left;">
				<br> <a style="font-size: 30px; font-weight: bold;">회원관리</a>
				<form action="pwfindservice" method="post">
					<table class="table table-hover" style="margin-top: 20px;">
					<thead class="thead-light">
						<tr>
							<th colspan = "2">비밀번호 찾기</th>
						</tr>
						<tr>
							<td colspan = "2">이이디와 회원가입시 사용한 이메일주소를 입력해주십시요</td>
						</tr>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="id" placeholder="아이디입력"
								required></td>
						</tr>
						<tr>
							<td><input class="btn btn-info" type="submit" value="페스워드 찾기"
								onclick="return confirm('확인시 가입시 사용한 이메일주소에 인증메일이 전송됩니다 또한 인증완료후 비밀번호변경과정에서 종료시에는 별도의 메일인증없이 바로 변경이 가능합니다 진행하시겠습니까?');"
								required></td>
						</tr>
					</table>
				</form>
				<button class="btn btn-warning" onclick="location.href='main'">메인으로 돌아가기</button>
			</div>
		</div>
	</div>
</body>
</html>