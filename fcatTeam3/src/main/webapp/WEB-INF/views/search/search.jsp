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
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
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
				<div class="panel-group" id="accordion">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordion" href="#collapseOne"> Collapsible
									Group Item #1 </a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in">
							<div class="panel-body">Anim pariatur cliche reprehenderit,
								enim eiusmod high life accusamus terry richardson ad squid. 3
								wolf moon officia aute, non cupidatat skateboard dolor brunch.
								Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
								tempor, sunt aliqua put a bird on it squid single-origin coffee
								nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
								craft beer labore wes anderson cred nesciunt sapiente ea
								proident. Ad vegan excepteur butcher vice lomo. Leggings
								occaecat craft beer farm-to-table, raw denim aesthetic synth
								nesciunt you probably haven't heard of them accusamus labore
								sustainable VHS.</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordion" href="#collapseTwo"> Collapsible
									Group Item #2 </a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse">
							<div class="panel-body">Anim pariatur cliche reprehenderit,
								enim eiusmod high life accusamus terry richardson ad squid. 3
								wolf moon officia aute, non cupidatat skateboard dolor brunch.
								Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
								tempor, sunt aliqua put a bird on it squid single-origin coffee
								nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
								craft beer labore wes anderson cred nesciunt sapiente ea
								proident. Ad vegan excepteur butcher vice lomo. Leggings
								occaecat craft beer farm-to-table, raw denim aesthetic synth
								nesciunt you probably haven't heard of them accusamus labore
								sustainable VHS.</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordion" href="#collapseThree"> Collapsible
									Group Item #3 </a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse">
							<div class="panel-body">Anim pariatur cliche reprehenderit,
								enim eiusmod high life accusamus terry richardson ad squid. 3
								wolf moon officia aute, non cupidatat skateboard dolor brunch.
								Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
								tempor, sunt aliqua put a bird on it squid single-origin coffee
								nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
								craft beer labore wes anderson cred nesciunt sapiente ea
								proident. Ad vegan excepteur butcher vice lomo. Leggings
								occaecat craft beer farm-to-table, raw denim aesthetic synth
								nesciunt you probably haven't heard of them accusamus labore
								sustainable VHS.</div>
						</div>
					</div>
				</div>


				<!-- end container -->
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
								<button type="button" id="heart" class="btn btn-outline-danger">
									<i class="bi bi-heart"></i>
								</button>
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
	</div>
</body>
</html>