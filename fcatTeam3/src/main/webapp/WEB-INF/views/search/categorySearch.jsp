<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/b4fd1bff4b.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/search.css?ver=2" />
<style>
.fa-star {
	color: #ffbf00;
}

.fa-star-half-alt {
	color: #ffbf00;
}

#breadcrumb {
	background-color: #fcfcfc;
	width: 1280px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div id="breadcrumb">
		<ol class="breadcrumb">
			<c:choose>
				<c:when test="${not empty childCategory }">
					<li><a
						href="/categorySearch.do?category=${category }&nowPage=1">${category}</a></li>
					<li class="active">${childCategory }</li>
				</c:when>
				<c:when test="${empty childCategory }">
					<li class="active">${category}</li>
				</c:when>
			</c:choose>
		</ol>
	</div>
	<div class="content-wrap">
		<div class="categori-wrap">
			<div class="categori-title">
				<hr />
				<ul class="accordion">
					<c:forEach items="${cc.motherCategory }" var="cm" varStatus="i">
						<c:if test="${ cm.value ne 0}">
							<li class="item">
								<h2 class="accordionTitle">
									${cm.key }(${cm.value}) <span class="accIcon"></span>
								</h2>
								<div class="text">
									<c:forEach items="${cc.childCategory[i.count-1] }" var="child">
										<c:if test="${child.value ne 0 }">
											<a
												href="/categorySearch.do?category=${cm.key }&childCategory=${child.key }&keyword=${keyword }&nowPage=1">
												${child.key }(${child.value })<br>
											</a>
										</c:if>
									</c:forEach>
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<input type="hidden" value="${m.memberId }" id="memberId">
	<div class="searchList-wrap">
		<c:if test="${not empty keyword }">
			<div id="seacrhResult">
				<span id="searchCount1">'${childCategory }'??? '${keyword }'
					???????????? </span><span id="searchCount2">${search.searchCount}???</span>
			</div>
			<hr />
		</c:if>
		<div class="searchRow">
			<c:forEach items="${list }" var="fs" varStatus="i">
				<div class="searchItem">
					<div class="box-shadow">
						<div id="thumbnail">
							<img class="img-thumbnail" src="${fs.fsPhoto }" alt="..." />
						</div>
						<span id="fsWriterFont">${fs.fsWriter }</span>
						<div class="icon-wrap">
							<!--??????  -->
							<c:choose>
								<c:when test="${empty sessionScope.m  }">
									<span id="heartSpan" class="noright"><i
										class="far fa-heart"></i> </span>
								</c:when>
								<c:when test="${not empty sessionScope.m  }">
									<c:set var="like" value="0" />
									<c:forEach items="${likeList }" var="num">
										<c:if test="${num eq fs.fsNo }">
											<span id="heartSpan" class="hearts"
												onclick="heartsClick(this)"><i class="fas fa-heart"></i>
											</span>
											<!-- like ?????? ?????? ????????? ?????? -->
											<c:set var="like" value="1" />
										</c:if>
									</c:forEach>

									<c:if test="${like eq '0'}">
										<span id="heartSpan" class="hearts"
											onclick="heartsClick(this)"><i class="far fa-heart"
											id="nofilling"></i> </span>
									</c:if>
								</c:when>
							</c:choose>
							<!--????????? ?????? -->
							<input type="hidden" class="fsNo" value="${fs.fsNo }">
						</div>
						<div class="serviceTitle">
							<span id="fsTitleFont">${fs.fsTitle }</span>
						</div>
						<div class="serviceComment">
							<span id="fsContentFont">${fs.fsContent}</span>
						</div>
						<span class="starSpan"> <c:forEach
								items="${listForCategory}" var="star">
								<c:if test="${star.fsNo eq fs.fsNo }">
									<c:if test="${star.reviewScore ne '0.0' }">
										<c:choose>
											<c:when test="${star.reviewScoreAsStar eq '0.5' }">
												<i class="fas fa-star-half-alt"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
											</c:when>
											<c:when test="${star.reviewScoreAsStar eq '1.0' }">
												<i class="fas fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
											</c:when>
											<c:when test="${star.reviewScoreAsStar eq '1.5' }">
												<i class="fas fa-star"></i>
												<i class="fas fa-star-half-alt"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
											</c:when>
											<c:when test="${star.reviewScoreAsStar eq '2.0' }">
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
											</c:when>
											<c:when test="${star.reviewScoreAsStar eq '2.5' }">
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star-half-alt"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
											</c:when>
											<c:when test="${star.reviewScoreAsStar eq '3.0' }">
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
											</c:when>
											<c:when test="${star.reviewScoreAsStar eq '3.5' }">
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star-half-alt"></i>
												<i class="far fa-star"></i>
											</c:when>
											<c:when test="${star.reviewScoreAsStar eq '4.0' }">
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="far fa-star"></i>
											</c:when>
											<c:when test="${star.reviewScoreAsStar eq '4.5' }">
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star-half-alt"></i>
											</c:when>
											<c:when test="${star.reviewScoreAsStar eq '5.0' }">
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
											</c:when>
										</c:choose>
									</c:if>
									<c:if test="${star.reviewScore eq '0.0' }">
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
									</c:if>
									<span class="starCount"> (${star.reviewCount }) </span>
								</c:if>
							</c:forEach>
						</span>
						<div class="price">
							<span id="fsPriceFont">${fs.fsPriceAsString }</span>
						</div>

					</div>
					<!-- 					</a> -->
				</div>
			</c:forEach>
		</div>
		<!-- ????????? -->
		<div id="pagination">
			<ul class="pagination">
				<c:if test="${paging.startPage != 1 }">
					<c:choose>
						<c:when test="${not empty childCategory && empty keyword }">
							<li class="page-item"><a class="page-link"
								href="/categorySearch.do?nowPage=${paging.startPage - 1 }&category=${category}&childCategory=${childCategory}">&lt;</a></li>

						</c:when>
						<c:when test="${empty childCategory }">
							<li class="page-item"><a class="page-link"
								href="/categorySearch.do?nowPage=${paging.startPage - 1 }&category=${category}">&lt;</a></li>
						</c:when>
						<c:when test="${not empty childCategory && not empty keyword }">
							<li class="page-item"><a class="page-link"
								href="/categorySearch.do?nowPage=${paging.startPage - 1 }&category=${category}&childCategory=${childCategory}&keyword=${keyword}">&lt;</a></li>
						</c:when>
					</c:choose>

				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<li class="page-item active"><a class="page-link" href="#"><b>${p }</b></a></li>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<c:choose>
								<c:when test="${not empty childCategory && empty keyword }">
									<li class="page-item"><a class="page-link"
										href="/categorySearch.do?nowPage=${p }&category=${category}&childCategory=${childCategory}">${p }</a></li>
								</c:when>
								<c:when test="${empty childCategory }">
									<li class="page-item"><a class="page-link"
										href="/categorySearch.do?nowPage=${p }&category=${category}">${p }</a></li>
								</c:when>
								<c:when test="${not empty childCategory && not empty keyword }">
									<li class="page-item"><a class="page-link"
										href="/categorySearch.do?nowPage=${p }&category=${category}&childCategory=${childCategory}&keyword=${keyword}">${p }</a></li>
								</c:when>
							</c:choose>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<c:choose>
						<c:when test="${not empty childCategory && empty keyword }">
							<li class="page-item"><a class="page-link"
								href="/categorySearch.do?nowPage=${paging.startPage + 1 }&category=${category}&childCategory=${childCategory}">&gt;</a></li>

						</c:when>
						<c:when test="${empty childCategory }">
							<li class="page-item"><a class="page-link"
								href="/categorySearch.do?nowPage=${paging.startPage + 1 }&category=${category}">&gt;</a></li>
						</c:when>
						<c:when test="${not empty childCategory && not empty keyword }">
							<li class="page-item"><a class="page-link"
								href="/categorySearch.do?nowPage=${paging.startPage + 1 }&category=${category}&childCategory=${childCategory}&keyword=${keyword}">&gt;</a></li>
						</c:when>
					</c:choose>
				</c:if>
			</ul>
		</div>
		<hr>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
