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
<title>HoneyPot</title>
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
		<div style="width: 1130px; height: 1080px;">
			<div style="width: 230px; height: 100%; float: left;">
				<%@include file="./sidebar.jsp"%>
			</div>
			<div style="width: 800px; float: left;">
				<table class="table">
					<thead class="thead-light">
						<tr>
							<th colspan="3" align="center">'${idInfo}'님이 팔로우한 멤버들 게시물</th>
						</tr>
						<tr style="height:20px"></tr>
						<c:forEach items="${BoardList }" var="boardList" varStatus="sts">
						<tr>
							<th colspan="2" align="center">'${boardList[sts.index].id}'님의 게시물</th>
							<th><input type="button" id="followBtn${sts.count }" class="btn btn-success" value="팔로우 취소" onclick="follow('${boardList[sts.index].id}', ${sts.count})"></th>
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
							<td>팔로잉 중인 사람이 없습니다.</td>
						</tr>
				</table>
				</c:if>
				
				<button class="btn btn-lg btn-primary btn-block" onclick="goBack()">뒤로가기</button>
			</div>
		</div>
	</div>
<script>
function follow(fid, count) {
	var fBtn = "followBtn"+count;
	console.log(fBtn);
	if(${sessionScope.id == null}){
		alert('로그인을 해주세요');
		return false;
	}
	$.ajax({
		type : "post",
		url : "follow",
		data : {
			"id" : fid
		},
		dataType : "text",
		success : function(data) {
			if (data == "1") {
				$("input[id="+fBtn+"]").attr("class", "btn btn-success");
				$('#'+fBtn).val('팔로우 취소');
			} else {
				$("input[id="+fBtn+"]").attr("class", "btn btn-primary");
				$('#'+fBtn).val('팔로우');
			}
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "error:" + error);
		}
	});
}
</script>
</body>

</html>