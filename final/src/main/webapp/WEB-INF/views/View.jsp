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
			if (loginCheck == idCheck) {
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
	
	function GradeCheck() {
		var grade = document.getElementById("grade").value;	
		if(grade > 1 && grade < 5) {
			document.getElementById("gradeForm").submit();
		}else{
			alert("1.0~5.0 사이의 평점으로 등록해주세요.")
		}
	}
</script>
<meta charset="UTF-8">
<title>View</title>
</head>
<body>
	<div class="container">
		<%@include file="./topui.jsp"%>
		<div style="width: 1130px; height: 1080px;">
			<div style="width: 230px; height: 100%; float: left">
				<%@include file="./sidebar.jsp"%>
			</div>
			<div style="width: 850px; height: 100%; float: left">
				<div style="height: 50px;"></div>
				<table class="table table-bordered" style="width: 850px;">
					<tr>
						<th>[${view.bCategory }]</th>
						<td colspan="7">${view.bSubject}&nbsp;&nbsp;<c:if
								test="${commentcount > 1}">
								<span style="color: green">[${commentcount}]</span>&nbsp;&nbsp;
						</c:if> <span style="color: blue">${view.bTag}</span></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<div>
								<a style="color: #FF895A" href="memberInfo?id=${view.id }"
									id="idHover">${view.id}</a>
							</div>
							<div id="talkbubble" style="display: none;">
								<button type="button" id="checkbtn" onclick="follow()">구독</button>
								&nbsp;|&nbsp;<a href="">좋아요</a>
							</div>
						</td>
						<th>작성일</th>
						<td>${view.bDate}</td>
						<th>조회수</th>
						<td>${view.bReadcount}</td>
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
					<c:if test="${view.bWhich eq '지름'}">
						<tr>
							<th>지름좌표</th>
							<td colspan="7"><a href="${view.bUrl}">${view.bUrl}</a></td>
						</tr>
					</c:if>
					<tr>
						<td colspan="8" rowspan="10"><img
							src="img/${view.bThumbname}" style="width: 300px; height: auto;">${view.bContent}</td>
					</tr>
				</table>
				<div class="btn-group" style="float: right">
					<button class="btn btn-success" data-toggle="modal"
						data-target="#Grade">평점 매기기</button>
					<c:if test="${sessionScope.id == view.id}">
						<button class="btn btn-warning" type="button"
							onclick="ModifyCheck()">수정</button>
						<button class="btn btn-warning" type="button"
							onclick="DeleteCheck()">삭제</button>
					</c:if>
					<button class="btn btn-warning" type="button"
						onclick="location='boardList?which=${view.bWhich}'">목록</button>
				</div>
				<div style="height: 30px"></div>
				<span style="color: #aaaaaa">Total ${commentcount} Comments
					─────────</span>
				<div>
					<c:forEach var="comment" items="${commentList}">
						<div class="border border-muted" style="padding: 15px;">
							<div>
								<span style="color: #FF895A">${comment.id}</span> <span>${comment.cDate }</span>
							</div>
							<div>
								<span>${comment.cContent}</span>
							</div>
						</div>
					</c:forEach>
				</div>
				<form action="boardComment" method="post">
					<div class="input-group mb-3"
						style="margin-top: 10px; width: 850px; text-align: center">
						<div class="input-group-prepend">
							<textarea cols="95" rows="3" name="cContent" class="form-control"></textarea>
						</div>
						<input type="hidden" name="bNum" value="${view.bNum}"> <input
							type="hidden" name="id" value="${view.id}">
						<button class="input-group-text" type="submit">댓글등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- The Modal -->
	<div class="modal fade" id="Grade">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">평점 매기기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<form action="boardGrade" method="post" id="gradeForm">
					<!-- Modal body -->
					<div class="modal-body">
					<span>한 게시물에 대하여 1회 가능하며 등록한 평점은 취소가 불가능합니다.</span>
						<input type="hidden" name="id" value="${view.id}"> <input
							type="hidden" name="bNum" value="${view.bNum}"> <input
							type="text" name="grade" class="form-control" placeholder="평점범위 : 1.0~5.0" id="grade">
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button class="btn btn-success" type="button"
							onclick="GradeCheck()">등록</button>
					</div>
				</form>
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
			}
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