<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css?ver=2">

<!-- ajax -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

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
	var loginCheck="${sessionScope.id}";
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
				location.href = "modifyForm?bNum=" + num
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
<title>HoneyPot</title>
<link rel="shortcut icon" href="resources/img/honeypot.jpg">
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
						<c:if test="${view.id != sessionScope.id }">
							<td colspan="5">${view.bSubject}&nbsp;&nbsp;<c:if
									test="${commentcount > 0}">
									<span style="color: green">[${commentcount}]</span>&nbsp;&nbsp;
							</c:if> <span style="color: blue">${view.bTag}</span></td>
							<td>
								<div>
									<input type="button" id="bookBtn" class="btn btn-info"
										onclick="bookMark()" value="북마크" />
								</div>
							</td>
						</c:if>
						<c:if test="${view.id == sessionScope.id }">
							<td colspan="6">${view.bSubject}&nbsp;&nbsp;<c:if
									test="${commentcount > 1}">
									<span style="color: green">[${commentcount}]</span>&nbsp;&nbsp;
							</c:if> <span style="color: blue">${view.bTag}</span></td>
						</c:if>
						<td>
							<div>
								<input type="button" id="followBtn" class="btn btn-primary"
									onclick="follow()" value="팔로우" />
							</div>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<div>
								<a style="color: #FF895A"
									href="memberinfomation?idInfo=${view.id }">${view.id}</a>
							</div>
						</td>
						<th>작성일</th>
						<td>${view.bDate}</td>
						<th>조회수</th>
						<td>${view.bReadcount}</td>
						<c:choose>
							<c:when test="${view.bWhich eq '음식'||view.bWhich eq '영화'}">
								<th>평점</th>
								<td>${view.bGrade}<c:if test="${gradeCount > 0}">
										<span style="color: green">&nbsp;[평가수:&nbsp;${gradeCount}]</span>
									</c:if>
								</td>
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
						<c:choose>
							<c:when test="${view.bWhich eq '음식'||view.bWhich eq '영화'}">
								<td colspan="8" rowspan="10"><img
									src="img/${view.bThumbname}"
									style="width: 300px; height: auto;">${view.bContent}</td>
							</c:when>
							<c:otherwise>
								<td colspan="8" rowspan="10">${view.bContent}</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</table>
				<c:if test="${view.bWhich eq '음식'}">
					<c:if test="${view.mapu != null}">
						<!-- 이미지 지도를 표시할 div 입니다 -->
						<div id="staticMap" style="width: 600px; height: 350px;"></div>

						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b3c8dc6b57f4a90c120d1e51fc22e505"></script>
						<script>
					// 이미지 지도에서 마커가 표시될 위치입니다 
					var markerPosition  = new daum.maps.LatLng(${view.mapu}, ${view.mapk});

					// 이미지 지도에 표시할 마커입니다
					// 이미지 지도에 표시할 마커는 Object 형태입니다
					var marker = {
    					position: markerPosition
					};

					var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
    				staticMapOption = { 
        			center: new daum.maps.LatLng(${view.mapu}, ${view.mapk}), // 이미지 지도의 중심좌표
        			level: 3, // 이미지 지도의 확대 레벨
        			marker: marker // 이미지 지도에 표시할 마커 
    				};    

					// 이미지 지도를 생성합니다
					var staticMap = new daum.maps.StaticMap(staticMapContainer, staticMapOption);
					</script>
					</c:if>
				</c:if>
				<div class="btn-group" style="float: right">
					<c:choose>
						<c:when test="${view.bWhich eq '음식'||view.bWhich eq '영화'}">
							<c:if test="${sessionScope.id ne view.id}">
								<c:if test="${gradeValue == null}">
									<button class="btn btn-success" data-toggle="modal"
										data-target="#Grade">평점 매기기</button>
								</c:if>
								<c:if test="${gradeValue != null}">
									<button class="btn btn-secondary" data-target="#Grade"
										disabled="disabled">(${gradeValue.grade}점)평점주기 완료</button>
								</c:if>
							</c:if>
						</c:when>
						<c:when test="${view.bWhich eq '지름'}">
							<c:if test="${sessionScope.id ne view.id}">
								<c:if test="${likeValue == null}">
									<button class="btn btn-success" data-toggle="modal"
										data-target="#Like">추천</button>
								</c:if>
							</c:if>
						</c:when>
					</c:choose>
					<c:if test="${sessionScope.id ne view.id && sessionScope.id != null}">
						<c:if test="${reportValue == null}">
							<button class="btn btn-danger" data-toggle="modal"
								data-target="#Report">신고</button>
						</c:if>
					</c:if>
					<c:if test="${sessionScope.id == view.id}">
						<button class="btn btn-warning" type="button"
							onclick="ModifyCheck()">수정</button>
						<button class="btn btn-danger" data-toggle="modal"
							data-target="#Delete">삭제</button>
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
						<span>&nbsp;한 게시물에 대하여 1회 가능하며 등록한 평점은 취소가 불가능합니다.</span> <input
							type="hidden" name="id" value="${sessionScope.id}"> <input
							type="hidden" name="bNum" value="${view.bNum}"> <input
							type="text" name="grade" class="form-control"
							placeholder="평점범위 : 1.0~5.0" id="grade">
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button class="btn btn-info" type="button" onclick="GradeCheck()">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="Like">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">게시물 추천</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<form action="boardLike" method="post">
					<!-- Modal body -->
					<div class="modal-body">
						<span>&nbsp;한 게시물에 대하여 1회 가능하며 반영된 추천은 취소가 불가능합니다.</span> <input
							type="hidden" name="id" value="${sessionScope.id}"> <input
							type="hidden" name="bNum" value="${view.bNum}">
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button class="btn btn-info" type="submit">추천하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="Report">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">게시물 신고</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<form action="boardReport" method="post">
					<!-- Modal body -->
					<div class="modal-body">
						<span>&nbsp;한 게시물에 대하여 1회 가능하며 반영된 신고는 취소가 불가능합니다.</span> <span>&nbsp;신고를
							3회 이상 받은 게시물은 블라인드 처리됩니다.</span> <input type="hidden" name="id"
							value="${sessionScope.id}"> <input type="hidden"
							name="bNum" value="${view.bNum}"> <input type="text"
							name="reason" class="form-control" placeholder="신고 사유를 적어주세요.">
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button class="btn btn-danger" type="submit">신고</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="Delete">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">게시물 삭제</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<span>&nbsp;게시물을 삭제 하시겠습니까?</span>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button class="btn btn-danger" type="button"
						onclick="DeleteCheck()">삭제</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function follow() {
		if(${sessionScope.id == null}){
			alert('로그인을 해주세요');
			return false;
		}
		var id = "${view.id}";
		$.ajax({
			type : "post",
			url : "follow",
			data : {
				"id" : id
			},
			dataType : "text",
			success : function(data) {
				if (data == "1") {
					$("input[id=followBtn]").attr("class", "btn btn-success");
					$('#followBtn').val('√팔로잉');
				} else {
					$("input[id=followBtn]").attr("class", "btn btn-primary");
					$('#followBtn').val('팔로우');
				}
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "error:" + error);
			}
		});
	}
	function bookMark() {
		if(${sessionScope.id == null}){
			alert('로그인을 해주세요');
			return false;
		}
		var bNum = "${view.bNum}";
		$.ajax({
			type : "post",
			url : "bookMark",
			data : {
				"bNum" : bNum
			},
			dataType : "text",
			success : function(data) {
				if (data == "1") {
					$("input[id=bookBtn]").attr("class", "btn btn-secondary");
					$('#bookBtn').val('√북마크됨');
				} else {
					$("input[id=bookBtn]").attr("class", "btn btn-info");
					$('#bookBtn').val('북마크');
				}
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "error:" + error);
			}
		});
	}
