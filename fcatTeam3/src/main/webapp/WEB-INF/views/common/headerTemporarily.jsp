<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
 <link rel="stylesheet"
	href="/resources/headerassets/materialize/css/materialize.min.css"
	media="screen,projection" />
<!-- Bootstrap Styles-->
<link href="/resources/headerassets/css/headerbootstrap.css"
	rel="stylesheet" />

<!-- jquery -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>

<!-- FontAwesome Styles-->
<link href="/resources/headerassets/css/headerfont-awesome.css"
	rel="stylesheet" />
<!-- Morris Chart Styles-->
<link href="/resources/headerassets/js/morris/morris-0.4.3.min.css"
	rel="stylesheet" />
<!-- Custom Styles-->
<link href="/resources/headerassets/css/headercustom-styles.css"
	rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />

<link rel="stylesheet"
	href="/resources/headerassets/js/Lightweight-Chart/cssCharts.css">
<style>
.h_search {
	width: 20% !important;
	color: black;
	border-bottom: 1px solid black !important;
	position: relative;
	left: 30px;
	top: 10px;
}
.b_search {
	position: relative;
	left: 30px;
	top: 10px;
}
.f_i {
	display: inline;
}
/* The Modal (background) */
.searchModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 10; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	 /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.search-modal-content {
	background-color: #fefefe;
	margin: 10% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	border-radius :15px; 
	width: 400px; /* Could be more or less, depending on screen size */
	height: 500px;
}


