<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>chat</title>
      <!-- BS4 설정 -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
      <!-- Chat Css -->
      <link rel="stylesheet" href="/resources/css/chat.css" />

    </head>

    <body>
      <div class="container">
        <!-- 채팅방 리스트 -->
        <div class="chat-list">
          <h3 style="text-align: center; font-weight: bold;">채팅방</h3>
          <br>
          <!-- 채팅 목록 -->
          <!-- class 줘서 this로 index 찾아서 찾기 -->
          <c:forEach items="${list }" var="chat">
            <c:choose>
              <c:when test="${sessionScope.m.grade == 0}">
                <!-- 구매자 / grade 0 / receiver / flag 0 -->
                <a class="chatOne" href="javascript:void(0);"
                  onclick="loadChat('${chat.chatNo}', '${chat.seller}', '${chat.buyer}', 0, this);">
                  <span>[ ${chat.seller} ]</span> 님과의 채팅방</a>
                <input type="hidden" name="scFlag" value="0">
              </c:when>

              <c:otherwise>
                <!-- 판매자 / grade 1 / sender / flag 1 -->
                <a class="chatOne" href="javascript:void(0);"
                  onclick="loadChat('${chat.chatNo}', '${chat.buyer}','${chat.seller}', 1, this);">
                  <span>[ ${chat.buyer} ]</span> 님과의 채팅방</a>
                <input type="hidden" name="scFlag" value="1">
              </c:otherwise>
            </c:choose>
          </c:forEach>
        </div>

        <!-- 채팅 내용 -->
        <div class="chat-room">
          <div class="chatting">
            <div class="messageArea"></div>
            <div class="sendBox">
              <input class="form-control" type="text" id="sendMsg">
              <input type="hidden" id="receiver">
              <input type="hidden" id="chatNo">
              <button class="btn btn-sm btn-outline-success" id="sendBtn" onclick="sendMsg();">전송</button>
            </div>
          </div>
        </div>
        <br>
      </div>

      <!-- 푸터 -->
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>
        <script>
          var ws; // 웹소켓용 변수
          var sessionId = "${sessionScope.m.memberId}"
          //console.log("접속한 회원 ID : " + sessionId);

          ws = new WebSocket("ws://192.168.10.14/chatting.do");
          //ws://khdsa1.iptime.org:18080/ - 추 후 시연 주소
          ws.onopen = startChat;
          ws.onmessage = receiveChat;
          ws.onclose = endChat;

          // 채팅 시작
          function startChat() {
            var data = {
              type: "conn",
              sessionId: sessionId
            };

            ws.send(JSON.stringify(data));
            //appendChat("<p>채팅방에 입장했습니다</p>"); // 접속 시
          };

          // 채팅 수신
          function receiveChat(param) {
            // 처음 채팅 방 로드 시 화면 초기화
            if (param.data == "초기화") {
              $(".messageArea").empty();
            } else {
              appendChat(param.data);
            }
          };

          // 채팅 종료
          function endChat() {
            //appendChat("<p>채팅이 종료되었습니다</p>");
          };

          // 채팅 내용 추가
          function appendChat(msg) {
            $(".messageArea").append(msg);
            $(".messageArea").scrollTop($(".messageArea")[0].scrollHeight);
          };

          // 채팅 보내기
          function sendMsg() {
            var msg = $("#sendMsg").val(); // 보낼 메시지 내용
            var receiver = $("#receiver").val(); // 현재 선택된 채팅방의 receiver
            var scFlag = $("input[name=scFlag]").val(); // 판매자 / 구매자 구별
            var chatNo = $("#chatNo").val(); // 채팅 방 번호

            if (msg != '') {
              var data = {
                type: "chat", msg: msg, receiver: receiver, sender: sessionId, scFlag: scFlag, chatNo: chatNo
              };
              //소켓서버로 문자열 전송
              ws.send(JSON.stringify(data));
              //내화면에 출력
              appendChat("<div class='chat right'>" + msg + "</div>");
              $("#sendMsg").val(""); // 현재 메시지 입력 초기화
            }
          };

          // 엔터키로 전송
          $("#sendMsg").keydown(function (key) {
            if (key.keyCode == 13) {
              sendMsg();
            }
          });

          // 채팅방 클릭시 채팅 불러오기 
          function loadChat(chatNo, sender, rec, flag, chatRoom) {
            var data = {
              type: "loadChat",
              chatNo: chatNo,
              sender: sender,
              receiver: rec,
              flag: flag
            };
            ws.send(JSON.stringify(data));

            $("#receiver").val(sender); // 채팅 보내는 사람 지정
            $("#chatNo").val(chatNo); // 채팅 번호 선정

            $(".chatting").show(); // 채팅 보이기

            // 채팅방 전체선택 초기화 및 선택 유지
            $(".chatOne").removeClass("pick-chat"); // 전체 선택 초기화
            $(chatRoom).addClass("pick-chat"); // 선택 효과
          }
        </script>
    </body>

    </html>