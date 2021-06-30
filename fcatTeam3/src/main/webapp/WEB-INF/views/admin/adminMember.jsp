<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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
                <h1 class="text-muted text-center mb-3">전체 회원 리스트</h1>
                <!-- 회원검색창 -->
               <div class="col-md-3 float-right">
                  <form action="">
                    <div class="input-group">
                      <input type="text" class="form-control search-input" placeholder="회원검색">
                      <button type="button" class="btn btn-light search-button">
                        <i class="fas fa-search text-danger"></i>
                      </button>
                    </div>
                  </form>
                </div>     
                <!-- 회원검색창 끝 -->           
                <table class="table bg-light text-center" style="width:100%;">
                  <thead>
                  <tr class="text-muted">
                    <th><input type="checkbox" class="allchk"></th><th>아이디</th><th>이름</th><th>전화번호</th><th>주소</th><th>가입일</th><th>회원등급</th><th>쪽지보내기</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                  <th><input type="checkbox" class="chk"></th>
                  <th>test1</th>
                  <th>테스트</th>
                  <th>010-1234-5678</th>
                  <th>서울</th>
                  <th>2021-06-21</th>
                  <th>일반회원</th>
                  <th><button type="button" class="btn btn-info btn-sm">쪽지</button></th>
                </tr>
                <tr>
                  <th><input type="checkbox" class="chk"></th>
                  <th>test2</th>
                  <th>테스트2</th>
                  <th>010-1234-5678</th>
                  <th>서울</th>
                  <th>2021-06-20</th>
                  <th>일반회원</th>
                  <th><button type="button" class="btn btn-info btn-sm">쪽지</button></th>
                </tr>
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