.colorfulBtn {
  position:relative;
  left:50%;
  transform: translateX(-50%);
  margin-bottom: 40px;
 border-radius :7px;
  height:40px;
  background: linear-gradient(125deg,#000000,#7dffff,#005a5a,#000000,#7dffff,#005a5a);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}
.colorfulBtn:hover{
background-position: right;
}

</style>
<script>
	$(function() {
		$("#login").hide();
	})
	function login() {
		$("#login").show();
	}
	function closeModal() {
		$("#login").hide();
	}
</script>
</head>
<body>

	<nav class="navbar navbar-default top-navbar" role="navigation"
		id="nav">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle waves-effect waves-dark"
				data-toggle="collapse" data-target=".sidebar-collapse">

				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand waves-effect waves-dark" href="#"><img
				src="/resources/headerassets/img/logo-w.png"
				class="large material-icons"> fCat</a>


		</div>
		<form action="/search.do" class="f_i">
			<input type="text" placeholder="원하는 서비스를 검색해주세요" class="h_search"
				name="keyword">
			<button class="btn btn-outline-secondary b_search" id="button-addon1">
				<!-- <i class="bi bi-search">검색</i> -->
				<i class="glyphicon glyphicon-search"></i>
			</button>
		</form>
		<ul class="nav navbar-top-links navbar-right" id="myThing">
			<!-- 로그인 -->



			<li><a class="dropdown-button waves-effect waves-dark" href="#!"
				data-activates="dropdown4"><i class="fa fa-envelope fa-fw"></i>
					<i class="material-icons right">arrow_drop_down</i></a></li>



			<li><a class="dropdown-button waves-effect waves-dark" href="#!"
				data-activates="dropdown2"><i class="fa fa-bell fa-fw"></i> <i
					class="material-icons right">arrow_drop_down</i></a></li>


			<!-- 로그인 됐을때 부분  -->
			<c:choose>
				<c:when test="${empty sessionScope.m}">
					<li><a class="dropdown-button waves-effect waves-dark" href="/loginFrm.do" onClick="login();return false;" style="padding:17px; font-weight: bold; padding:17px;">
					<img src="/resources/img/login.png"></a>
					
					</li>
					<li><a class="dropdown-button waves-effect waves-dark" href="/joinCheck.do">회원가입</a></li>
				</c:when>
				<c:otherwise>
				<li>
					<a class="dropdown-button waves-effect waves-dark" href="#!"
						data-activates="dropdown1"><i class="fa fa-user fa-fw"></i> <b>[${sessionScope.m.memberName}]님 환영합니다.</b>
						<i class="material-icons right">arrow_drop_down</i></a>								
							</li>
				</c:otherwise>

			</c:choose>

			<!-- 
						
			<li><a class="dropdown-button waves-effect waves-dark" href="#!"
				data-activates="dropdown1"><i class="fa fa-user fa-fw"></i> <b>가연님</b>
					<i class="material-icons right">arrow_drop_down</i></a></li>
					
					-->
		</ul>
	</nav>


			<!-- 로그인 모달부분 -->

	<div id="login" class="searchModal">
		<div class="search-modal-content">
			<div class="page-header">
				<span style="text-align:center;"><h1>로그인 페이지</h1></span>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-12">
							<hr>
							<form action="/login.do" method="post">
								아이디 : <input type="text" name="memberId"> <br> 비밀번호
								: <input type="password" name="memberPw"> <br>
								<div style="cursor: pointer; background-color: #DDDDDD; text-align: center; height: 44px;">
								<input class="colorfulBtn"type="submit" value="Login" style="width : 100%; height:100%;">
									</div>
							</form><br><br>
				<div style="cursor: pointer; background-color: #DDDDDD; text-align: center; height: 44px;">
				<button class="colorfulBtn" onClick="closeModal();" style="width : 100%; height:100%;">닫기</button>
				<!-- <span class="pop_bt modalCloseBtn" style="font-size: 13pt;">닫기	</span>-->
			</div>

						</div>
					</div>
				</div>
			</div>			
		</div>
	</div>
	<input type="text" placeholder="원하는 서비스를 검색해주세요" class="h_search">
	<input type="submit" value="search" class="b_search">


	<!-- Dropdown Structure 마이페이지 드롭다운 -->
	<!-- Dropdown Structure -->
	<ul id="dropdown1" class="dropdown-content">
		<li><a href="/mypage.do"><i class="fa fa-user fa-fw"></i> my page</a></li>
		<li><a href="/logout.do"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
	</ul>
	<ul id="dropdown2" class="dropdown-content w250">
		<li>
			<div>
				<i class="fa fa-comment fa-fw"></i> New Comment <span
					class="pull-right text-muted small">4 min</span>
			</div>
		</li>

		<li class="divider"></li>
		<li>
			<div>
				<i class="fa fa-envelope fa-fw"></i> Message Sent <span
					class="pull-right text-muted small">4 min</span>
			</div>

		</li>

		<li class="divider"></li>
		<li><a class="text-center" href="#"> <strong>See All
					Alerts</strong> <i class="fa fa-angle-right"></i>
		</a></li>
	</ul>

	<ul id="dropdown4"
		class="dropdown-content dropdown-tasks w250 taskList">
		<li>
			<div>
				<strong>판매자 닉네임</strong> <span class="pull-right text-muted">
					<em>Today</em>
				</span>
			</div>
			<p>작업기간 단축 원하시면 + 20000원 더해주시면 됩니다</p> </a>
		</li>



		<li class="divider"></li>
		<li><a class="text-center" href="#"> <strong>모든 대화방
					보기</strong> <i class="fa fa-angle-right"></i>
		</a></li>
	</ul>

	<script src="/resources/headerassets/js/jquery-1.10.2.js"></script>

	<!-- Bootstrap Js -->
	<script src="/resources/headerassets/js/bootstrap.min.js"></script>

	<script src="/resources/headerassets/materialize/js/materialize.min.js"></script>

	<!-- Metis Menu Js -->
	<!-- <script src="assets/js/jquery.metisMenu.js"></script> -->
	<!-- Morris Chart Js -->
	<!-- <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
        <script src="assets/js/morris/morris.js"></script>
        
        
        <script src="assets/js/easypiechart.js"></script>
        <script src="assets/js/easypiechart-data.js"></script>
        
         <script src="assets/js/Lightweight-Chart/jquery.chart.js"></script>
         -->
	<!-- Custom Js -->
	<!-- <script src="assets/js/custom-scripts.js"></script>  -->


</body>
</html>