<script type="text/javascript">
	function heartsClick(e) {
		if ($(e).children().attr("id") == "nofilling") {
			$(e).html("<i class='fas fa-heart'></i>");
			var memberId = $("#memberId").val();
			var fsNo = $(e).next().val();
			$.ajax({
				url : "/serviceLike.do",
				type : "post",
				data : {
					memberId : memberId,
					fsNo : fsNo,
				},
				success : function(data) {
				},
				error : function() {
					alert("?????? ?????? ??????");
				}
			})
		} else {
			$(e).html("<i class='far fa-heart' id='nofilling'></i>");
			var memberId = $("#memberId").val();
			var fsNo = $(e).next().val();
			$.ajax({
				url : "/serviceCancelLike.do",
				type : "post",
				data : {
					memberId : memberId,
					fsNo : fsNo,
				},
				success : function(data) {
				},
				error : function() {
					alert("?????? ?????? ??????");
				}
			})
		}
	}
	$(".noright").click(function() {
		alert("????????? ??? ??????????????????.");
	})
	// accordion
	// variables 
	var accordionBtn = document.querySelectorAll(".accordionTitle");
	var allTexts = document.querySelectorAll(".text");
	var accIcon = document.querySelectorAll(".accIcon");

	// event listener
	accordionBtn.forEach(function(el) {
		el.addEventListener("click", toggleAccordion);
	});

	// function
	function toggleAccordion(el) {
		var targetText = el.currentTarget.nextElementSibling.classList;
		var targetAccIcon = el.currentTarget.children[0];
		var target = el.currentTarget;

		if (targetText.contains("show")) {
			targetText.remove("show");
			targetAccIcon.classList.remove("anime");
			target.classList.remove("accordionTitleActive");
		} else {
			targetText.add("show");
			target.classList.add("accordionTitleActive");
			targetAccIcon.classList.add("anime");
		}
	}
	$(".box-shadow").click(function() {
		var idx = $(".box-shadow").index(this);
		var fsNo = $(".fsNo").eq(idx).val();
		console.log(idx);
		console.log(fsNo);
		var pageFront = "/serviceDetail.do?fsNo=";
		var page = pageFront + fsNo;
		location.href = page;

	});
</script>

</html>