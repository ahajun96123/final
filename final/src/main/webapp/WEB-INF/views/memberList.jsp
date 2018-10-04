<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.tr {
	width: 500px;
	heigt: 100px;
	border: 1px solid #444444;
}

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
<script>
	function goBack() {
		window.history.back();
	}
</script>
</head>
<body>
	<table>
		<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.id}</td>
				<td>${list.name}</td>
				<td>${list.age}</td>
				<td>${list.email}</td>
				<td>${list.address}</td>
				<td>${list.gender}</td>
				<td><c:choose>
						<c:when test="${list.id=='admin'}">
							<b>관리자</b>
						</c:when>
						<c:otherwise>
							<a href="memberdelete?id=${list.id}"
								onclick="return confirm('경고! 회원 정보를 삭제하시겠습니까?');">삭제</a>
						</c:otherwise>
					</c:choose></td>
			</tr>
		</c:forEach>
	</table>
	<button onclick="goBack()">뒤로가기</button>
</body>
</html>