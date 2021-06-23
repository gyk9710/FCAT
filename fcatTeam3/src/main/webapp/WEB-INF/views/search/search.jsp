<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
<style type="text/css">
.route-wrap {
	background-color: #f0f0f0;
}

.route {
	width: 1280px;
	margin: 0 auto;
}

.content-wrap {
	width: 1280px;
	margin: 0 auto;
}

.categori-wrap {
	width: 200px;
	float: left;
}

.categori-title>h4 {
	margin: 0;
	padding: 0;
}

.categori-title>hr {
	margin: 0;
}

/*
.parent-catagori {
  position: relative;
  padding: 2px 0;
  cursor: pointer;
  font-size: 14px;
  border-bottom: 1px solid #dddddd;
}

.parent-catagori::before {
  display: inline-block;
  content: " ";
  font-size: 20px;
  margin-right: 5px;
}

.parent-catagori.on > span {
  font-weight: bold;
}

.child-categori {
  display: none;
  overflow: hidden;
  font-size: 14px;
  background-color: #afaf91;
  padding: 0px 0;
}

.child-categori::before {
  display: inline-block;
  content: "";
  width: 10px; 
  height: 10px; 
  border-top: 1px solid #121212; 
  border-right: 1px solid #121212; 
  transform: rotate(45deg); 
  margin-right: 5px;
}
*/
.searchList-wrap {
	width: 1080;
	float: left;
}

.searchRow {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	width: 1080px;
	padding: 0px;
}

.searchItem {
	width: 270px;
	padding-left: 60px;
	padding-right: 60px;
	padding-top: 20px;
	padding-bottom: 20px;
}

/* .searchItem > .photo {
  width: 240px;
  height: 160px;
  overflow: hidden;
  border: solid #f0f0f0 1px;
} */
/* .photo > img {
  width: 240px;
} */
.icon-wrap {
	height: 20px;
	float: right;
}

.icon-wrap>img {
	height: 20px;
	padding-left: 5px;
}

.price {
	float: right;
}

.accordion-header>button {
	padding: 2px;
}

#badge {
	float: right;
}

#star {
	color: yellow;
}

.accordion-body {
	padding: 0px;
	padding-left: 14px;
}

.box-shadow {
	width: 240px;
	height: 413px;
	border: 1px solid white;
	padding: 10px;
}

.box-shadow:hover {
	border: 1px solid #dddddd;
	border-radius: 5px;
	box-shadow: 0px 0px 5px 5px #f0f0f0;
}

#heart {
	border: 0px;
}

.search-header {
	padding: 10px;
	padding-bottom: 0px;
	float: left;
}
</style>
<!--  <link rel="stylesheet" href="/resources/css/search.css" />-->
</head>
<body>
	<%@include file="/WEB-INF/views/common/headerBootstrap5.jsp"%>
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
				<div class="accordion" id="accordionPanelsStayOpenExample">
				<c:choose>
					<div class="accordion-item">
						<div class="accordion-header" id="panelsStayOpen-headingOne">
							<button class="accordion-button" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseOne"
								aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
								IT/프로그래밍
								<div class="badge rounded-pill bg-primary" id="badge">14</div>
							</button>
						</div>
						<div id="panelsStayOpen-collapseOne"
							class="accordion-collapse collapse show"
							aria-labelledby="panelsStayOpen-headingOne">
							<div class="accordion-body">
								<strong>This is the first item's accordion body.</strong>
							</div>
						</div>
					</div>
						</c:choose>
				</div>
			</div>
		</div>

		<!--  -->
		<div class="searchList-wrap">
			<div class="searchRow">
				<c:forEach items="${list }" var="fs" varStatus="i">
					<div class="searchItem">
						<div class="box-shadow">
							<div class="photo">
								<img src="${fs.fsPhoto }" class="img-fluid img-thumbnail"
									alt="..." />
							</div>
							<span>${fs.fsWriter }</span>
							<div class="icon-wrap">
								<i class="bi bi-star-fill" id="star"></i>
								<button type="button" id="heart" class="btn btn-outline-danger">
									<i class="bi bi-heart"></i>
								</button>
							</div>
							<div class="serviceTitle">
								<h5>${fs.fsTitle }</h5>
							</div>
							<div class="serviceComment">${fs.fsContent}</div>
							<div class="price">${fs.fsPrice }</div>
						</div>
					</div>
				</c:forEach>

			</div>
			<hr />
		</div>
</body>


</html>