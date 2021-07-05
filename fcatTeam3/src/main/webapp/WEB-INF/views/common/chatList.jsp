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
                <c:when test="${chat.receiver == sessionScope.m.memberId}">
                  <a href="/viewChat.do?chatNo=${chat.chatNo}"><span class="receiver">${chat.sender}</span> 님과의 채팅방!</a>
                  <h1>flag2</h1>
                </c:when>

                <c:otherwise>
                  <a href="/viewChat.do?chatNo=${chat.chatNo}"><span class="receiver">${chat.receiver}</span> 님과의
                    채팅방!</a><!-- test01-->
                  <h1>flag1</h1>
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
                <button class="btn btn-success" id="sendBtn" onclick="sendMsg();">전송</button>
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

            ws = new WebSocket("ws://127.0.0.1/chatting.do");
            //ws://khdsa1.iptime.org:18080/ - 추 후 시연 주소
            ws.onopen = startChat;
            ws.onmessage = receiveChat;
            ws.onclose = endChat;

            function startChat() {
              var data = {
                type: "conn",
                sessionId: sessionId
              };

              ws.send(JSON.stringify(data));
              appendChat("<p>채팅방에 입장했습니다</p>"); // 접속 시
            };

            // 채팅 수신
            function receiveChat(param) {
              appendChat(param.data);
            };

            // 채팅 종료
            function endChat() {
              appendChat("<p>채팅이 종료되었습니다</p>");
            };

            function appendChat(msg) {
              $(".messageArea").append(msg);
              $(".messageArea").scrollTop($(".messageArea")[0].scrollHeight);
            };

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
          </script>
    </body>

    </html>