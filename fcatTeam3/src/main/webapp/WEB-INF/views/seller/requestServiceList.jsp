<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>requestService</title>
			<!-- BS4 설정 -->
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

			<style>
				.text-center {
					width: 80%;
				}

				.center {
					margin: 0 auto;
				}

				h4 {
					width: 80%;
					margin: 0 auto;
				}
			</style>
		</head>

		<body>
			<!-- 헤더 -->
			<header>
				<%@include file="/WEB-INF/views/common/headerBootstrap5.jsp" %>
			</header>
			<br>
			<br>
			<!-- 콘텐츠 -->
			<div class="container">
				<h4>
					<a href="/">홈</a>
				</h4>
				<br>

				<h4>읽지 않은 메시지 : <span id="alarmCount"></span></h4>

				<input type="hidden" value="">
				<table class="table-sm table-bordered table-hover text-center center">
					<thead>
						<tr class="table-success text-center">
							<th><input type="checkbox" id="allCheck"></th>
							<th>번호</th>
							<th>대분류</th>
							<th>중분류</th>
							<th>신청한 회원 아이디</th>
							<th>확인</th>
						</tr>
					</thead>

					<tbody class="text-center">
						<c:forEach items="${list }" var="rs" varStatus="i">
							<tr>
								<td><input type="checkbox" name="requestService"></td>
								<td>${i.count }</td>
								<td>${rs.fsCategory}</td>
								<td>${rs.fsChildCategory}</td>
								<td>${rs.requestId}</td>
								<td>
									<button class="btn btn-sm btn-outline-info confirmService">수락</button>
									<button class="btn btn-sm btn-outline-danger confirmService">거절</button>
								</td>
								<td style="display: none;">${rs.srNo }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br>
				<div class="text-center center">
					<button class="btn btn-sm btn-outline-info">체크 수락</button>
					<button class="btn btn-sm btn-outline-danger">체크 거절</button>
				</div>
			</div>
			<br>
			<br>
			<!-- 푸터 -->
			<footer>
				<%@ include file="/WEB-INF/views/common/footer.jsp" %>
			</footer>

			<script>
				// 전체 체크 버튼
				var allCheck = document.getElementById("allCheck");
				// 서비스 요청 리스트
				var checkboxList = document.getElementsByName("requestService");

				// 전체 체크 클릭 시
				allCheck.addEventListener("click", function () {
					// 전체 체크 클릭
					for (var i = 0; i < checkboxList.length; i++) {
						checkboxList[i].checked = this.checked;
					}
				});

				// td 정렬
				$("td").addClass("align-middle");

				// 서비스 요청 수락 / 거절
				$(".confirmService").on("click", function () {
					var srNo = $(this).parent().next().text(); // 요청한 서비스 요청 번호
					var requestId = $(this).parent().prev().text(); // 요청한 회원 ID
					var confirm = $(this).text(); // 수락/거절 확인
					//console.log(confirm);

					$.ajax({
						url: "/confirmRequestService.do",
						type: "post",
						data: { srNo: srNo },
						success: function (data) {
							// 요청 리스트 수락
							if (confirm == '수락') {
								if (data == 1) {
									alert("요청 수락 성공!!");
									confirmRequestService(requestId, 1); // 성공
									location.reload();
								} else {
									alert("요청 수락 실패!!");
								}
								// 요청 리스트 거절
							} else if (confirm == '거절') {
								if (data == 1) {
									alert("요청 거절 성공!!");
									confirmRequestService(requestId, 0); // 거절
									location.reload();
								}
								else {
									alert("요청 승인 실패!!");
								}
							}

						}
					});

				});

				// 알람
				var ws; // 웹소켓용 변수
				var sender = "${sessionScope.m.memberId}";

				// 웹 소켓 생성
				ws = new WebSocket("ws://127.0.0.1/alarmMsg.do"); // 웹 소켓 연결
				// ws://khdsa1.iptime.org:18080/ - 추 후 시연 주소
				ws.onopen = alarmStart;
				ws.onmessage = alarmMsg;
				ws.onclose = alarmEnd;

				// 웹 소켓 연결 성공 시
				function alarmStart() {
					var data = {
						type: "conn",
						memberId: sender
					};
					ws.send(JSON.stringify(data)); // json 문자열로 전송
					alarmCount(sender); // 현재 연결 된 세션 알람 체크
				};

				// 서버 소통 로직
				function alarmMsg(param) {
					$("#alarmCount").text(param.data); // 알림 숫자 갱신
					//console.log("통신 성공~!");
				};

				// 웹 소켓 연결 종료
				function alarmEnd() {

				};

				// 알람 확인
				function alarmCount(receiver) {
					var data = {
						type: "alarm",
						memberId: receiver
					};
					ws.send(JSON.stringify(data));
				};

				// 요청 수락 / 거절
				function confirmRequestService(requestId, flag) {
					var msgTitle = "서비스 요청 결과 알림!";
					var msgContent = "";

					// 수락
					if (flag == 1) {
						msgContent = "서비스 요청이 승락 되었어요~!";
					} else {// 거절
						msgContent = "서비스 요청이 거절 되었어요..ㅠ";
					}

					var data = {
						type: "confirm",
						msgReceiver: requestId,
						msgSender: sender,
						msgTitle: msgTitle,
						msgContent: msgContent,
					};
					ws.send(JSON.stringify(data));
				};
			</script>
		</body>

		</html>