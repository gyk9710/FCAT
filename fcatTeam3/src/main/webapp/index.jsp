<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

	<!--  헤더  -->
	<%@include file="/WEB-INF/views/common/headerBootstrap5.jsp" %>
	
	<!-- 관리자 페이지 테스트 -->
	<h3>
		<a href="/adminPage.do">관리자 페이지</a>
	</h3>
	
	<!-- 고객센터 테스트 -->
	<h3>
		<a href="boardList.do">고객센터</a>
	</h3>

	<!-- 셀러 페이지 테스트 -->
	<h3>
		<a href="/sellerPage.do">판매자 마이 페이지</a>
		<a href="/serviceFrm.do">서비스등록페이지</a>
	</h3>
		
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</html>