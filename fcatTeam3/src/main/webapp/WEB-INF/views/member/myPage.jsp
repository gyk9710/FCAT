<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>my page</title>
<link rel="stylesheet" href="/resources/css/userMyPage.css" />
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://kit.fontawesome.com/b4fd1bff4b.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="/resources/jquery-bar-rating-master/dist/themes/fontawesome-stars.css" />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css" />

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div id="modalOutSide"></div>
		<div class="my_l">
			<div class="menu">
				<h3 style="text-align: center">MY PAGE</h3>
				<ul class="main-menu">
					<li><a href="#">내 쿠폰<span class="more active">+</span></a>

						<ul class="sub-menu">
							<li><a href="#" class="current" data-tab="couponAvailable">보유한
									쿠폰</a></li>
							<li><a href="#" data-tab="couponDisAvailable">사용한 쿠폰</a></li>
						</ul></li>

					<li><a href="#">나의 서비스<span class="more">+</span></a>
						<ul class="sub-menu">
							<li><a href="#" data-tab="seviceProceeding">이용중인 서비스</a></li>
							<li><a href="#" data-tab="seviceCompelete">이용한 서비스</a></li>
							<li><a href="#" data-tab="myLikeList">찜한 서비스</a></li>
							<li><a href="#">리뷰 관리</a></li>
							<li><a href="#">신고 내역</a></li>
						</ul></li>
					<li><a href="#">커뮤니티<span class="more">+</span></a>
						<ul class="sub-menu">
							<li><a href="#">쪽지함</a></li>
							<li><a href="#">채팅방</a></li>
						</ul></li>
					<li><a href="#">회원정보변경<span class="more">+</span></a>
						<ul class="sub-menu">
							<li><a href="#" data-tab="updateMyInfo">회원정보 업데이트</a></li>
							<li><a href="#" data-tab="deleteMyId">회원탈퇴</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<input id="memberId" type="hidden" value="${sessionScope.m.memberId }">
		<div class="tab-content now" id="couponAvailable">
			<h2>보유한 쿠폰</h2>
			<hr />
			<div class="coupon-wrap">
				<c:if test="${empty couponList }">
					<div class="emptySearch">
						<i class="fas fa-exclamation-circle"></i> <span>보유한 쿠폰이
							없습니다.</span>
					</div>
				</c:if>
				<c:forEach items="${couponList}" var="c">
					<c:if test="${c.couponStatus eq 'Y' }">
						<div class="coupon">
							<div class="couponIcon">
								<i class="fas fa-gift"></i>
							</div>
							<div class="couponContent">
								<span class="couponName">${c.couponName }</span><span
									class="couponOff">${c.couponDiscount }% off</span> <span
									class="couponDate">${c.startDate }~${c.endDate }</span>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<div class="tab-content" id="couponDisAvailable">
			<h2>사용한 쿠폰</h2>
			<hr />
			<div class="coupon-wrap">
				<c:if test="${empty couponList }">
					<div class="emptySearch">
						<i class="fas fa-exclamation-circle"></i> <br> <span>
							사용한 쿠폰내역이 없습니다.</span>
					</div>
				</c:if>
				<c:forEach items="${couponList}" var="c">
					<c:if test="${c.couponStatus eq 'N' }">
						<div class="coupon">
							<div class="couponIcon">
								<i class="fas fa-gift"></i>
							</div>
							<div class="couponContent">
								<span class="couponName">${c.couponName }</span><span
									class="couponOff">${c.couponDiscount }% off</span> <span
									class="couponDate">${c.startDate }~${c.endDate }</span>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<div class="tab-content" id="myLikeList">
			<h2>찜한 서비스</h2>
			<hr />
			<div class="likeList-wrap">
				<c:if test="${empty likeServiceList }">
					<div class="emptySearch">
						<i class="fas fa-exclamation-circle"></i> <br> <span>
							찜한 서비스가 없습니다.</span>
					</div>
				</c:if>
				<c:forEach items="${likeServiceList }" var="fs">
					<div class="likeList">
						<!-- 하트용 -->
						<img class="thumb" src="${fs.fsPhoto }" alt="..." />
						<div class="couponContent">
							<span class="couponDate">${fs.fsWriter }</span> <span
								class="couponName">${fs.fsTitle }</span> <span id="heartSpan"
								class="hearts" onclick="heartsClick(this)"><i
								class="fas fa-heart"></i> </span> <input type="hidden"
								value="${fs.fsNo }" class="fsNo">
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="tab-content" id="seviceProceeding">
			<h2>이용중인 서비스</h2>
			<hr />
			<div class="likeList-wrap">
				<c:if test="${empty proceedingList }">
					<div class="emptySearch">
						<i class="fas fa-exclamation-circle"></i> <br> <span>
							찜한 서비스가 없습니다.</span>
					</div>
				</c:if>
				<c:forEach items="${proceedingList }" var="fs">
					<div class="proceedingList">
						<!-- 하트용 -->
						<img class="thumb" src="${fs.fsPhoto }" alt="..." />
						<div class="couponContent">
							<span class="couponDate">${fs.fsWriter }</span> <span
								class="couponName">${fs.fsTitle }</span>
						</div>
						<input type="hidden" class="proceedingFsTitle" value="${fs.fsTitle}">
						<input type="hidden" class="proceedingFsNo" value="${fs.fsNo}">
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="tab-content" id="seviceCompelete">
			<h2>이용한 서비스</h2>
			<hr />
			<div class="likeList-wrap">
				<c:if test="${empty compeleteList }">
					<div class="emptySearch">
						<i class="fas fa-exclamation-circle"></i> <br> <span>
							찜한 서비스가 없습니다.</span>
					</div>
				</c:if>
				<c:forEach items="${compeleteList }" var="fs">
					<div class="compeleteList">
						<!-- 하트용 -->
						<img class="thumb" src="${fs.fsPhoto }" alt="..." />
						<div class="couponContent">
							<span class="couponDate">${fs.fsWriter }</span> <span
								class="couponName">${fs.fsTitle }</span>
						</div>

						<input type="hidden" class="completeFsTitle" value="${fs.fsTitle}">
						<input type="hidden" class="completeFsNo" value="${fs.fsNo}">
						<input type="hidden" class="completeFsWriter"
							value="${fs.fsWriter}">
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="tab-content" id="updateMyInfo">
			<h2>회원정보 변경하기</h2>
			<hr>
			<div class="changeInfo">
				<input type="password" class="longInput" id="memberPwInput"
					style="margin-bottom: 5px; background-color: #f0f0f0; border-radius: 5px; width: 242px;"
					placeholder="비밀번호를 입력해주세요">
				<button class="btn btn-danger" id="btn-modal" style="width: 100%;">회원정보
					변경하기</button>
			</div>
		</div>
		<div class="tab-content" id="deleteMyId">
			<h2>회원탈퇴</h2>
			<hr>
			<div class="changeInfo">
				<input type="password" class="longInput" id="memberPwInput2"
					style="margin-bottom: 5px; background-color: #f0f0f0; border-radius: 5px; width: 242px;"
					placeholder="비밀번호를 입력해주세요">
				<button class="btn btn-danger" id="btn-modalDelete"
					style="width: 100%;">회원정보 변경하기</button>
			</div>
		</div>
		<!-- 	회원정보 삭제 확인모달 -->
		<div class="modal" id="modalDelete">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">회원 정보 삭제확인</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						<p>해당 정보는 복구할 수 없습니다. 정말 삭제하시겠습니까?</p>
					</div>
					<div class="modal-footer">
						<form action="/deleteMyId.do">
							<button type="submit" class="btn btn-primary" id="deleteBtn">네</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">아니오</button>
							<input type="hidden" name="memberId"
								value="${sessionScope.m.memberId }">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<!-- 회원정보 변경모달 -->
	<div id="modal" class="modal-overlay">
		<div class="modal-window">
			<div class="title">
				<h2>회원정보 변경하기</h2>
				<hr>
			</div>
			<div class="close-area">X</div>
			<div class="content">
				<div class="updateMyInfo">
					<form action="/updateMember.do" method="post" id="updateForm">

						<div class="form-group">
							<fieldset disabled="">
								<label class="form-label" for="memberId">ID</label> <input
									class="form-control" id="memberId" name="memberId" type="text"
									placeholder="${sessionScope.m.memberId }"
									value="${sessionScope.m.memberId }" disabled="" />
							</fieldset>
							<input type="hidden" value="${sessionScope.m.memberId }"
								name="memberId">
						</div>
						<div class="form-group">
							<label for="memberPw" class="form-label mt-4">비밀번호</label> <input
								type="password" class="form-control" id="memberPw"
								placeholder="변경할 비밀번호를 입력해주세요." name="memberPw" />
							<div id="error-msg1"></div>
							<div id="noSpace1"></div>
						</div>
						<div class="form-group">
							<label for="memberPw" class="form-label mt-4">비밀번호 확인</label> <input
								type="password" class="form-control" id="memberPwRe"
								placeholder="변경할 비밀번호를 다시 입력해주세요." />
							<div id="error-msg2"></div>
							<div id="noSpace2"></div>
						</div>
						<div class="form-group">
							<fieldset>
								<label class="form-label" for="memberPhone">전화번호</label> <input
									class="form-control" id="memberPhone" type="text"
									placeholder="${sessionScope.m.memberPhone }" name="memberPhone" />
								<div id="error-msg4"></div>
								<div id="noSpace4"></div>
							</fieldset>
						</div>

						<div class="button-form">
							<button id="btnbtn" type="submit" class="btn btn-primary"
								style="width: 50%; float: left;">변경하기</button>
							<button type="reset" class="btn btn-secondary"
								style="width: 50%; float: left;">다시하기</button>
						</div>
						<!-- TODO: alert 창 띄우기 -->
					</form>
				</div>
				<input value="${sessionScope.m.memberId }" type="hidden"
					id="memberIdInput">
			</div>
		</div>
	</div>


	<!-- 	회원정보 삭제 확인모달 -->

	<div class="modal-con modal1">
		<a href="javascript:;" class="close">X</a>
		<p class="title">계정 삭제 확인</p>
		<div class="con">해당정보는 복구할 수 없습니다. 정말 삭제하시겠습니까?</div>
		<div class="buttonWrap">
			<form action="/deleteMyId.do">
				<input type="hidden" name="memberId"
					value="${sessionScope.m.memberId }">
				<button class="btn btn-primary" type="submit">예</button>
				<button type="button" class='btn btn-danger'
					onclick="closeModal('modal1')">아니오</button>
			</form>
		</div>
	</div>
	<!-- 모달모음 -->
	<!-- 모달선택 -->
	<div class="modal-con modalSelect">
		<a href="javascript:;" class="close">X</a>
		<p class="title">선택해주세요</p>
		<div class="selectMenu-wrap">
			<div class="goReview">
				<i class="fas fa-star"></i><br />리뷰남기기
			</div>
			<div class="goReport">
				<i class="fas fa-ban"></i><br />신고하기
			</div>
			<div class="goDetail">
				<i class="fas fa-search-plus"></i><br />상세페이지로
			</div>
		</div>
	</div>
	<div class="modal-con modalSelectNoReview">
		<a href="javascript:;" class="close">X</a>
		<p class="title">선택해주세요</p>
		<div class="selectMenu-wrap" style="justify-content: center;">
			<div class="goReport">
				<i class="fas fa-ban"></i><br />신고하기
			</div>
			<div class="goDetail">
				<i class="fas fa-search-plus"></i><br />상세페이지로
			</div>
		</div>
	</div>
	<!-- 리뷰 -->
	<div class="modal-con writeReivew">
		<a href="javascript:;" class="close">X</a>
		<p class="title">리뷰남기기</p>
		<div class="con review-wrap">
			<div class="star-wrap">
				<select id="reviewSelect">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
			</div>

			<br />
			<div class="reviewContent-wrap">
				<form action="/insertReivew.do">
					<input type="text" name="reviewTitle" placeholder="제목을 입력해주세요."
						class="form-control" /> <input type="hidden" name="reviewScore"
						id="reviewScore" value="3"> <input type="hidden"
						name="fsNo" id="fsNo" value=""> <input type="hidden"
						name="getToday" id="getToday" value="">
					<textarea name="reviewContent" class="form-control" rows="10"
						placeholder="내용을 입력해주세요."></textarea>
					<button class="btn btn-danger">리뷰등록</button>
				</form>
			</div>
		</div>
	</div>
	<!-- 신고 -->
	<div class="modal-con writeReport">
		<a href="javascript:;" class="close">X</a>
		<p class="title">선택해주세요</p>
		<form action="/insertReport.do" method="post"
			enctype="multipart/form-data">
			<div class="con report-wrap">
				<div class="form-group">
					<fieldset disabled="">
						<label class="col-form-label col-form-label-lg mt-4"
							for="serviceTitle">신고할 서비스 이름</label> <input
							class="form-control form-control-lg" type="text"
							id="serviceTitle" value="" />
					</fieldset>
				</div>
				<input type="hidden" value="" id="reportFsNo" name="fsNo"> <input
					type="hidden" value="" id="reportGetToday" name="today">
				<hr />
				<input type="hidden" value="" name="memberId" />
				<div class="form-group">
					<label for="report-category" class="form-label">신고 종류</label> <select
						class="form-select" id="report-category" name="reportCategory">
						<option>서비스 내용 불만</option>
						<option>작업기간 미준수</option>
						<option>기타</option>
					</select>
				</div>
				<div class="form-group">
					<label for="formFile" class="form-label mt-4">신고 관련 이미지</label>
					<!-- TODO: 리스트 나오면 변경 -->
					<input class="form-control" type="file" id="formFile"
						name="reportImage" onchange="loadImg(this);" />
					<div id="img-viewer">
						<div class="card border mb-3" style="max-width: 564px"
							id="imageCard">
							<div class="card-header">신고이미지</div>

							<img id="img-view"  />
						</div>
					</div>
					<div id="noSpace2"></div>
				</div>

				<div class="form-group">
					<label for="reportContent" class="form-label mt-4">신고 내용</label>
					<textarea class="form-control" id="reportContent" rows="5"
						name="reportContent"></textarea>
					<div id="noSpace3"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary">신고하기</button>
				</div>
			</div>
		</form>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