</script>
<script>
window.onload=ifFollow(), ifBookMark();
function ifFollow(){
	if(${sessionScope.id == null}){
		return false;
	} else if(${view.id == sessionScope.id}){
		$('#followBtn').val('내 게시물');
		$('#followBtn').attr('disabled', true);
		$("input[id=followBtn]").attr("class", "btn btn-light");
		return false;
	} else{
		var id = "${view.id}";
		$.ajax({
			type : "post",
			url : "followCheck",
			data : {
				"id" : id
			},
			dataType : "text",
			success : function(data) {
				if (data == "1") {
					//팔로우
					//$("input[id=followBtn]").attr("class", "btn btn-primary");
				} else {
					//팔로우취소
					$("input[id=followBtn]").attr("class", "btn btn-success");
					$('#followBtn').val('√팔로잉');
				}
				/* if (data == "1") {
					alert("이 아이디는 사용 가능합니다!.");
					$("input[id=idbox]").attr("readonly", true);
					$('#checkbtn').attr('disabled', true);
					$('#chch').attr('onSubmit', true);
				} else {
					alert("이 아이디는 사용할 수 없습니다.");
				} */
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "error:" + error);
			}
		});
	}
}
function ifBookMark(){
	if(${sessionScope.id == null}){
		return false;
	} else{
		var bNum = "${view.bNum}";
		$.ajax({
			type : "post",
			url : "bookCheck",
			data : {
				"bNum" : bNum
			},
			dataType : "text",
			success : function(data) {
				if (data == "1") {
				} else {
					$("input[id=bookBtn]").attr("class", "btn btn-secondary");
					$('#bookBtn').val('√북마크됨');
				}
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "error:" + error);
			}
		});
	}
}
</script>
</html>