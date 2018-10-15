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
<style>
      
</style>
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
							<th colspan="3" align="center">'${idInfo}'님이 팔로우한 멤버들 게시물</th>
						</tr>
						<tr style="height:20px"></tr>
						<c:forEach items="${BoardList }" var="boardList" varStatus="sts">
						<tr>
							<th colspan="3" align="center">'${boardList[sts.index].id}'님의 게시물</th>
						</tr>
						<tr>
							<c:set var="loop_flag" value="false" />
							<c:forEach items="${boardList}" var="board" varStatus="sts2">
							<c:if test="${not loop_flag }">
							<td>
								<c:choose>
									<c:when test="${board.bBlind==1}">
										<div class="card" id="card"
											style="height: 220px; width: 220px; margin: 15px; padding: 0px; background-color: #c8c8c8; box-shadow: 6px 6px 10px 0px gray;">
											<span style="margin: 10px;">다수의 신고로 인해 블라인드 처리
												되었습니다.</span> <img src="img/honeypot3.png"
												style="height: 100px; width: 180px; margin: auto;">
										</div>
									</c:when>
									<c:otherwise>
										<div class="card" id="card"
											style="height: 220px; width: 220px; margin: 15px; padding: 0px; background-color: #c8c8c8; box-shadow: 6px 6px 10px 0px gray;">
											<div>
												<div style="border-bottom: 1px solid gray;">
													<span
														style="font-weight: bold; border-right: 1px solid gray;">&nbsp;${board.bWhich}&nbsp;</span>
													<c:choose>
														<c:when test="${fn:length(board.bSubject) > 14}">
															<span style="font-size: 12px;">&nbsp;<c:out
																	value="${fn:substring(board.bSubject,0,13)}" />...
															</span>
														</c:when>
														<c:otherwise>
															<span style="font-size: 12px;"><c:out
																	value="${board.bSubject}" /></span>
														</c:otherwise>
													</c:choose>
												</div>
												<div class="videoplay">
													<img class="btn-img-rounded" data-toggle="popover"
														data-trigger="hover"
														data-content="${fn:substring(board.bContent,0,20)}..."
														src="img/${board.bThumbname}"
														style="width: 218px; height: 140px; margin: auto"
														onclick="location='boardView?bNum=${board.bNum}&id=${sessionScope.id}'">
													<div>
														<div
															style="border-top: 1px solid gray; font-size: 12px;">
															<span style="color: #FF9614">평점
																${board.bGrade}</span> <span class="text-info">조회
																${board.bReadcount}</span> <span>${board.bDate}</span>
														</div>
														<div>
															<span style="color: #6478FF; font-size: 12px;">${board.bTag}</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</td>
							<c:if test="${sts2.count eq 3 }">
								<td>
								<form action="myBoard?idInfo=${board.id}" method="post">
									<button class="btn btn-warning">더보기</button>
									<input type = "hidden" name="id" value = "${board.id}">
								</form>
								</td>
								<c:set var="loop_flag" value="true" />
							</c:if>
							</c:if>
							</c:forEach>
						</tr>
						</c:forEach><%-- 
					<c:forEach items="${myBoardList}" var="myBoardList">
						<tr>
							<td><img class="photo" src="resources/img/${myBoardList.bThumbname}" alt="썸네일" style="width: 218px; height: 140px; margin: auto"></td>
							<td><a href = "boardView?bNum=${myBoardList.bNum}">${myBoardList.bSubject}</a></td>
							<td>${myBoardList.bContent}</td>
							<td>${myBoardList.bDate}</td>
						</tr>
					</c:forEach> --%>
				</table>
				<c:if test = "${BoardList == null}">
				<table>
						<tr>
							<td><a>검색결과가 존재하지 않습니다.</a></td>
						</tr>
				</table>
				</c:if>
				
				<button class="btn btn-lg btn-primary btn-block" onclick="goBack()">뒤로가기</button>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript -->
	<script
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
		crossorigin="anonymous"></script>
	<script>
		// Get the modal
		var modal = document.getElementById('userMod');

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn2");

		var cancle = document.getElementById("cancle");

		// When the user clicks on the button, open the modal 
		btn.onclick = function() {
			modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		cancle.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
</body>
</html>