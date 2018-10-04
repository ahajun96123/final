<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function goBack() {
		window.history.back();
	}
</script>
</head>
<body>
	<form action="idfindservice" method="post">
		<table>
			<tr>
				<th>아이디찾기</th>
			</tr>
			<tr>
				<td>회원가입시 입력한 이름과 이메일주소를 입력해주십시요</td>
			</tr>
			<tr>
				<td>회원 이름</td>
				<td><input type="text" name="name" placeholder="이름입력" required></td>
			</tr>
			<tr>
				<td>가입시 사용한 이메일</td>
				<td><input type="text" name="email" placeholder="이메일 입력" required></td>
			</tr>
			<tr>
			<td><input type="submit" value="아이디 찾기"></td>
			<td><button onclick="goBack()">뒤로가기</button></td>
			</tr>
		</table>
	</form>
</body>
</html>