<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀벌 비밀번호 재설정</title>
</head>
<body>
	<c:if test="${msg3 != null}">
		<script>
			alert('${msg3}');
		</script>
	</c:if>
	<div class=container>
		<%@include file="./topui.jsp"%>
		<div style="width: 1130px; height: 990px;">
			<div style="width: 260px; height: 100%; float: left;">
				<%@include file="./sidebar.jsp"%>
			</div>
			<div style="width: 850px; float: left;">
				<br> <a style="font-size: 30px; font-weight: bold;">회원관리</a>
				<form action="pwalter" method="post">
					<table class="table table-hover" style="margin-top: 20px;">
					<thead class="thead-light">
						<tr>
							<th>비밀번호 변경</th>
						</tr>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="id" value="${pwfind.id}"
								readonly></td>

						</tr>
						<tr>
							<td>새로 설정할 비밀번호</td>
							<td><input type="password" name="password"
								placeholder="새 비밀번호입력" required></td>
						</tr>
						<tr>
							<td><input type="submit" value="페스워드 변경" onclick="return confirm('입력하신 비밀번호로 수정하시겠습니까?');"></td>
						</tr>
					</table>
				</form>
				<button class="btn btn-warning" onclick="location.href='main'">메인으로 돌아가기</button>
			</div>
		</div>
	</div>
</body>
</html>