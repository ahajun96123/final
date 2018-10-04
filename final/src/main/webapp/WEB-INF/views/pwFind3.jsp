<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${msg3 != null}">
		<script>
			alert('${msg3}');
		</script>
	</c:if>
	<form action="pwalter" method="post">
		<table>
			<tr>
				<th>비밀번호 변경</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" value="${pwfind.id}" readonly></td>
				
			</tr>
			<tr>
				<td>새로 설정할 비밀번호</td>
				<td><input type="password" name="password" placeholder="새 비밀번호입력" required></td>
			</tr>
			<tr>
				<td><input type="submit" value="페스워드 변경" onclick="return confirm('입력하신 비밀번호로 수정하시겠습니까?');"></td>
				<td><button onclick="location.href='login' ">로그인 페이지로</button></td>
			</tr>
		</table>
	</form>
</body>
</html>