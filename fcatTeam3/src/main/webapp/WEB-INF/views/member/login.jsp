<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>

</head>

<body>
	<h3>로그인 페이지</h3><hr><hr>
	<form action="/login.do" method="post">
		아이디 : <input type="text" name="memberId"><br>
		비밀번호 : <input type="password" name="memberPw"><br>
		<input class="btn"type="submit" value="로그인">
		<input type="submit" value="취소">
	</form>
</body>
</html>