<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css?ver=1">
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
	<div class=container>
		<%@include file="./topui.jsp"%>
		<div style="width: 1110px; height: 1300px;">
			<div style="width: 260px; height: 100%; float: left;">
				<%@include file="./sidebar.jsp"%>
			</div>
			<table class="table" style="width: 850px;">
				<tr>
					<th>작성자</th>
					<th>제목</th>
					<th>신고수</th>
				</tr>
				<c:forEach var="board" items="${blindList}">
					<tr>
						<td><a href="MI?id=${board.id}" style="color: #FF895A">${board.id}</a></td>
						<td><a
							href="boardView?bNum=${board.bNum}&id=${sessionScope.id}">${board.bSubject }</a></td>
						<td style="color: #28C28;text-align:center;">${board.bReportcount}</td>
						<td><button class="btn btn-outline-info" onclick="location='blindRelease?num=${board.bNum}&rel=해제'">블라인드 해제</button>
						<button class="btn btn-outline-danger" onclick="location='blindRelease?num=${board.bNum}&rel=삭제'">게시물 삭제</button></td>
					</tr>
					<c:forEach var="report" items="${reportList}">
						<c:if test="${board.bNum == report.bNum}">
							<tr>
								<td><i class="material-icons">subdirectory_arrow_right</i>${report.id}</td>
								<td colspan="3">신고사유 : ${report.reason}</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>