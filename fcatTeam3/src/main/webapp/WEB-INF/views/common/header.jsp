<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>

</head>
<style>

body{
	margin:0px;
}
.wrap{
	margin: 0px ;
}

.headermenu {

	height: 70px;
	overflow: hidden;
	
}
/*.headermenu1{
	float:left;
	width: 260px;
    text-align: left;
    height: 60px;
    font-size: 24px;
    font-weight: 700;
    line-height: 30px;
    background: #a6f2db;
}

.headermenu1 {
	float: left;
	line-height: 70px;
	height: 70px;
}
*/
.a{
background-color: #368079;
}
.headermenu1 {
	float: left;
position: relative;
cursor: pointer;
display: inline-block;
overflow: hidden;
user-select: none;
-webkit-tap-highlight-color: transparent;
vertical-align: middle;
    z-index: 1;
        will-change: opacity, transform;
    transition: .3s ease-out;
}

.headermenu2{
	float:left;
}
.headerCenter{
	float:left;
	line-height: 43px;
	height: 70px;
}
.headermenu4 {
	height: 70px;
	line-height: 50px;
	display: flex;
	flex-direction: row-reverse;
}
	.search {
	height: 40px;
	width: 390px;
	border: 2px solid #37C3C3;
	background: #ffffff;
	margin : 6px;
}

	.searchText {
	font-size: 16px;
	width: 325px;
	padding: 6px;
	border: 1px black;
	outline: none;
}
	.searchButton {
	width: 50px;
	height: 100%;
	border: 0px;
	background: #37C3C3;
	outline: none;
	float: right;
	color: #ffffff;
	cursor: pointer;
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
input:focus {outline:none;}
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
<body>
<div class="wrap">
		<div class="headermenu">		
			<div class="a">
			<div class="headermenu1">
			<a href="/main.do"><img src="/resources/img/main.png" style="width:260px; height:70px;"></a>
			</div>
			</div>
		<div class="headermenu2" style="width:100px;">
			&nbsp
		</div>
		<div  class="headerCenter">
			<form action="/search.do" class="search">
				<input class="searchText" type="text" placeholder="서비스를 입력하세요">
				<button class="searchButton">검색</button>
			</form>
		</div>
			<div class="headermenu3">

				<div class=" headermenu4">
				
					<ul style="overflow:hidden;  list-style:none;">
						<c:choose>
							<c:when test="${empty sessionScope.m}">
								<li style="float:left; width:60px;"><a href="/loginFrm.do"onClick="login();return false;"style="color:black;text-decoration:none;">로그인</a></li>
								<li style="float:left; width:70px;"><a href="/joinCheck.do"style="color:black;text-decoration:none;">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li style="float:left; width:200px;"><span style="font-weight:bold;">[${sessionScope.m.memberName}]님 환영합니다.</span></li>
							<li style="float:left; width:100px;"><a href="/mypage.do"style="color:black;text-decoration:none;">마이페이지</a></li>
							<li style="float:left; width:100px;"><a href="/logout.do"style="color:black;text-decoration:none;">로그아웃</li>
						</c:otherwise>
						</c:choose>
					</ul>
				
				</div>

			</div>
		</div>
	</div>
	
			<!-- 로그인 모달부분 -->

	<div id="login" class="searchModal">
		<div class="search-modal-content">
			<div class="page-header" style="text-align:center;">
				<br><span style="font-size:36px;">로그인 페이지<br></span>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-12">
							<br>
							<form action="/login.do" method="post">
								아이디 : <br>
								<input type="text" name="memberId"style=" border:0px;border-bottom:1px solid; width:360px; height:40px;line-height:60px;"><br> <br> 비밀번호
								: <input type="password" name="memberPw" style=" border:0px;border-bottom:1px solid; width:360px; height:40px;line-height:60px;"> <br><br>
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
	<!--  
	<div class="header">
		<div class="headerleft"><a href="/main.do"><img src="/resources/img/main.png" style="width:260px; height:60px;"></a></div>
		<div class="headerCenter">
			<div class="search">
				<input class="searchText" type="text" placeholder="서비스를 입력하세요">
				<button class="searchButton" type="button">검색</button>
			</div>
		</div>
		 
		<div class="headerRight">
			로그인 회원가입123asd
		</div>
	</div>
	-->
</body>
</html>

































