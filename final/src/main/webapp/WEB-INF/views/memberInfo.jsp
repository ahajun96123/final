<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>꿀벌 상세정보</title>
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

<style>
table, td {
		margin-top: 10px;
		margin-bottom : 5px;
        border: 1px solid #444444;
      }
th{
	
	width: 100px;
	
}
td{
	width: 50px;
	text-align:center;
	
}
tr{
	height: 10px;
	
}
</style>
<script>
	function goBack() {
		window.history.back();
	}
</script>
</head>
<body>
	<div class=container>
		<%@include file="./topui.jsp"%>
		<div style="width: 1130px; height: 990px;">
			<div style="width: 260px; height: 100%; float: left;">
				<%@include file="./sidebar.jsp"%>
			</div>
			<div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="card" style="width: 820px; height: 750px; margin : 10px; padding: 20px;">
                                <div class="card-header card-header-icon" data-background-color="rose">
                                    <i class="material-icons">perm_identity</i>
                                </div>
                                <div class="card-content">
                                    <h4 class="card-title">${info.id}님의 프로필입니다
                                        <small class="category"></small>
                                    </h4>
                                       
                                        <div class="row"> 
                                            <div class="col-md-6">
                                                <div class="form-group label-floating">
                                                    <p ><label class="control-label "><h5 class="text-success">아이디</h5></label></p>
                                                     <p class="form-control">${info.id}</p>
                                                    
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group label-floating">
                                                    <p ><label class="control-label "><h5 class="text-success">이름</h5></label></p>
                                                    <p class="form-control">${info.name}</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group label-floating">
                                                   <p ><label class="control-label "><h5 class="text-success">나이</h5></label></p>
                                                     <p class="form-control">${info.age}</p>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group label-floating">
                                                     <p ><label class="control-label "><h5 class="text-success">성별</h5></label></p>
                                                     <p class="form-control">${info.gender}</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group label-floating">
                                                     <p ><label class="control-label "><h5 class="text-success">이메일 주소</h5></label></p>
                                                    <p class="form-control">${info.email}</p>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group label-floating">
                                                     <p ><label class="control-label "><h5 class="text-success">집 주소</h5></label></p>
                                                    <p class="form-control">${info.address}</p>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        
                                        <form action="myBoard?idInfo=${info.id}" method="post">
											<button class="btn btn-lg btn-warning btn-block"><c:if test="${info.id eq sessionScope.id }">내가</c:if><c:if test="${info.id ne sessionScope.id }">'${info.id}'님이</c:if> 쓴 게시물</button>
											<input type = "hidden" name="id" value = "${info.id}">
										</form>
										<br>
										<div class="btn-group" style="width:100%; margin:5px;">
										<form action="bookBoard?id=${info.id}" method="post">
											<button class="btn btn-lg btn-success btn-block" style="width:386px;"><c:if test="${info.id eq sessionScope.id }">내가</c:if><c:if test="${info.id ne sessionScope.id }">'${info.id}'님이</c:if> 북마크한 게시물</button>
											<input type = "hidden" name="idInfo" value = "${info.id}">
										</form>
										<form action="following?id=${info.id}" method="post">
											<button class="btn btn-lg btn-warning btn-block" style="width:386px;"><c:if test="${info.id eq sessionScope.id }">내가</c:if><c:if test="${info.id ne sessionScope.id }">'${info.id}'님이</c:if> 팔로우 중인 사람들</button>
											<%-- <input type = "hidden" name="id" value = "${info.id}"> --%>
										</form>
										</div>
										<br>
										
				
										<c:if test="${info.id eq sessionScope.id }">
										<!-- Trigger/Open The Modal -->
										<button class="btn btn-lg btn-info btn-block" id="myBtn2">프로필수정</button>
										</c:if>
										<button class="btn btn-lg btn-primary btn-block" onclick="goBack()">뒤로가기</button>                                        
                                        <div class="clearfix"></div>
                                   
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
				<!-- The Modal -->
				<div id="userMod" class="modal">

					<!-- Modal content -->
					<div class="modal-content">

						<div class="page-header">
							<h1>프로필 수정</h1>
						</div>
						<div class="col-md-6 col-md-offset-3">
							<form action="memberalter" method="post">
								<div class="form-group">
									<label for="InputID">아이디(변경불가)</label> <input type="text"
										class="form-control" name="id"
										value="<%=session.getAttribute("id")%>" readonly>
								</div>
								<div class="form-group">
									<label for="InputPassword">비밀번호 변경</label> <input
										type="password" class="form-control" name="password"
										placeholder="비밀번호" required>
								</div>
								<div class="form-group">
									<label for="username">이름 변경</label> <input type="text"
										class="form-control" name="name" value="${info.name}"
										placeholder="이름" required>
								</div>
								<div class="form-group">
									<label for="userage">나이 변경</label> <input type="number"
										class="form-control" name="age" value="${info.age}"
										placeholder="나이" required>
								</div>
								<div class="form-group">
									<label for="useremail">이메일 변경</label> <input type="text"
										class="form-control" name="email" value="${info.email}"
										placeholder="이메일" required>
								</div>
								<div class="form-group">
									<label for="useraddress">집 주소 변경</label> <input type="text"
										class="form-control" name="address" value="${info.address}"
										placeholder="주소">
								</div>
								<div class="form-group">
									<label for="usergender">성별 변경</label><br> <input
										type="radio" name="gender" value="man" checked="checked" />
									남자 <input type="radio" name="gender" value="woman" /> 여자
								</div>
								<div class="form-group text-center">
									<button type="submit" class="btn btn-info" onclick="return confirm('경고! 회원 정보를 수정하시겠습니까?');">
										프로필수정<i class="fa fa-check spaceLeft"></i>
									</button>
									<button class="btn btn-warning" id="cancle">
										<span class="close" style="font-size: 15pt">수정취소</span><i class="fa fa-times spaceLeft"></i>
									</button>

								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	

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