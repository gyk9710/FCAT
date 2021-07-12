<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>my page</title>
      <!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script> -->
      <!-- BS4 설정 -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <script>
      $(function () {
        $(".sub-menu").prev().append("<span class='more'>+</span>");

        $(".more").click(function (evente) {
          $(this).parent().next().slideToggle(400); // 서브메뉴 출력
          // 누르지 않은 상태
          if ($(this).attr("class") == 'more') {
            $(this).addClass('active');
            $(this).parent().css("border-bottom", "2px solid #00c7ae"); // 선택 효과
          } else { // 눌린 상태
            $(this).removeClass('active');
            $(this).parent().css("border-bottom", "transparent");
            $(this).parent().next().find("a").css("font-weight", "normal");
          }
          evente.stopPropagation();//이벤트버블링제거
        });

        // +가 아닌 메뉴 범위를 눌렀을때도 인식
        $(".more").parent().click(function () {
          $(this).children().last().click();
        });

        // 들어올 시 판매관리 - 요청중 클릭 효과
        $(".more").eq(0).addClass('active'); // + 표시 클릭효과
        $(".more").eq(0).parent().next().show();// 판매관리 보이기
        $(".sub-menu").eq(0).children().eq($("#curState").val()).find("a").css("font-weight", "700"); // 서브 메뉴선택 효과

        // li 클릭 효과
        $(".more").eq(0).parent().css("border-bottom", "2px solid #00c7ae");// 아래 border 효과
      });
    </script>

    <link rel="stylesheet" href="/resources/css/mypage.css">

    <body>
      <input id="curState" type="hidden" value="${srState}">
      <div class="container">
        <div class="my_l">
          <div class="menu">
            <h3 style="text-align: center;">MY PAGE</h3>
            <br>
            <c:choose>
              <c:when test="${sessionScope.m.grade == 1}">
                <!-- 판매자 -->
                <ul class="main-menu">
                  <li>
                    <a href="#">판매관리</a>
                    <ul class="sub-menu">
                      <li><a href="/mypage.do?fsWriter=${sessionScope.m.memberId}&srState=0">요청중</a></li>
                      <li><a href="/mypage.do?fsWriter=${sessionScope.m.memberId}&srState=1">진행중</a></li>
                      <li><a href="/mypage.do?fsWriter=${sessionScope.m.memberId}&srState=2">완료</a></li>
                    </ul>
                  </li>
                  <li>
                    <a href="#">나의서비스</a>
                    <ul class="sub-menu">
                      <li><a href="/fserviceFrm.do">서비스 등록</a></li>
                      <li><a href="/myserviceUpdateList.do?fsWriter=${sessionScope.m.memberId}">서비스 수정</a></li>
                      <li><a href="/myserviceDeleteList.do?fsWriter=${sessionScope.m.memberId}">서비스 삭제</a></li>
                    </ul>
                  </li>
                  <li>
                    <a href="#">커뮤니티</a>
                    <ul class="sub-menu">
                      <li><a href="#">쪽지함</a></li>
                      <li><a href="/chatList.do?memberId=${sessionScope.m.memberId}">채팅방</a></li>
                    </ul>
                  </li>
                </ul>
              </c:when>

              <c:otherwise>
                <!-- 구매자 -->
                <ul class="main-menu">
                  <li>
                    <a href="#">구매관리</a>
                    <ul class="sub-menu">
                      <li><a href="/mypage.do?requestId=${sessionScope.m.memberId}&srState=0">요청중</a></li>
                      <li><a href="/mypage.do?requestId=${sessionScope.m.memberId}&srState=1">진행중</a></li>
                      <li><a href="/mypage.do?requestId=${sessionScope.m.memberId}&srState=2">완료</a></li>
                    </ul>
                  </li>
                  <li>
                    <a href="#">판매자 권한</a>
                    <ul class="sub-menu">
                      <li><a href="/sellerAskFrm.do">판매자 전환 신청</a></li>
                    </ul>
                  </li>
                  <li>
                    <a href="#">커뮤니티</a>
                    <ul class="sub-menu">
                      <li><a href="#">쪽지함</a></li>
                      <li><a href="/chatList.do?memberId=${sessionScope.m.memberId}">채팅방</a></li>
                    </ul>
                  </li>
                </ul>
              </c:otherwise>
            </c:choose>
          </div>
        </div>

        <div class="my_r">
          <c:choose>
            <c:when test="${sessionScope.m.grade == 1}">
              <span style="font-size: 20px; display: inline-block; margin-bottom: 10px;">판매관리</span>&nbsp;&nbsp;&nbsp;
              <c:choose>
                <c:when test="${srState == 0}">
                  요청중
                </c:when>
                <c:when test="${srState == 1}">
                  진행중
                </c:when>
                <c:otherwise>
                  완료
                </c:otherwise>
              </c:choose>

              <table class="table table-bordered table-hover text-center center">
                <thead>
                  <tr class="table-success text-center">
                    <!-- <th><input type="checkbox" id="allCheck"></th> -->
                    <th>번호</th>
                    <th>서비스제목</th>
                    <th>대분류</th>
                    <th>중분류</th>
                    <th>신청인</th>
                    <c:if test="${srState != 2 }">
                      <th>확인</th>
                    </c:if>

                  </tr>
                </thead>
                <tbody class="text-center">
                  <c:forEach items="${list }" var="rs" varStatus="i">
                    <tr>
                      <!-- <td><input type="checkbox" name="requestService"></td> -->
                      <td>${i.count }</td>
                      <td>${rs.fsTitle}</td>
                      <td>${rs.fsCategory}</td>
                      <td>${rs.fsChildCategory}</td>
                      <td>${rs.requestId}</td>
                      <c:if test="${srState != 2 }">
                        <td>
                          <button class="btn btn-sm btn-outline-primary confirmService">승인</button>
                        </td>
                      </c:if>
                      <td style="display: none;">${rs.srNo }</td>
                      <td style="display: none;">${rs.srState }</td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
              <br>
            </c:when>

            <c:otherwise>
              <!-- 구매자 -->
              <span style="font-size: 20px; display: inline-block; margin-bottom: 10px;">구매관리</span>&nbsp;&nbsp;&nbsp;
              <c:choose>
                <c:when test="${srState == 0}">
                  요청중
                </c:when>
                <c:when test="${srState == 1}">
                  진행중
                </c:when>
                <c:otherwise>
                  완료
                </c:otherwise>
              </c:choose>

              <table class="table table-bordered table-hover text-center">
                <thead>
                  <tr class="table-success">
                    <th>번호</th>
                    <th>서비스제목</th>
                    <th>대분류</th>
                    <th>중분류</th>
                    <th>판매자</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${list }" var="rs" varStatus="i">
                    <tr>
                      <td>${i.count }</td>
                      <td>${rs.fsTitle}</td>
                      <td>${rs.fsCategory}</td>
                      <td>${rs.fsChildCategory}</td>
                      <td>${rs.fsWriter}</td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
              <br>
            </c:otherwise>
          </c:choose>
        </div>

      </div>
      <hr style="width: 1140px;">
      <%@ include file="/WEB-INF/views/common/footer.jsp" %>

        <script>
          // 서비스 요청 수락 / 거절
          $(".confirmService").on("click", function () {
            var srNo = $(this).parent().next().text(); // 요청한 서비스 요청 번호
            var srState = $(this).parent().next().next().text(); // 현재 서비스 상태
            var requestId = $(this).parent().prev().text();
            var fsWriter = '${ sessionScope.m.memberId }';

            // console.log(srNo);
            // console.log(srState);
            // console.log(fsWriter);

            location.href = "/updateServiceRequest.do?srNo=" + srNo + "&srState=" + srState + "&fsWriter=" + fsWriter + "&requestId=" + requestId;
            //console.log(requestId);

            // $.ajax({
            //   url: "/confirmRequestService.do",
            //   type: "post",
            //   data: { srNo: srNo },
            //   success: function (data) {
            //     // 요청 리스트 수락
            //     if (confirm == '수락') {
            //       if (data == 1) {
            //         alert("요청 수락 성공!!");
            //         confirmRequestService(requestId, 1); // 성공
            //         location.reload();
            //       } else {
            //         alert("요청 수락 실패!!");
            //       }
            //     }

            //   }
            // });
          });

          // 알람
          // var ws; // 웹소켓용 변수
          // var sender = "${sessionScope.m.memberId}";

          // // 웹 소켓 생성
          // ws = new WebSocket("ws://127.0.0.1/alarmMsg.do"); // 웹 소켓 연결
          // // ws://khdsa1.iptime.org:18080/ - 추 후 시연 주소
          // ws.onopen = alarmStart;
          // ws.onmessage = alarmMsg;
          // ws.onclose = alarmEnd;

          // // 웹 소켓 연결 성공 시
          // function alarmStart() {
          //   var data = {
          //     type: "conn",
          //     memberId: sender
          //   };
          //   ws.send(JSON.stringify(data)); // json 문자열로 전송
          //   alarmCount(sender); // 현재 연결 된 세션 알람 체크
          // };

          // // 서버 소통 로직
          // function alarmMsg(param) {
          //   $("#alarmCount").text(param.data); // 알림 숫자 갱신
          //   //console.log("통신 성공~!");
          // };

          // // 웹 소켓 연결 종료
          // function alarmEnd() {

          // };

          // // 알람 확인
          // function alarmCount(receiver) {
          //   var data = {
          //     type: "alarm",
          //     memberId: receiver
          //   };
          //   ws.send(JSON.stringify(data));
          // };

          // // 요청 수락
          // function confirmRequestService(requestId) {
          //   var msgTitle = "서비스 요청 결과 알림!";
          //   var msgContent = "";

          //   var data = {
          //     type: "confirm",
          //     msgReceiver: requestId,
          //     msgSender: sender,
          //     msgTitle: msgTitle,
          //     msgContent: msgContent,
          //   };
          //   ws.send(JSON.stringify(data));
          // };
        </script>
    </body>

    </html>