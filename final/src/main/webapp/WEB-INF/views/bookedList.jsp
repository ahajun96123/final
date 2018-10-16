<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.jkl.hpot.vo.BoardVO"%>
<%@ page import="com.jkl.hpot.vo.PageInfo"%>
<%@ page import="java.util.*"%>
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
<title>Insert title here</title>
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
		<div style="width: 1130px; height: 1080px;">
			<div style="width: 260px; height: 100%; float: left;">
				<%@include file="./sidebar.jsp"%>
			</div>
			<div style="width: 850px; float: left;">
				<table class="table">
					<thead class="thead-light">
						<tr>
							<th colspan="6" align="center">'${idInfo}'님이 북마크한 게시물</th>
						</tr>
						<tr>
							<th>썸네일</th>
							<th>제목</th>
							<th>태그</th>
							<th>글쓴이</th>
							<th>등록일자</th>
							<th>북마크</th>
						</tr>
					<c:forEach items="${bookedList}" var="myBoardList" varStatus="sts">
						<tr>
							<td><img class="photo" src="resources/img/${myBoardList.bThumbname}" alt="썸네일" style="width: 218px; height: 140px; margin: auto"></td>
							<td><a href = "boardView?bNum=${myBoardList.bNum}&id=${myBoardList.id}">${myBoardList.bSubject}</a></td>
							<td>${myBoardList.bContent}</td>
							<td>${myBoardList.id}</td>
							<td>${myBoardList.bDate}</td>
							<td><input type="button" id="bookBtn${sts.count }" class="btn btn-secondary" value="북마크 취소" onclick="bookMark(${myBoardList.bNum}, ${sts.count})"></td>
						</tr>
					</c:forEach>
				</table>
				<c:if test = "${bookedList == null}">
				<table>
					<tr>
						<td><a>북마크한 게시물이 존재하지 않습니다.</a></td>
					</tr>
				</table>
				</c:if>
				
				<button class="btn btn-lg btn-primary btn-block" onclick="goBack()">뒤로가기</button>
			</div>
		</div>
	</div>
</body>
<script>
function bookMark(bNum, count) {
	var bId = "bookBtn"+count;
	if(${sessionScope.id == null}){
		alert('로그인을 해주세요');
		return false;
	}
	$.ajax({
		type : "post",
		url : "bookMark",
		data : {
			"bNum" : bNum
		},
		dataType : "text",
		success : function(data) {
			if (data == "1") {
				$("input[id="+bId+"]").attr("class", "btn btn-secondary");
				$('#'+bId).val('북마크 취소');
			} else {
				$("input[id="+bId+"]").attr("class", "btn btn-info");
				$('#'+bId).val('북마크');
			}
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "error:" + error);
		}
	});
}
</script>
</html>