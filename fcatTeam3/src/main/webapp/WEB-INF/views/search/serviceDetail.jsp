<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<img class="img-thumbnail" src="${fs.fsPhoto }" alt="..." />
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
						<!--하트  -->
						<c:choose>
							<c:when test="${empty sessionScope.m  }">
								<span id="heartSpan" class="noright"><i
									class="far fa-heart"></i> </span>
							</c:when>
							<c:when test="${not empty sessionScope.m  }">
								<c:if test="${not empty like }">
									<span id="heartSpan" class="hearts" onclick="heartsClick(this)"><i
										class="fas fa-heart"></i> </span>
									<!-- like 찾은 경우 구분값 설정 -->
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
				<button type="button" class="btn btn-success" onclick="sendRequest('${sessionScope.m.memberId}')">서비스 요청</button>
				</c:when>
				<c:when test="${empty sessionScope.m  }">
				<button type="button" class="btn btn-success">로그인 후 이용하실 수 있습니다.</button>
				</c:when>
				</c:choose>
			</div>

		</div>
		<!--상세-->
		<div class="floating-menu">
			<ul>
				<li class="m"><a href="#section-01" class="menu-01"><span>서비스
							설명 </span></a></li>
				<li class="m"><a href="#section-02" class="menu-02"><span>서비스
							리뷰 </span></a></li>
				<li class="m"><a href="#section-03" class="menu-03"><span>서비스
							문의 </span></a></li>
				<li class="btn-top"><a href="#header" class="menu-04"><span>상단으로</span></a>
				</li>
			</ul>
		</div>

		<div class="section-01 scroll" id="scroll1">
			<img alt="" src="${fs.fsDescriptionImage }">
			<div>${fs.fsDescriptionText}</div>

		</div>

		<div class="section-02 scroll">
			<hr>
			<div class="review-content">
				<div class="review-score">
					<h3>서비스 평가</h3>
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
					<h4>서비스 리뷰 (${count })</h4>
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
			<h3>서비스 문의</h3>
			<c:choose>

				<c:when test="${empty sessionScope.m  }">
					<div class="inputComment">
						<button type="button" class="btn btn-primary noright"
							id="noright-btn">문의하기</button>
						<textarea class="form-control" aria-describedby="sizing-addon1"
							name="questionInput" id="questionInput"></textarea>
					</div>
				</c:when>
				<c:when test="${not empty sessionScope.m  }">
					<div class="inputComment">
						<button type="button" class="btn btn-primary" id="questionBtn">
							문의하기</button>
						<textarea class="form-control" aria-describedby="sizing-addon1"
							name="questionInput" id="questionInput"></textarea>
					</div>
				</c:when>
			</c:choose>
			<!-- 반복지점 -->
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
									<span class="reComment">답글</span>
								</c:if>
								<c:if test="${q.memberId eq sessionScope.m.memberId }">
									<span class="deleteComment">삭제</span>
								</c:if>
							</div>
						</div>
						<!--  -->
						<div class="answerInput" id=answerInput>
							<textarea class="form-control answerText"></textarea>
							<button class="btn btn-success putRecomment" type="button" id="">
								답글달기</button>
							<button class="btn btn-danger cancelComment" type="button" id="">
								취소</button>
						</div>
					</c:if>
					<c:forEach items="${answerList }" var="a">
						<c:if test="${a.qIndex eq q.qNo }">
							<div class="questionAnswer">
								<div class="answerMark">
									<i class="fas fa-check"></i>
								</div>
								<div class="answerContent">
									<span class="answerId">판매자</span><br /> <span
										class="questionDate">${a.qDate }</span><br /> <span
										class="questionText">${a.qContent }</span> <input
										type="hidden" value=${a.qNo } class="qNo">
									<div class="update-wrap">
										<c:if test="${a.memberId eq sessionScope.m.memberId }">
											<span class="deleteComment">삭제</span>
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
<script>
	
	function sendRequest(msgSender){
	
		var msgReceiver = $("#fsWriterFont").html();
		var msgTitle = "서비스 요청!";
		var msgContent = msgSender+"님이"+$("#fsTitle").html()+"에 대해 서비스를 요청하였습니다";
		$.ajax({
			url : "/sendRequest.do",
			type : "post",
			data : {msgSender:msgSender,msgReceiver:msgReceiver,msgTitle:msgTitle,msgContent:msgContent},
			success : function(data){
				if(data == '1'){
					alert("요청 성공");
					location.reload();
				}else{
					alert("요청 실패");
				}
			}
		});
	
		
	}

	(function(global, $) {
		var $menu = $(".floating-menu li.m"), $contents = $(".scroll"), $doc = $("html, body");
		$(function() {
			$menu
					.on(
							"click",
							"a",
							function(e) {
								var $target = $(this).parent(), idx = $target
										.index(), section = $contents.eq(idx), offsetTop = section
										.offset().top - 60; //헤더 높이만큼 빼줌
								$doc.stop().animate({
									scrollTop : offsetTop,
								}, 200);
								return false;
							});
		});

		$(window)
				.scroll(
						function() {
							var scltop = $(window).scrollTop() + 60; //헤더높이만틈 더해 줌

							$
									.each(
											$contents,
											function(idx, item) {
												var $target = $contents.eq(idx), i = $target
														.index(), targetTop = $target
														.offset().top;

												if (targetTop <= scltop) {
													$menu.removeClass("on");
													$menu.eq(idx)
															.addClass("on");
												}
												if (!(200 <= scltop)) {
													$menu.removeClass("on");
												}
											});
						});

		var btnTop = $(".btn-top");
		btnTop.on("click", "a", function(e) {
			e.preventDefault();
			$doc.stop().animate({
				scrollTop : 0,
			}, 200);
		});
	})(window, window.jQuery);
	$(document).ready(function() {
		//상대적인 좌표 값을 반환, .offset()가 반환 하는 객체는 left와 top 속성을 제공

		//top 속성을 이용해서 메뉴의 수직 위치를 구함

		var menu_offset = $(".floating-menu").offset();

		//스크롤 바를 스크롤할 때 매개변수로 전달된 함수를 실행시킴

		$(window).scroll(function() {
			//문서의 스크롤바 위치와 메뉴의 수직 위치를 비교해서

			//문서의 스크롤바 위치가 메뉴의 수직 위치보다 크면(위치로 표현하면 아래)

			if ($(document).scrollTop() >= menu_offset.top) {
				//메뉴에 menu-fixed 클래스를 추가해서 메뉴를 고정시킴

				$(".floating-menu").addClass("menu-fixed");
			} else {
				//메뉴에서 menu-fized 클래스를 제거해서 메뉴를 수직으로 이동할 수 있도록 처리함

				$(".floating-menu").removeClass("menu-fixed");
			}
		});
	});
	function heartsClick(e) {
		if ($(e).children().attr("id") == "nofilling") {
			$(e).html("<i class='fas fa-heart'></i>");
			var memberId = $("#memberId").val();
			var fsNo = $("#fsNo").val();
			console.log(memberId);
			console.log(fsNo);

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
					alert("서버 연결 이상");
				}
			})
		} else {
			$(e).html("<i class='far fa-heart' id='nofilling'></i>");
			var memberId = $("#memberId").val();
			var fsNo = $("#fsNo").val();
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
					alert("서버 연결 이상");
				}
			})
		}
	}
	$(".noright").click(function() {
		alert("로그인 후 사용해주세요.");
	})
	$(".reComment").click(function() {
		var idx = $(".reComment").index(this); //클릭한 게 몇번쨰 답글달기 버튼인지 구하는 코드
		$(this).hide();
		$(".answerInput").eq(idx).css("display", "flex");
		$(".cancelComment").click(function() {
			$(".reComment").eq(idx).show();
			$(".answerInput").eq(idx).css("display", "none");
		});
	});
	$("#questionBtn").click(function() {
		var comment = $("#questionInput").val();
		var fsNo = $("#fsNo").val();
		var memberId = $("#memberId").val();
		var date = new Date();
		console.log(comment);
		var year = date.getFullYear(); //년도
		var month = date.getMonth() + 1; //월
		var day = date.getDate(); //일

		if ((day + "").length < 2) { // 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
			day = "0" + day;
		}

		var getToday = year + "-" + month + "-" + day; // 오늘 날짜 (2017-02-07)

		$.ajax({
			url : "/insertQuestion.do",
			type : "post",
			data : {
				fsNo : fsNo,
				memberId : memberId,
				getToday : getToday,
				comment : comment,
			},
			success : function(data) {
				location.reload();
			},
			error : function() {
				alert("서버 연결 이상");
			}
		})
	});
	$(".putRecomment").click(function() {
		var idx = $(".putRecomment").index(this); //클릭한 게 몇번쨰 답글달기 버튼인지 구하는 코드
		var comment = $(".answerText").eq(idx).val();
		var qNo = $(".qNo").eq(idx).val();
		var fsNo = $("#fsNo").val();
		var memberId = $("#memberId").val();
		var date = new Date();
		console.log(qNo);
		var year = date.getFullYear(); //년도
		var month = date.getMonth() + 1; //월
		var day = date.getDate(); //일

		if ((day + "").length < 2) { // 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
			day = "0" + day;
		}

		var getToday = year + "-" + month + "-" + day; // 오늘 날짜 (2017-02-07)

		$(".answerInput").eq(idx).css("display", "none");

		$.ajax({
			url : "/insertAnswer.do",
			type : "post",
			data : {
				fsNo : fsNo,
				memberId : memberId,
				getToday : getToday,
				comment : comment,
				qNo : qNo,
			},
			success : function(data) {
				location.reload();
			},
			error : function() {
				alert("서버 연결 이상");
			}
		})
	});
	$(".deleteComment").click(function() {
		var idx = $(".deleteComment").index(this); //클릭한 게 몇번쨰 답글달기 버튼인지 구하는 코드
		var qNo = $(".qNo").eq(idx).val();
		confirm("정말 삭제하시곘습니까?");
		$.ajax({
			url : "/deleteComment.do",
			type : "post",
			data : {
				qNo : qNo,
			},
			success : function(data) {
				location.reload();
			},
			error : function() {
				alert("서버 연결 이상");
			}
		})
	});
</script>
</html>