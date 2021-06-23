<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>mypage</title>
		<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
	</head>

	<body>
		<h1>알람 테스트</h1><br>
		<h3><a href="/sendMsg.do">메세지 보내기</a></h3><br>
		<h1>
			읽지않은 쪽지 : <span id="alarmCount">0</span>
		</h1>
		<hr>
		<h3><a href="/insertTattle.do">신고하기</a></h3><br>
	</body>
	
	<script>
		var ws;
		var sender = "user01"; // 추 후 member로 변경 해야 함

		$(function () {
			ws = new WebSocket("ws://192.168.10.11/alarmMsg.do");
			// ws://khdsa1.iptime.org:18080/ - 추 후 강사님 주소
			ws.onopen = alarmStart;
			ws.onmessage = alarmMsg;
			ws.onclose = alarmEnd;
		});

		function alarmStart() {
			var data = { type: "conn", memberId: sender };
			ws.send(JSON.stringify(data)); // json 문자열로 전송
		};

		// 서버 소통 로직
		function alarmMsg(param) {
			document.getElementById("alarmCount").innerHTML(param.data); // 알림 숫자 갱신
		};

		function alarmEnd() {

		};

		// 알람 확인
		function alarmCount(receiver) {

		};
	</script>

	</html>