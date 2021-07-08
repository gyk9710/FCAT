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
  <body>
  <%@include file="/WEB-INF/views/admin/adminSide.jsp" %>
    <!-- 테이블-->
    <section>
      <div class="container-fluid">
        <div class="row mb-5">
          <div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
            <div class="row">
              <div class="col-12">
                <br>
                <br>
                <br>
                <h1 class="text-muted text-center mb-3">판매자 신청 리스트</h1>
        
                <table class="table bg-light text-center" style="width:100%;">
                  <thead>
                  <tr class="text-muted">
                    <th>아이디</th><th>카테고리</th><th>2차 카테고리</th><th>자기소개</th><th>학교명</th><th>전공</th><th>상태</th><th>자격증</th><th>발급일</th><th>발급기관</th>
                    <th>승인</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="sa" varStatus="i">
                  <tr>
				  <th>${sa.saId }</th>
                  <th style="display:none">${sa.saNo }</th>
				  <th>${sa.saCategory }</th>
				  <th>${sa.saChildCategory }</th>
				  <th>${sa.saIntrod }</th>
				  <th>${sa.saCollege }</th>
                	<th>${sa.saMajor }</th>
                	<th>${sa.saState }</th>
                	<th>${sa.saLicense }</th>
                	<th>${sa.saLcDate }</th>
                	<th>${sa.saLcOrg }</th>
                  <th>
                  <button type="button" class="btn btn-info btn-sm updateGrade">승인</button>
                  </th>
                </tr>
                </c:forEach>
                </tbody>
                </table>
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
 		$(".updateGrade").click(function(){
 			var saNo = $(this).parent().parent().children().next().html();	
 			var memberId = $(this).parent().parent().children().html();					
 			location.href="/updateGrade.do?memberId="+memberId+"&saNo="+saNo;
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