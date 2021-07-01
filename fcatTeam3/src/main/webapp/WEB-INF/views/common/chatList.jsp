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
            <c:forEach items="${list }" var="chat">
              <a href="">${chat.receiver} 님과의 채팅방!</a><!-- test01-->
            </c:forEach>
          </div>

          <!-- 채팅 내용 -->
          <div class="chat-room">
            여기는 채팅방 - 웹소켓 해야해~~
          </div>
          <br>
        </div>

        <!-- 푸터 -->
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
          <script>

          </script>
    </body>

    </html>