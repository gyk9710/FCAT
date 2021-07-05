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
                  <a href="adminBoardList.do?reqPage=1" class="text-Secondary">전체</a>
                  <span class="badge bg-Secondary">${noticeCount+faqCount }</span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                  <a href="adminBoardClassList.do?boardClass=1">공지사항</a>
                  <span class="badge bg-Secondary">${noticeCount }</span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                  <a href="adminBoardClassList.do?boardClass=0">FAQ</a>
                  <span class="badge bg-Secondary">${faqCount }</span>
                </li>
              </ul>
            </div>
            <!-- 분류목록 끝-->
            <br>
              <table class="table bg-light text-center" style="width:100%;">
                <thead>
                <tr class="text-muted">
                  <th><input type="checkbox" class="allchk"></th><th>번호</th><th>분류</th><th>제목</th><th>작성일</th><th>수정</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach items="${list }" var="board" varStatus="i">
              	<tr>
					<th><input type="checkbox" class="chk"></th>
              		<th>${i.count }</th>
              		<th style="display:none">${board.boardNo }</th>
              		<c:choose>
              			<c:when test="${board.boardClass == 0 }">
              				<th>FAQ</th>
              			</c:when>
              			<c:otherwise>
              				<th>공지사항</th>
              			</c:otherwise>
              		</c:choose>
              		<th data-toggle="collapse" data-target="#A${board.boardNo }" role="button">${board.boardTitle }</th>
              		<th>${board.boardDate }</th>
              		<th><a href="adminBoardUpdateFrm.do?boardNo=${board.boardNo }" class="btn btn-info">수정</a>
              	</tr>	
              	<tr>
              	<th colspan="12" class="text-center collapse" id="A${board.boardNo }" >${board.boardContent }</th>
              	</tr>
              </c:forEach>
            </tbody>
          </table>  
          <div >${pageNavi }</div>   
          <div class="float-right">
            <a href="adminBoardWriteFrm.do" class="btn btn-info">글쓰기</a>
            <button class="btn btn-info " data-toggle="modal" data-target="#deleteBoard" >삭제</button>
            
                            <!-- 삭제 모달 -->
    <div class="modal fade" id="deleteBoard">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">삭제</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body">
            삭제하시겠습니까?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-danger deleteBoard" data-dismiss="modal">네</button>
            <button type="button" class="btn btn-success" data-dismiss="modal">아니요</button>
          </div>
        </div>
      </div>
    </div>
    <!-- 모달 끝-->
            <!-- 
            <a href="adminBoardDelete.do" class="btn btn-info" >삭제</a>
             -->
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
		$(".deleteBoard").click(function(){
 			var inputs = $(".chk:checked");		<%-- 전체 체크박스중 체크된 체크박스만 선택 --%>
 			var num = new Array();				<%-- 회원번호 저장할 배열 --%>
 			inputs.each(function(idx,item){
 			num.push($(item).parent().next().next().html());	
 			console.log(num);
 			
 			console.log(num.join("/"));
 			location.href="/adminBoardDelete.do?num="+num.join("/");
 			});
		});
     </script>
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