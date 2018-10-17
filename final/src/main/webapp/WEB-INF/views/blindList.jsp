<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css?ver=2">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>게시물 관리</title>
</head>
<body>
	<div style="height: 200px">
		<div class="container">
			<table class="table" style="width: 850px;">
				<tr>
					<th>작성자</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
				<c:forEach var="board" items="${blindList}">
					<tr>
						<td><a href="MI?id=${board.id}" style="color: #FF895A">${board.id}</a></td>
						<td><a
							href="boardView?bNum=${board.bNum}&id=${sessionScope.id}">${board.bSubject }</a></td>
						<td style="color: #28C28">${board.bLikecount}</td>
					</tr>
					<c:forEach var="report" items="${reportList}">
						<c:if test="${board.bNum == report.bNum}">
							<tr>
								<td>${report.id}</td>
								<td colspan="2">${report.reason}</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>