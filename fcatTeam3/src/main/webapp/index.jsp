<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>index</title>
	</head>

	<body>
		<!--  헤더  -->
		<%@include file="/WEB-INF/views/common/header.jsp" %>

			<!-- 셀러 페이지 테스트 -->
			<h3>
				<a href="/sellerPage.do">판매자 마이 페이지</a><br><br>
				<a href="/requestServiceList.do">서비스 신청 리스트</a><br><br>
				<a href="/serviceFrm.do">서비스등록페이지</a>
			</h3>
	</body>

	</html>