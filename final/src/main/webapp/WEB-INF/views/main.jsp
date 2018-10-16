<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
<style>
b {
	font-size: 25px;
}

.contentContainer {
	border-top: 1px solid;
	border-bottom: 1px solid;
	width: 1110px;
}
</style>
<script type="text/javascript">
	var which = ""

	function postCheck() {
		location.href = "postCheck?which=" + which
	}
</script>

<script>

// 타임아웃에 인한 로그아웃 처리를 수행할 스크립트 함수
function expireSession()
{

  alert("세션이 만료되었습니다.");

  window.reload(true); // 파라메터를 true 로 하면 서버에서 reload .. false 로 하면 로컬에서 reload 한다.
}

 

//setTimeout() 함수를 사용하여 세션유효시간 후에 수행 함수를 호출한다. (비동기)
setTimeout('expireSession()', <%= request.getSession().getMaxInactiveInterval() * 1000 %>);
</script>
<title>HoneyPot</title>
<link rel="shortcut icon" href="resources/img/honeypot.jpg">
</head>
<body style="background-color: #dcdcdc">
	<div class=container>
		<%@include file="./topui.jsp"%>
		<div style="width: 1130px; height: 1500px;">
			<div style="width: 230px; height: 100%; float: left;">
				<%@include file="./sidebar.jsp"%>
			</div>
			<div>
				<c:if test="${sessionScope.id !=null }">
					<b>맞춤</b>
					<br>
					<div class="contentContainer">
						<c:set var="i" value="0" />
						<c:set var="j" value="3" />
						<c:set var="food" value="1"/>
						<c:set var="movie" value="1"/>
						<c:set var="hotdeal" value="1"/>
						<table id="video" style="margin-left: 50px;">
							<c:forEach var="board" items="${fitList}">
								<c:if test="${board.bWhich =='음식'}">
									<c:if test="${board.bBlind == 0 }">
										<c:if test="${i<3 }">
											<c:if test="${i%j == 0 }">
												<tr>
											</c:if>
											<td>
												<div class="card" id="card"
													style="height: 220px; width: 220px; margin: 15px; padding: 0px; background-color: #c8c8c8; box-shadow: 6px 6px 10px 0px gray;">
													<div>
														<div style="border-bottom: 1px solid gray;">
															<span
																style="font-weight: bold; border-right: 1px solid gray;">&nbsp;${board.id}&nbsp;</span>
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
																	<span style="color: #FF9614">평점 ${board.bGrade}</span>
																	<span class="text-info">조회 ${board.bReadcount}</span> <span>${board.bDate}</span>
																</div>
																<div>
																	<span style="color: #6478FF; font-size: 12px;">${board.bTag}</span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</td>
											<c:if test="${i%j == j-1 }">
												</tr>
											</c:if>
											<c:set var="i" value="${i+1 }" />
										</c:if>
									</c:if>
								</c:if>
							</c:forEach>
						</table>
						<table id="video" style="margin-left: 50px;">
							<c:forEach var="board" items="${fitList}">
								<c:if test="${board.bWhich =='영화'}">
									<c:if test="${board.bBlind == 0 }">
										<c:if test="${i<3 }">
											<c:if test="${i%j == 0 }">
												<tr>
											</c:if>
											<td>
												<div class="card" id="card"
													style="height: 360px; width: 220px; margin: 15px; padding: 0px; background-color: #c8c8c8; box-shadow: 6px 6px 10px 0px gray;">
													<div>
														<div style="border-bottom: 1px solid gray;">
															<span
																style="font-weight: bold; border-right: 1px solid gray;">&nbsp;${board.id}&nbsp;</span>
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
																style="width: 218px; height: 280px; margin: auto"
																onclick="location='boardView?bNum=${board.bNum}&id=${sessionScope.id}'">
															<div>
																<div
																	style="border-top: 1px solid gray; font-size: 12px;">
																	<span style="color: #FF9614">평점 ${board.bGrade}</span>
																	<span class="text-info">조회 ${board.bReadcount}</span> <span>${board.bDate}</span>
																</div>
																<div>
																	<span style="color: #6478FF; font-size: 12px;">${board.bTag}</span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</td>
											<c:if test="${i%j == j-1 }">
												</tr>
											</c:if>
											<c:set var="i" value="${i+1 }" />
										</c:if>
									</c:if>
								</c:if>
							</c:forEach>
						</table>
					</div>
				</div>
				<br> <b>채널(회원)</b> <br>
				<div class="contentContainer"></div>
				<br> <b>주제</b> <br>
				
				<div class="contentContainer"></div>
				<br>
				</c:if>
			</div>
			<b>인기 <i class="material-icons" style="font-size: 18px">restaurant</i>
				Food
			</b> <br>
			<c:set var="i" value="0" />
			<c:set var="j" value="3" />
			<div class="contentContainer">
				<table id="video" style="margin-left: 50px;">
					<c:forEach var="board" items="${bestmain}">
						<c:if test="${board.bWhich =='음식'}"> 
							<c:if test="${board.bBlind == 0 }">
								<c:if test="${food<4 }">
									<c:if test="${i%j == 0 }">
										<tr>
									</c:if>
									<td>
										<div class="card" id="card"
											style="height: 220px; width: 220px; margin: 15px; padding: 0px; background-color: #c8c8c8; box-shadow: 6px 6px 10px 0px gray;">
											<div>
												<div style="border-bottom: 1px solid gray;">
													<span
														style="font-weight: bold; border-right: 1px solid gray;">&nbsp;${board.id}&nbsp;</span>
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
														<div style="border-top: 1px solid gray; font-size: 12px;">
															<span style="color: #FF9614">평점 ${board.bGrade}</span> <span
																class="text-info">조회 ${board.bReadcount}</span> <span>${board.bDate}</span>
														</div>
														<div>
															<span style="color: #6478FF; font-size: 12px;">${board.bTag}</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
									<c:if test="${i%j == j-1 }">
										</tr>
									</c:if>
									<c:set var="i" value="${i+1 }" />
									<c:set var="food" value="${food+1 }"/>
								</c:if>
							</c:if>
						</c:if>
					</c:forEach>
				</table>
			</div>
			<br> <b>인기 <i class="material-icons" style="font-size: 18px">local_movies</i>
				Movie
			</b> <br>
			<div class="contentContainer">
				<table id="video" style="margin-left: 50px;">
					<c:forEach var="board" items="${bestmain}">
						<c:if test="${board.bWhich =='영화'}">
							<c:if test="${board.bBlind == 0 }">
								<c:if test="${movie<4 }">
									<c:if test="${i%j == 0 }">
										<tr>
									</c:if>
									<td>
										<div class="card" id="card"
											style="height: 360px; width: 220px; margin: 15px; padding: 0px; background-color: #c8c8c8; box-shadow: 6px 6px 10px 0px gray;">
											<div>
												<div style="border-bottom: 1px solid gray;">
													<span
														style="font-weight: bold; border-right: 1px solid gray;">&nbsp;${board.id}&nbsp;</span>
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
														style="width: 218px; height: 280px; margin: auto"
														onclick="location='boardView?bNum=${board.bNum}&id=${sessionScope.id}'">
													<div>
														<div style="border-top: 1px solid gray; font-size: 12px;">
															<span style="color: #FF9614">평점 ${board.bGrade}</span> <span
																class="text-info">조회 ${board.bReadcount}</span> <span>${board.bDate}</span>
														</div>
														<div>
															<span style="color: #6478FF; font-size: 12px;">${board.bTag}</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
									<c:if test="${i%j == j-1 }">
									</c:if>
									<c:set var="i" value="${i+1 }" />
									<c:set var="movie" value="${movie+1 }"/>
								</c:if>
							</c:if>
						</c:if>
					</c:forEach>
				</table>
			</div>
			<br> <b>인기 <i class="material-icons" style="font-size: 18px">shopping_cart</i>
				Hot Deal
			</b> <br>
			<div class="contentContainer">
				<table class="table" style="width: 850px;">
					<tr>
						<th>작성자</th>
						<th>제목</th>
						<th>추천수</th>
						<th>조회수</th>
						<th>작성일</th>
						<th>태그</th>
					</tr>
					<c:forEach var="board" items="${bestmain}">
						<c:if test="${board.bWhich =='지름'}">
							<c:if test="${board.bBlind == 0 }">
								<c:if test="${hotdeal<6 }">
									<tr>
										<td style="color: #FF895A">${board.id}</td>
										<td><a
											href="boardView?bNum=${board.bNum}&id=${sessionScope.id}">${board.bSubject }</a></td>
										<td style="color: #28C28">${board.bLikecount}</td>
										<td>${board.bReadcount }</td>
										<td>${board.bDate }</td>
										<td style="color: #6478FF">${board.bTag}</td>
									</tr>
									<c:set var="hotdeal" value="${hotdeal+1 }"/>
								</c:if>
							</c:if>
						</c:if>
					</c:forEach>
				</table>
			</div>
			<br>
		</div>
	</div>
	</div>
</body>
<script>
	
</script>
</html>