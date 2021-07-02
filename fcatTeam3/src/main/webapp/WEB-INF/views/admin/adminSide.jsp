<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
    integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <!--fontawesome-->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
    integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
  <!-- google font-->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <!-- style css-->
  <link rel="stylesheet" href="/resources/css/adminstyle.css">
  <!-- 차트 링크 -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <!-- navbar-->
    <nav class="navbar navbar-expand-md navbar-light ">
      <button class="navbar-toggler ml-auto mb-2 bg-light" type="button" data-toggle="collapse" data-target="#sidebar">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="sidebar">
        <div class="container-fluid">
          <div class="row">
            <!-- sidebar -->
            <div class="col-xl-2 sidebar fixed-top">
              <a href="#" class="navbar-brand text-white text-center d-block mx-auto py-3 mb-4
              bottom-border">fCat</a>
              <div class="bottom-border pb-3">
                <a href="#" class="text-white">관리자</a>
              </div>
              <ul class="navbar-nav flex-column mt-4">
                <!-- 대시보드 -->
                <li class="nav-item">
                  <a href="/adminPage.do" class="nav-link text-white p-3 mb-2 sidebar-link">
                    <i class="fas fa-home text-white fa-lg mr-3"></i> 대시보드 
                  </a>
                </li>
                <!-- 유저 -->
                <li class="nav-item">
                  <a href="#" class="nav-link text-white p-3 mb-2 sidebar-link" data-toggle="collapse" data-target="#user">
                    <i class="fas fa-user text-white fa-lg mr-3"></i> 사용자 관리 <span class="fa fa-chevron-down"></span>
                  </a>
                  <ul class="nav child_menu collapse" id="user">
                    <li><a href="/adminMember.do?reqPage=1">회원 관리</a></li>
                    <li><a href="#">판매자 권한</a></li>
                    <li><a href="#">신고관리</a></li>
                  </ul>
                </li>
                <!-- 컨텐츠 -->
                <li class="nav-item">
                  <a href="#" class="nav-link text-white p-3 mb-2 sidebar-link" data-toggle="collapse" data-target="#contentsmenu">
                    <i class="fas fa-table text-white fa-lg mr-3"></i> 컨텐츠 관리 <span class="fa fa-chevron-down"></span>
                  </a>
                  <ul class="nav child_menu collapse" id="contentsmenu">
                    <li><a href="/adminBoardList.do?reqPage=1">게시판관리</a></li>
                    <li><a href="#">메뉴2</a></li>
                  </ul>
                </li>                                
              </ul>
            </div>
            <!--end of sidebar-->
            <!-- top nav bar -->
            <div class="col-xl-10 ml-auto bg-dark fixed-top py-2 top-navbar">
                <div class="row align-items-center">
                  <div class="col-md-8">
                    <h4 class="text-light text-uppercase mb-0">DashBoard</h4>
                  </div>
                  <div class="col-md-4">
                    <ul class="navbar-nav ">
                      <li class="nav-item icon-parent ml-auto "><a href="#" class="nav-link icon-bullet"><i class="fas fa-bell text-muted fa-lg"></i></a></li>
                      <li class="nav-item ml-md-auto"><a href="#" class="nav-link" data-toggle="modal" data-target="#sign-out"><i class="fas fa-sign-out-alt text-danger fa-lg"></i></a></li>
                    </ul>
                  </div>
                </div>
            </div>
            <!-- end of top navbar-->
          </div>
        </div>
      </div>
    </nav>
    <!-- end navbar-->
    <!-- 로그아웃 모달 -->
    <div class="modal fade" id="sign-out">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">로그아웃</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body">
            로그아웃 하시겠습니까?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-success" data-dismiss="modal">아니요</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">네</button>
          </div>
        </div>
      </div>
    </div>
    <!-- 모달 끝-->

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <script src="/resources/js/adminscript.js"></script> -->
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    -->
