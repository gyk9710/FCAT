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
      <!--  헤더  -->
      <%@include file="/WEB-INF/views/common/headerBootstrap5.jsp" %>

        <div class="container">
          <!-- 채팅방 리스트 -->
          <div class="chat-list">
            <!-- 채팅 목록 -->
            <!-- class 줘서 this로 index 찾아서 찾기 -->
            <c:forEach items="${list }" var="chat">
              <c:choose>
                <c:when test="${sessionScope.m.grade == 0}">
                  <!-- 구매자 / grade 0 / receiver / flag 0 -->
                  <a href="javascript:void(0);"
                    onclick="loadChat('${chat.chatNo}', '${chat.seller}', '${chat.buyer}', 0);"><span
                      class="receiver">${chat.seller}</span> 님과의
                    채팅방!</a>
                  <input type="hidden" name="scFlag" value="0">
                </c:when>

                <c:otherwise>
                  <!-- 판매자 / grade 1 / sender / flag 1 -->
                  <a href="javascript:void(0);"
                    onclick="loadChat('${chat.chatNo}', '${chat.buyer}','${chat.seller}', 1);"><span
                      class="receiver">${chat.buyer}</span> 님과의
                    채팅방!</a>
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
                <input class="" type="text" id="sendMsg">
                <button class="btn btn-info" id="sendBtn" onclick="sendMsg();">전송</button>
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
              var msg = $("#sendMsg").val();
              var receiver = $(".receiver").eq(0).text();
              //console.log(receiver);

              if (msg != '') {
                var data = {
                  type: "chat", msg: msg, receiver: receiver, sender: sessionId
                };
                //소켓서버로 문자열 전송
                ws.send(JSON.stringify(data));
                //내화면에 출력
                appendChat("<div class='chat right'>" + msg + "</div>");
                $("#sendMsg").val("");
              }
            };

            // 엔터키로 전송
            $("#sendMsg").keydown(function (key) {
              if (key.keyCode == 13) {
                sendMsg();
              }
            });

            // 1. chatNo 채팅 불러오기 
            function loadChat(chatNo, sender, receiver, flag) {
              var data = {
                type: "loadChat",
                chatNo: chatNo,
                sender: sender,
                receiver: receiver,
                flag: flag
              };
              ws.send(JSON.stringify(data));

              $(".chatting").slideDown(); // 채팅 보이기
            }
          </script>
    </body>

    </html>