<script src="/resources/js/userMyPage.js">
	
</script>
<script
	src="/resources/jquery-bar-rating-master/dist/jquery.barrating.min.js"></script>
<script type="text/javascript">
	var star;
	$(".compeleteList").click(function() {
		document.get;
		var idx = $(".compeleteList").index(this); //클릭한 게 몇번쨰 답글달기 버튼인지 구하는 코드
		var fsNo = $(".completeFsNo").eq(idx).val();
		var fsTitle = $(".completeFsTitle").eq(idx).val();
		var date = new Date();
		var year = date.getFullYear(); //년도
		var month = date.getMonth() + 1; //월
		var day = date.getDate(); //일

		if ((day + "").length < 2) { // 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
			day = "0" + day;
		}

		var getToday = year + "-" + month + "-" + day; // 오늘 날짜 (2017-02-07)

		$("#modalOutSide").fadeIn(300);
		$(".modalSelect").fadeIn(300);
		$("#fsNo").val(fsNo);
		$("#getToday").val(getToday);
		$("#serviceTitle").val(fsTitle);
		$("#reportFsNo").val(fsNo);
		$("#reportGetToday").val(getToday);

		$(function() {
			$("#reviewSelect").barrating({
				theme : "fontawesome-stars",
				initialRating : 3,
				onSelect : function(value, text, event) {
					// 별점 클릭 후 처리는 여기서 코드
					// 선택한 별점 값을 value로 받음
					console.log(value);
					$("#reviewScore").val(value);

				},
			});
		});
		$(".goDetail").click(function() {
			var pageFront = "/serviceDetail.do?fsNo=";
			var page = pageFront + fsNo;
			location.href = page;
		})
	});
	$(".proceedingList").click(function() {
		document.get;
		var idx = $(".proceedingList").index(this); //클릭한 게 몇번쨰 답글달기 버튼인지 구하는 코드
		var fsNo = $(".proceedingFsNo").eq(idx).val();
		var fsTitle = $(".proceedingFsTitle").eq(idx).val();
		var date = new Date();
		var year = date.getFullYear(); //년도
		var month = date.getMonth() + 1; //월
		var day = date.getDate(); //일

		if ((day + "").length < 2) { // 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
			day = "0" + day;
		}

		var getToday = year + "-" + month + "-" + day; // 오늘 날짜 (2017-02-07)

		$("#modalOutSide").fadeIn(300);
		$(".modalSelectNoReview").fadeIn(300);
		
		$("#fsNo").val(fsNo);
		$("#getToday").val(getToday);
		$("#serviceTitle").val(fsTitle);
		$("#reportFsNo").val(fsNo);
		$("#reportGetToday").val(getToday);

		$(function() {
			$("#reviewSelect").barrating({
				theme : "fontawesome-stars",
				initialRating : 3,
				onSelect : function(value, text, event) {
					// 별점 클릭 후 처리는 여기서 코드
					// 선택한 별점 값을 value로 받음
					console.log(value);
					$("#reviewScore").val(value);

				},
			});
		});
		$(".goDetail").click(function() {
			var pageFront = "/serviceDetail.do?fsNo=";
			var page = pageFront + fsNo;
			location.href = page;
		})
	});
	$("#modalOutSide, .close").on("click", function() {
		$("#modalOutSide").fadeOut(300);
		$(".modal-con").fadeOut(300);
	});
	function closeModal(modalname) {
		$("#modalOutSide").fadeOut(300);
		$(".modal-con").fadeOut(300);
	}
	$(".goReview").click(function() {
		$(".modal-con").fadeOut(300);
		$(".writeReivew").fadeIn(300);
	});
	$(".goReport").click(function() {
		$(".modal-con").fadeOut(300);
		$(".writeReport").fadeIn(300);
	});
	function loadImg(f) {
		console.log(f.files); //input file 에서 선택한 파일을 배열로 가지고 옴
		if (f.files.length != 0) {
			//첨부파일이 있는경우
			var reader = new FileReader(); //첨부파일을 읽어올 객체
			reader.readAsDataURL(f.files[0]);
			//경로를 다 읽어오면 실행할 함수 지정
			reader.onload = function(e) {
				$("#img-view").attr("src", e.target.result);
				$("[name = moimPicture]")
						.attr("class", "form-control is-valid");
				$("#imageCard").attr("class", "card border-success mb-3");
			};
		} else {
			//첨부파일이 없는경우
			$("#img-view").attr("src", "");
			$("[name = moimPicture]").attr("class", "form-control");
		}
	}
</script>
</html>
