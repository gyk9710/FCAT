<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>index</title>
</head>
  <body>
  <%@include file="/WEB-INF/views/admin/adminSide.jsp" %>
   <!-- 테이블-->
   <section>
    <div class="container-fluid">
      <div class="row mb-5">
        <div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
          <div class="row">
            <div class="col-12">
              <br><br><br>
              <h1 class="text-muted text-center mb-3">고객센터 리스트</h1>
              <!-- 분류 목록-->
              <div class="col-2">
              <ul class="list-group">
                <li class="list-group-item d-flex justify-content-between align-items-center">
                  <a href="#" class="text-Secondary">전체</a>
                  <span class="badge bg-Secondary">2</span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                  <a href="#">공지사항</a>
                  <span class="badge bg-Secondary">1</span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                  <a href="#">FAQ</a>
                  <span class="badge bg-Secondary">1</span>
                </li>
              </ul>
            </div>
            <!-- 분류목록 끝-->
            <br>
              <table class="table bg-light text-center" style="width:100%;">
                <thead>
                <tr class="text-muted">
                  <th><input type="checkbox" class="allchk"></th><th>번호</th><th>분류</th><th>제목</th><th>작성일</th><th>조회수</th><th>수정</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach items="${list }" var="board" varStatus="i">
              	<tr>
              		<th><input type="checkbox" class="chk"></th>
              		<th>${i.count }</th>
              		<c:choose>
              			<c:when test="${board.boardClass == 0 }">
              				<th>FAQ</th>
              			</c:when>
              			<c:otherwise>
              				<th>공지사항</th>
              			</c:otherwise>
              		</c:choose>
              		<th>${board.boardTitle }</th>
              		<th>${board.boardDate }</th>
              		<th>${board.boardCount }</th>
              		<th><a href="adminBoardUpdateFrm.do" class="btn btn-info">수정</a>
              	</tr>	
              </c:forEach>
            </tbody>
          </table>  
          <div class="float-right">
            <a href="adminBoardWriteFrm.do" class="btn btn-info">글쓰기</a>
            <a href="adminBoardDelete.do" class="btn btn-info">삭제</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>  
</section>
  <!-- 테이블 끝-->
  

    
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
     <script src="/resources/js/adminscript.js"></script>
     <script>
     $(document).ready(function() {
         
         $(".allchk").click(function(){
                //만약 전체 선택 체크박스가 체크된상태일경우
                if($(".allchk").prop("checked")) {
                    $("input[type=checkbox]").prop("checked",true);
                    //input type이 체크박스인것은 모두 체크함
                } else {
                    $("input[type=checkbox]").prop("checked",false);
                    //input type이 체크박스인것은 모두 체크 해제함
                }
          });
    });
     </script>
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    -->
  </body>
</html>