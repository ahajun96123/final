<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">


<style>
#talkbubble {
	width: 100px;
	height: 20px;
	background: green;
	position: relative;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 10px;
}

#talkbubble:before {
	content: "";
	position: absolute;
	right: 100%;
	top: 0px;
	width: 0;
	height: 0;
	border-top: 1px solid transparent;
	border-right: 1px solid red;
	border-bottom: 1px solid transparent;
}
</style>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css?ver=2">
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
<script type="text/javascript">
	var loginCheck="<%=session.getAttribute("id")%>";
	var which = "${view.bWhich}";
	var num = "${view.bNum}";
	var idCheck = "${view.id}";

	function postCheck() {
		if (loginCheck == null || loginCheck == "") {
			alert("로그인을 해주세요.");
		} else {
			location.href = "postCheck?which=" + which;
		}
	}

	function DeleteCheck() {
		if (loginCheck == null || loginCheck == "") {
			alert("로그인을 해주세요.");
		} else {
			if (loginCheck == idCheck || loginCheck=="admin") {
				location.href = "boardDelete?bNum=" + num + "&which=" + which;
			} else {
				alert("잘못된 요청입니다. (아이디 불일치)");
			}
		}
	}

	function ModifyCheck() {
		if (loginCheck == null || loginCheck == "") {
			alert("로그인을 해주세요.");
		} else {
			if (loginCheck == idCheck) {
				location.href = "boardModify?bNum=" + num
			} else {
				alert("잘못된 요청입니다. (아이디 불일치)");
			}
		}
	}
</script>
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
			<div style="width: 1110px; height: 100%;">
				<div class="container">
					<div style="height: 50px;"></div>
					<table class="table table-bordered" style="width: 850px;">
						<tr>
							<th>제목</th>
							<td>${view.bSubject}</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>
								<div>
									<a href="memberInfo?id=${view.id }" id="idHover">${view.id}</a>
								</div>
								<div id="talkbubble" style="display: none;">
									<input type="button" id="checkbtn"
										onclick="follow()" value="중복확인" />&nbsp;|&nbsp;<a href="">좋아요</a>
								</div>
							</td>
						</tr>
						<c:choose>
							<c:when test="${view.bWhich eq '음식'||view.bWhich eq '영화'}">
								<th>평점</th>
								<td>${view.bGrade}</td>
							</c:when>
							<c:otherwise>
								<th>추천</th>
								<td>${view.bLikecount}</td>
							</c:otherwise>
						</c:choose>
						</tr>
						<c:choose>
							<c:when test="${view.bWhich eq '음식'}">
								<tr>
									<th>음식 종류</th>
									<td>${view.bCategory}</td>
									<th>태그</th>
									<td>${view.bTag}</td>
								</tr>
							</c:when>
							<c:when test="${view.bWhich eq '영화'}">
								<tr>
									<th>영화 장르</th>
									<td>${view.bCategory}</td>
									<th>태그</th>
									<td>${view.bTag}</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<th>지름좌표</th>
									<td><a href="${view.bUrl}">${view.bUrl}</a></td>
									<th>태그</th>
									<td>${view.bTag}</td>
								</tr>
							</c:otherwise>
						</c:choose>
						<tr>
							<th>작성일</th>
							<td>${view.bDate}</td>
							<th>조회수</th>
							<td>${view.bReadcount}</td>
						</tr>
						<tr>
							<th colspan="4" align="center">내용</th>
						</tr>
						<tr>
							<td colspan="4" rowspan="3"><img
								src="img/${view.bThumbname}">${view.bContent}</td>
						</tr>
					</table>
					<div style="margin-right: 10px; float: right">
						<input class="btn btn-warning" type="button" value="수정"
							onclick="ModifyCheck()">
					</div>
					<div style="margin-right: 10px; float: right">
						<input class="btn btn-warning" type="button" value="삭제"
							onclick="DeleteCheck()">
					</div>
					<div style="margin-right: 10px; float: right">
						<input class="btn btn-warning" type="button" value="목록"
							onclick="location='boardList?which=${view.bWhich}'">
					</div>
					<div style="height: 30px"></div>
					<form action="boardComment" method="post">
						<div class="input-group mb-3"
							style="margin-top: 10px; width: 850px">
							<div class="input-group-prepend">
								<textarea cols="95" rows="3" name="cContent"
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
</body>
<script>
	function follow() {
		var idbox = document.getElementById("idbox");
		$.ajax({
			type : "post",
			url : "follow",
			data : {
				"id" : ${veiw.id}
			},
			dataType : "text",
			success : function(data) {
				if (data == "1") {
					alert("이 아이디는 사용 가능합니다!.");
					$("input[id=idbox]").attr("readonly", true);
					$('#checkbtn').attr('disabled', true);
					$('#chch').attr('onSubmit', true);
				} else {
					alert("이 아이디는 사용할 수 없습니다.");
				}
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "error:" + error);
			}
		});
	}
</script>
<script>
	$("#idHover").hover(function() {
		$("#talkbubble").show();
	}, function() {
		/* $("#talkbubble").hide(); */
		//일단 위에 것은 기능 구현 하고 작업
		$("#talkbubble").show();
	});
</script>
</html>