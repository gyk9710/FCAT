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
          width: 100%;
        }
      </style>
    </head>

    <body>
      <header>
        여기는 헤더
      </header>

      <!-- 콘텐츠 -->
      <div class="container">
        <h4><a href="/">홈</a></h4>
        <h4>서비스 요청 리스트</h4><br>

        <table class="table-sm table-bordered table-hover text-center">
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
                  <button class="btn btn-sm btn-outline-info">승인</button>
                  <button class="btn btn-sm btn-outline-danger">반려</button>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
        <br>
        <div class="text-center">
          <button class="btn btn-sm btn-outline-info">체크 승인</button>
          <button class="btn btn-sm btn-outline-danger">체크 반려</button>
        </div>
      </div>

      <footer>
        여기는 푸터
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
      </script>
    </body>

    </html>