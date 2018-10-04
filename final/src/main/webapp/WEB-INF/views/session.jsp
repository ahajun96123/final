<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
session 확인 <br>
id = '<%=session.getAttribute("login")%>' 입니다.
<form action="session" method="post">
<input type="radio" name="session" value="youngpyo">조영표<br>
<input type="radio" name="session" value="junmo">이준모<br>
<input type="submit" value="로그인">
</form>
</body>
</html>