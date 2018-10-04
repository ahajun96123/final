<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.jkl.hpot.vo.BoardVO"%>
<%@ page import="com.jkl.hpot.vo.PageInfo"%>
<%@ page import="java.util.*"%>
<%
	List<BoardVO> boardList = (List<BoardVO>) request.getAttribute("boardList");
	//페이징 정보 가져오기
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	int nowPage = pageInfo.getPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int maxPage = pageInfo.getMaxPage();
	int listCount = pageInfo.getListCount();
%>

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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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

<script type="text/javascript">

var category = "${category}";
var which = "${which}";
var arrayCheck = "${array}"
var searchPage = "${search}"
var arrayValue = null

   function pageCheckPlus(nowplus) {
      var arrayValue = null
      if(arrayCheck == 1){
         arrayValue = "평점";
      }else if(arrayCheck == 2){
         arrayValue = "조회";
      }else if(arrayCheck == 3){
         arrayValue = "추천";
      }else if(arrayCheck == 4){
         arrayValue = "인기";
      }
      if(category=="" || category==null){
         if(arrayValue=="" || arrayValue==null){
            if(searchPage=="" || searchPage==null){
               location.href="boardList?page="+nowplus+"&which="+which;
            }else{
               location.href="boardList?page="+nowplus+"&which="+which+"&array="+arrayValue;
            }
         }
      }else if(arrayValue=="" || arrayValue==null){
         if(searchPage=="" || searchPage==null){
            location.href="boardList?page="+nowplus+"&which="+which+"&category="+category;
         }else{
            location.href="boardList?page="+nowplus+"&which="+which+"&category="+category+"&array="+arrayValue;
         }
      }else{
         if(searchPage=="" || searchPage==null){
            location.href="boardList?page="+nowplus+"&which="+which+"&category="+category+"&array="+arrayValue;
         }else{
            location.href="boardList?page="+nowplus+"&which="+which+"&category="+category+"&array="+arrayValue+"&search="+searchPage
         }
      }
   }
   function pageCheck(now) {
      var arrayValue = null
      if(arrayCheck == 1){
         arrayValue = "평점";
      }else if(arrayCheck == 2){
         arrayValue = "조회";
      }else if(arrayCheck == 3){
         arrayValue = "추천";
      }else if(arrayCheck == 4){
         arrayValue = "인기";
      }
      if(category=="" || category==null){
         if(arrayValue=="" || arrayValue==null){
            if(searchPage=="" || searchPage==null){
               location.href="boardList?page="+now+"&which="+which;
            }else{
               location.href="boardList?page="+now+"&which="+which+"&array="+arrayValue;
            }
         }
      }else if(arrayValue=="" || arrayValue==null){
         if(searchPage=="" || searchPage==null){
            location.href="boardList?page="+now+"&which="+which+"&category="+category;
         }else{
            location.href="boardList?page="+now+"&which="+which+"&category="+category+"&array="+arrayValue;
         }
      }else{
         if(searchPage=="" || searchPage==null){
            location.href="boardList?page="+now+"&which="+which+"&category="+category+"&array="+arrayValue;
         }else{
            location.href="boardList?page="+now+"&which="+which+"&category="+category+"&array="+arrayValue+"&search="+searchPage
         }
      }
   }
   function pageCheckMinus(nowminus) {
      var arrayValue = null
      if(arrayCheck == 1){
         arrayValue = "평점";
      }else if(arrayCheck == 2){
         arrayValue = "조회";
      }else if(arrayCheck == 3){
         arrayValue = "추천";
      }else if(arrayCheck == 4){
         arrayValue = "인기";
      }
      if(category=="" || category==null){
         if(arrayValue=="" || arrayValue==null){
            if(searchPage=="" || searchPage==null){
               location.href="boardList?page="+nowminus+"&which="+which;
            }else{
               location.href="boardList?page="+nowminus+"&which="+which+"&array="+arrayValue;
            }
         }
      }else if(arrayValue=="" || arrayValue==null){
         if(searchPage=="" || searchPage==null){
            location.href="boardList?page="+nowminus+"&which="+which+"&category="+category;
         }else{
            location.href="boardList?page="+nowminus+"&which="+which+"&category="+category+"&array="+arrayValue;
         }
      }else{
         if(searchPage=="" || searchPage==null){
            location.href="boardList?page="+nowminus+"&which="+which+"&category="+category+"&array="+arrayValue;
         }else{
            location.href="boardList?page="+nowminus+"&which="+which+"&category="+category+"&array="+arrayValue+"&search="+searchPage
         }
      }
   }

   function arrayList(array){
      var arrayValue = array;
      if(category=="" || category==null){
         location.href="boardList?&which="+which+"&array="+arrayValue;
      }else{
         location.href="boardList?&which="+which+"&category="+category+"&array="+arrayValue;
      }
   }
