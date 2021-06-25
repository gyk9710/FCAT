<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<script src="https://kit.fontawesome.com/b4fd1bff4b.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/search.css" />
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="route-wrap">
		<div class="route">
			<span>a>b</span>
		</div>
	</div>
	<div class="content-wrap">
		<div class="categori-wrap">
			<div class="categori-title">
				<h4>추천 카테고리</h4>
				<hr />
			</div>
		</div>
	</div>

	<div class="searchList-wrap">
		<div id="seacrhResult">
			<span id="searchCount1">'${search.keyword}'에 대한 검색결과 </span><span
				id="searchCount2">${search.searchCount}건</span>
		</div>
		<hr>
		<div class="searchRow">
			<c:forEach items="${list }" var="fs" varStatus="i">
				<div class="searchItem">
					<div class="box-shadow">
						<div id="thumbnail">
							<img class="img-thumbnail" src="${fs.fsPhoto }" alt="..." />
						</div>
						<span id="fsWriterFont">${fs.fsWriter }</span>
						<div class="icon-wrap">
							<i class="bi bi-star-fill" id="star"></i>
								<span id="heart">
								<i class="far fa-heart  " style="color:#FE8E86;font-size: 20px;"></i>
								</span>
						</div>
						<div class="serviceTitle">
							<span id="fsTitleFont">${fs.fsTitle }</span>
						</div>
						<div class="serviceComment">
							<span id="fsContentFont">${fs.fsContent}</span>
						</div>
						<div class="price">
							<span id="fsPriceFont">${fs.fsPriceAsString }</span>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<hr />
		<!-- 페이지 -->
		<div id="pagination">
			<ul class="pagination">
				<c:if test="${paging.startPage != 1 }">
					<li class="page-item"><a class="page-link"
						href="/searchList.do?nowPage=${paging.startPage - 1 }&keyword=${search.keyword }">&lt;</a></li>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<li class="page-item active"><a class="page-link" href="#"><b>${p }</b></a></li>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<li class="page-item"><a class="page-link"
								href="/searchList.do?nowPage=${p }&keyword=${search.keyword }">${p }</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<li class="page-item"><a class="page-link"
						href="/searchList.do?nowPage=${paging.endPage+1 }&keyword=${search.keyword }">&gt;</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>