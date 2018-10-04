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
<!-- Our Custom CSS -->
<!-- <link rel="stylesheet" href="style5.css"> -->

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
<title>View</title>
</head>
<body>
	<div class=container>
		<%@include file="./topui.jsp"%>
		<div style="width: 1130px; height: 1080px;">
			<div style="width: 260px; height: 100%; float: left;">
				<%@include file="./sidebar.jsp"%>
			</div>
			<div style="height: 100%;">
				<div class="container">
					<div style="height: 50px;"></div>
					<table class="table table-bordered">
						<tr>
							<th>제목</th>
							<td>${view.bSubject}</td>
						</tr>
						<c:choose>
							<c:when test="${view.bWhich eq '음식'||view.bWhich eq '영화'}">
								<tr>
									<th>평점</th>
									<td>${view.bGrade}</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<th>추천</th>
									<td>${view.bLikecount}</td>
								</tr>
							</c:otherwise>
						</c:choose>
						<tr>
							<th>조회수</th>
							<td>${view.bReadcount}</td>
						</tr>
						<c:choose>
							<c:when test="${view.bWhich eq '음식'}">
								<tr>
									<th>음식 종류</th>
									<td>${view.bCategory}</td>
								</tr>
							</c:when>
							<c:when test="${view.bWhich eq '영화'}">
								<tr>
									<th>영화 장르</th>
									<td>${view.bCategory}</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<th>지름좌표</th>
									<td><a href="${view.bUrl}">${view.bUrl}</a></td>
								</tr>
							</c:otherwise>
						</c:choose>
						<tr>
							<th>태그</th>
							<td>${view.bTag}</td>
						</tr>
						<tr>
							<th>작성일</th>
							<td>${view.bDate}</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>${view.bContent}</td>
						</tr>
					</table>
					<div style="margin-right: 10px; float: right">
						<input class="btn btn-warning" type="button" value="수정"
							onclick="location='modifyForm?bNum=${view.bNum}'">
					</div>
					<div style="margin-right: 10px; float: right">
						<input class="btn btn-warning" type="button" value="삭제"
							onclick="location='boardDelete?bNum=${view.bNum}&which=${view.bWhich}'">
					</div>
					<div style="margin-right: 10px; float: right">
						<input class="btn btn-warning" type="button" value="목록"
							onclick="location='boardList?which=${view.bWhich}'">
					</div>
					<div style="height: 30px"></div>
					<form action="boardComment" method="post">
						<div class="input-group mb-3" style="margin-top: 10px;">
							<div class="input-group-prepend">
								<textarea cols="123" rows="3" name="cContent"
									class="form-control"></textarea>
							</div>
							<input type="hidden" name="bNum" value="${view.bNum}"> <input
								type="hidden" name="id" value="${view.id}">
							<button class="input-group-text" type="submit">댓글등록</button>
						</div>
					</form>
					<div>
						<c:forEach var="comment" items="${commentList}">
							<div>
								<span style="color: #FF895A">${comment.id}</span> <span>${comment.cDate }</span>
							</div>
							<div>
								<span>${comment.cContent}</span>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>