</script>
<title>List</title>
</head>
<body>
	<div class=container>
		<%@include file="./topui.jsp"%>
		<div style="width: 1130px; height: 1080px;">
			<div style="width: 260px; height: 100%; float: left;">
				<%@include file="./sidebar.jsp"%>
			</div>
			<div style="height: 100%;">
				<c:set var="i" value="0" />
				<c:set var="j" value="3" />
				<ul class="nav nav-tabs">
					<li class="nav-item"><button type="button"
							style="width: 85px;"
							class="nav-link btn-warning border border-light"
							data-toggle="tab" onclick="location='boardList?which=${which}'">전체</button></li>
					<li class="nav-item"><button type="button"
							style="width: 85px;"
							class="nav-link btn-dark border border-light" data-toggle="tab"
							onclick="arrayList('인기');return false;">인기</button></li>
					<li class="nav-item"><button type="button"
							style="width: 85px;"
							class="nav-link btn-warning border border-light"
							data-toggle="tab" onclick="arrayList('평점');return false;">평점
							순</button></li>
					<li class="nav-item"><button type="button"
							style="width: 85px;"
							class="nav-link btn-dark border border-light" data-toggle="tab"
							onclick="arrayList('조회');return false;">조회 순</button></li>
				</ul>

				<div style="border-top: 1px solid orange; magin-top: 30px; width:1110px;">
					<c:choose>
						<c:when test="${which eq '음식' || which eq '영화'}">
							<table id="video" style="margin-left: 50px;">
								<c:forEach var="board" items="${boardList}">
									<c:if test="${i%j == 0 }">
										<tr>
									</c:if>
									<td><c:choose>
											<c:when test="${which eq '음식'}">
												<div class="card border border-warning" id="card"
													style="height: 240px; width: 240px; margin: 15px; padding:0px;">
													<div class="card-body text-center">
														<div style="margin-top:0px;">
															<span style="color: #FF895A">${board.id}</span> <span>/&nbsp;${board.bSubject}</span>
														</div>
														<div class="videoplay">
															<img class="btn-img-rounded" alt="Cinque Terre"
																src="img/${board.bThumbname}"
																style="width: 200px; height: 140px;"
																onclick="location='boardView?bNum=${board.bNum}'">
															<div>
																<div>
																	<span style="color: #FF9614">평점 ${board.bGrade}</span>
																	<span>조회 ${board.bReadcount}</span>
																</div>
																<div>
																	<span style="color: #6478FF">${board.bTag}</span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="card border border-warning" id="card"
													style="height: 340px; width: 240px; margin: 30px;">
													<div class="card-body text-center">
														<div class="videoplay">
															<div>
																<span style="color: #FF895A">${board.id}</span> <span>/&nbsp;${board.bSubject}</span>
															</div>
															<img class="btn-img-rounded" alt="Cinque Terre"
																src="img/${board.bThumbname}"
																style="width: 180px; height: 240px;"
																onclick="location='boardView?bNum=${board.bNum}'">
															<div>
																<div>
																	<span style="color: #FF9614">평점 ${board.bGrade}</span>
																	<span>조회 ${board.bReadcount}</span>
																</div>
																<div>
																	<span style="color: #6478FF">${board.bTag}</span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</c:otherwise>
										</c:choose>
									<td><c:if test="${i%j == j-1 }">
											</tr>
										</c:if> <c:set var="i" value="${i+1 }" />
								</c:forEach>
							</table>
						</c:when>
						<c:otherwise>
							<div class="container">
								<table class="table">
									<tr>
										<th>작성자</th>
										<th>제목</th>
										<th>추천수</th>
										<th>조회수</th>
										<th>작성일</th>
										<th>태그</th>
									</tr>
									<c:forEach var="board" items="${boardList}">
										<tr>
											<td style="color: #FF895A">${board.id}</td>
											<td><a href="boardView?bNum=${board.bNum}">${board.bSubject }</a></td>
											<td style="color: #28C28">${board.bLikecount}</td>
											<td>${board.bReadcount }</td>
											<td>${board.bDate }</td>
											<td style="color: #6478FF">${board.bTag}</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
				<div style="text-align: center; margin-right: 50px">
					<%
						if (nowPage <= 1) {
					%>
					<button type="button" class="btn btn-outline-warning">이전</button>
					<%
						} else {
					%>
					<button type="button" class="btn btn-outline-warning"
						onclick="pageCheckMinus(<%=nowPage - 1%>);return false;">이전</button>
					<%
						}
					%>
					<div class="btn-group">
						<%
							for (int a = startPage; a <= endPage; a++) {
								if (a == nowPage) {
						%>
						<button type="button" class="btn btn-warning"><%=a%></button>
						<%
							} else {
						%>
						<button type="button" class="btn btn-outline-warning"
							onclick="pageCheck(<%=a%>);return false;"><%=a%></button>
						<%
							}
						%>
						<%
							}
						%>
					</div>
					<%
						if (nowPage >= maxPage) {
					%>
					<button type="button" class="btn btn-outline-warning">다음</button>
					<%
						} else {
					%>
					<button type="button" class="btn btn-outline-warning"
						onclick="pageCheckPlus(<%=nowPage + 1%>);return false;">다음</button>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>