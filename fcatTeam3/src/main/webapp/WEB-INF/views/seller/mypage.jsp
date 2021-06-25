<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>mypage</title>
		<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
	</head>

	<body>
		<!-- 헤더 -->
		<header>
			<%@include file="/WEB-INF/views/common/headerBootstrap5.jsp" %>
		</header>

		<br>
		<br>

		<div class="container">
			<h3>
				<a href="/insertTattle.do">신고하기</a>
			</h3>
			<br>
			<h3>
				<a href="/requestServiceList.do?serviceNo=1007">서비스 요청 리스트</a>
			</h3>
		</div>
		<br>
		<br>

		<!-- 푸터 -->
		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp" %>
		</footer>
	</body>

	</html>