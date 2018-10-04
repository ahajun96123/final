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
	<table>
		<tr><th>아이디 검색결과</th></tr>
		<c:forEach items="${idfind}" var="idfind">
			<tr>
				<td>${idfind.id}</td>
				<td>
				<a href="pwfind">비밀번호 찾기</a>
				</td>
			</tr>
		</c:forEach>
		<tr><td><button onclick="location.href='login'">로그인창으로 이동</button></td></tr>
	</table>
</body>
</html>