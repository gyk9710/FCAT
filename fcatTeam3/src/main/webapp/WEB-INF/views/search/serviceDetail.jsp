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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<script src="https://kit.fontawesome.com/b4fd1bff4b.js"></script>
<link rel="stylesheet" href="/resources/css/serviceDetail.css" />
<style type="text/css">
#breadcrumb {
	background-color: #fcfcfc;
	width: 1280px;
	margin: 0 auto;
}
#noright-btn{
	width: 1080px;
}
</style>
<script>
function sendRequest(msgSender){	
	location.href="/payment.do";
	}
</script>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div id="breadcrumb">
		<ol class="breadcrumb">
			<li><a
				href="/categorySearch.do?category=${fs.fsCategory }&nowPage=1">${fs.fsCategory }</a></li>
			<li><a
				href="/categorySearch.do?category=${fs.fsCategory }&childCategory=${fs.fsChildCategory }&nowPage=1">${fs.fsChildCategory }</a></li>
			<li class="active">${fs.fsTitle }</li>
		</ol>
	</div>
	<div id="content-wrap">
		<div id="product-wrap">

			<div id="thumbnail">
				<img class="img-thumbnail" src="/resources/upload/seller/${fs.fsPhoto }" alt="..." />
			</div>

			<div class="productView-wrap">
				<div class="productTitle">
					<h3 id="fsTitle">${fs.fsTitle }</h3>
					<span id="fsWriterFont">${fs.fsWriter }</span>
					<span id="starSpan"><c:if test="${starScore ne '0.0' }">
							<c:choose>
								<c:when test="${starScore eq '0.5' }">
									<i class="fas fa-star-half-alt"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
								</c:when>
								<c:when test="${starScore eq '1.0' }">
									<i class="fas fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
								</c:when>
								<c:when test="${starScore eq '1.5' }">
									<i class="fas fa-star"></i>
									<i class="fas fa-star-half-alt"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
								</c:when>
								<c:when test="${starScore eq '2.0' }">
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
								</c:when>
								<c:when test="${starScore eq '2.5' }">
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star-half-alt"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
								</c:when>
								<c:when test="${starScore eq '3.0' }">
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
								</c:when>
								<c:when test="${starScore eq '3.5' }">
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star-half-alt"></i>
									<i class="far fa-star"></i>
								</c:when>
								<c:when test="${starScore eq '4.0' }">
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="far fa-star"></i>
								</c:when>
								<c:when test="${starScore eq '4.5' }">
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star-half-alt"></i>
								</c:when>
								<c:when test="${starScore eq '5.0' }">
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
								</c:when>
							</c:choose>
						</c:if> <c:if test="${starScore eq '0.0' }">
							<i class="far fa-star"></i>
							<i class="far fa-star"></i>
							<i class="far fa-star"></i>
							<i class="far fa-star"></i>
							<i class="far fa-star"></i>
						</c:if> (${count }) </span>
					<div class="heartWrap">
						<!--??????  -->
						<c:choose>
							<c:when test="${empty sessionScope.m  }">
								<span id="heartSpan" class="noright"><i
									class="far fa-heart"></i> </span>
							</c:when>
							<c:when test="${not empty sessionScope.m  }">
								<c:if test="${not empty like }">
									<span id="heartSpan" class="hearts" onclick="heartsClick(this)"><i
										class="fas fa-heart"></i> </span>
									<!-- like ?????? ?????? ????????? ?????? -->
								</c:if>

								<c:if test="${empty like}">
									<span id="heartSpan" class="hearts" onclick="heartsClick(this)"><i
										class="far fa-heart" id="nofilling"></i> </span>
								</c:if>
							</c:when>
						</c:choose>
					</div>
					<input type="hidden" id="fsNo" value="${fs.fsNo }"> <input
						type="hidden" value="${m.memberId }" id="memberId"> <input
						type="hidden" value="${fs.fsWriter }">
				</div>
				<div class="productDiscription">${fs.fsContent }</div>
				<div class="price">${fs.fsPriceAsString }</div>
				<c:choose>
				<c:when test="${not empty sessionScope.m  }">
				<button type="button" class="btn btn-success" onclick="sendRequest('${sessionScope.m.memberId}')">????????? ??????</button>
				</c:when>
				<c:when test="${empty sessionScope.m  }">
				<button type="button" class="btn btn-success">????????? ??? ???????????? ??? ????????????.</button>
				</c:when>
				</c:choose>
			</div>

		</div>
		<!--??????-->
		<div class="floating-menu">
			<ul>
				<li class="m"><a href="#section-01" class="menu-01"><span>?????????
							?????? </span></a></li>
				<li class="m"><a href="#section-02" class="menu-02"><span>?????????
							?????? </span></a></li>
				<li class="m"><a href="#section-03" class="menu-03"><span>?????????
							?????? </span></a></li>
				<li class="btn-top"><a href="#header" class="menu-04"><span>????????????</span></a>
				</li>
			</ul>
		</div>

		<div class="section-01 scroll" id="scroll1">
			<div>${fs.fsDescriptionText}</div>

		</div>

		<div class="section-02 scroll">
			<hr>
			<div class="review-content">
				<div class="review-score">
					<h3>????????? ??????</h3>
					<div class="score">
						<span id="starSpan"><c:if test="${starScore ne '0.0' }">
								<c:choose>
									<c:when test="${starScore eq '0.5' }">
										<i class="fas fa-star-half-alt"></i>
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
									</c:when>
									<c:when test="${starScore eq '1.0' }">
										<i class="fas fa-star"></i>
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
									</c:when>
									<c:when test="${starScore eq '1.5' }">
										<i class="fas fa-star"></i>
										<i class="fas fa-star-half-alt"></i>
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
									</c:when>
									<c:when test="${starScore eq '2.0' }">
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
									</c:when>
									<c:when test="${starScore eq '2.5' }">
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star-half-alt"></i>
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
									</c:when>
									<c:when test="${starScore eq '3.0' }">
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
									</c:when>
									<c:when test="${starScore eq '3.5' }">
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star-half-alt"></i>
										<i class="far fa-star"></i>
									</c:when>
									<c:when test="${starScore eq '4.0' }">
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="far fa-star"></i>
									</c:when>
									<c:when test="${starScore eq '4.5' }">
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star-half-alt"></i>
									</c:when>
									<c:when test="${starScore eq '5.0' }">
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
									</c:when>
								</c:choose>
							</c:if> <c:if test="${starScore eq '0.0' }">
								<i class="far fa-star"></i>
								<i class="far fa-star"></i>
								<i class="far fa-star"></i>
								<i class="far fa-star"></i>
								<i class="far fa-star"></i>
							</c:if>${score} (${count }) </span>
					</div>
					<hr />
				</div>
				<div class="reviews">
					<h4>????????? ?????? (${count })</h4>
					<c:forEach items="${reviewList }" var="rv" varStatus="i">
						<div class="reviewOne">
							<div class="reviewer">${rv.fsWorking }</div>
							<div class="review-title">${rv.reviewTitle }</div>
							<div class="reviewOne-score">
								<span id="starSpan"><c:if
										test="${rv.reviewScore ne '0.0' }">
										<c:choose>
											<c:when test="${rv.reviewScore eq '0.5' }">
												<i class="fas fa-star-half-alt"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
											</c:when>
											<c:when test="${rv.reviewScore eq '1.0' }">
												<i class="fas fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
											</c:when>
											<c:when test="${rv.reviewScore eq '1.5' }">
												<i class="fas fa-star"></i>
												<i class="fas fa-star-half-alt"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
											</c:when>
											<c:when test="${rv.reviewScore eq '2.0' }">
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
											</c:when>
											<c:when test="${rv.reviewScore eq '2.5' }">
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star-half-alt"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
											</c:when>
											<c:when test="${rv.reviewScore eq '3.0' }">
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
											</c:when>
											<c:when test="${rv.reviewScore eq '3.5' }">
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star-half-alt"></i>
												<i class="far fa-star"></i>
											</c:when>
											<c:when test="${rv.reviewScore eq '4.0' }">
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="far fa-star"></i>
											</c:when>
											<c:when test="${rv.reviewScore eq '4.5' }">
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star-half-alt"></i>
											</c:when>
											<c:when test="${rv.reviewScore eq '5.0' }">
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
											</c:when>
										</c:choose>
									</c:if> <c:if test="${rv.reviewScore eq '0.0' }">
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
										<i class="far fa-star"></i>
									</c:if> (${rv.reviewScore }) </span><span id="review-date">${rv.reviewDate }</span>
							</div>
							<div class="review-text">${rv.reviewContent }</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

		<div class="section-03 scroll">
			<hr>
			<h3>????????? ??????</h3>
			<c:choose>

				<c:when test="${empty sessionScope.m  }">
					<div class="inputComment">
						<button type="button" class="btn btn-primary noright"
							id="noright-btn">????????????</button>
						<textarea class="form-control" aria-describedby="sizing-addon1"
							name="questionInput" id="questionInput"></textarea>
					</div>
				</c:when>
				<c:when test="${not empty sessionScope.m  }">
					<div class="inputComment">
						<button type="button" class="btn btn-primary" id="questionBtn">
							????????????</button>
						<textarea class="form-control" aria-describedby="sizing-addon1"
							name="questionInput" id="questionInput"></textarea>
					</div>
				</c:when>
			</c:choose>
			<!-- ???????????? -->
			<c:forEach items="${questionList }" var="q">

				<div class="question">
					<c:if test="${q.qClass ne 1 }">
						<div class="questionMark">
							<i class="fas fa-question"></i>
						</div>
						<div class="questionContent">
							<span class="questionId">${q.memberId }</span><br /> <span
								class="questionDate">${q.qDate }</span><br /> <span
								class="questionText">${q.qContent }</span> <input type="hidden"
								value=${q.qNo } class="qNo">
							<div class="update-wrap">
								<c:if test="${fs.fsWriter eq sessionScope.m.memberId }">
									<span class="reComment">??????</span>
								</c:if>
								<c:if test="${q.memberId eq sessionScope.m.memberId }">
									<span class="deleteComment">??????</span>
								</c:if>
							</div>
						</div>
						<!--  -->
						<div class="answerInput" id=answerInput>
							<textarea class="form-control answerText"></textarea>
							<button class="btn btn-success putRecomment" type="button" id="">
								????????????</button>
							<button class="btn btn-danger cancelComment" type="button" id="">
								??????</button>
						</div>
					</c:if>
					<c:forEach items="${answerList }" var="a">
						<c:if test="${a.qIndex eq q.qNo }">
							<div class="questionAnswer">
								<div class="answerMark">
									<i class="fas fa-check"></i>
								</div>
								<div class="answerContent">
									<span class="answerId">?????????</span><br /> <span
										class="questionDate">${a.qDate }</span><br /> <span
										class="questionText">${a.qContent }</span> <input
										type="hidden" value=${a.qNo } class="qNo">
									<div class="update-wrap">
										<c:if test="${a.memberId eq sessionScope.m.memberId }">
											<span class="deleteComment">??????</span>
										</c:if>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</c:forEach>
		</div>

	</div>
	<hr>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
<script src="/resources/js/serviceDetail.js"></script>
</html>