<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<style>
.main {
	font-family: 'Noto Serif KR', serif;
}

.headtop {
	width: 1200px;
	margin: 0 auto;
	height: 180px;
}

.headtopmenu {
	height: 120px;
}

.logo {
	height: 120px;
	line-height: 120px;
	float: left;
}

.login {
	width: 100px;
	float: right;
}

.navi {
	height: 60px;
	background-color: black;
}

.navimenu {
	height: 60px;
	line-height: 60px;
	margin: 0;
	padding: 0;
}

.navimenu>li {
	float: left;
	list-style-type: none;
	width: calc(1200px/ 4);
	text-align: center;
	font-size: 15px;
}

.navimenu>li:hover>a {
	font-weight: bold;
	text-shadow: black;
}

.pd {
	width: 1200px;
	display: inline-block;
	margin: 0 auto;
}

.pd1 {
	width: 1200px;
	display: none;
	margin: 0 auto;
}

.primg {
	margin: 0 auto;
	text-align: center;
	height: 230px;
}

.navimenu>li>a {
	color: white;
	text-decoration: none;
}

.menuwrap {
	width: 1200px;
	margin: 0 auto;
}

.menu {
	padding: 30px;
}

.menuname {
	text-align: left;
}

.menuname p {
	color: #5e5e5e;
	font-size: small;
	font-weight: bold;
	line-height: 5px;
}

.menu img {
	width: 200px;
}

button[type=button] {
	width: 60px;
	height: 26px;
	border: none;
	color: #404040;
	background-color: #E0E0E0;
	font-size: 11px;
	font-weight: bold;
	border-radius: 5px;
}

.product {
	float: left;
	margin: 40px;
}

.prname {
	width: 210px;
	line-height: 5px;
	font-size: small;
	text-align: left;
}

.more {
	text-align: center;
	margin: 0 auto;
}

.login a {
	text-decoration: none;
	color: #5E5E5E;
	font-size: 15px;
}

.logo>a {
	text-decoration: none;
	color: black;
	font-style: italic;
	font-size: xxx-large;
	font-weight: bolder;
}

.footmenu {
	width: 1200px;
	margin: 0 auto;
	border-top: 1px solid #5e5e5e;
	height: 80px;
}

.linkwrap {
	float: right;
	height: 80px;
	line-height: 80px;
}

.info {
	width: 30%;
	margin: 0;
	display: inline-block;
	height: 80px;
}

.link {
	display: inline-block;
}

.link>img {
	margin: 10px;
	width: 40px;
	height: 40px;
}

.search {
	float: left;
	width: 800px;
}

.search img {
	width: 30px;
}

input[type=search1] {
	width: 150px;
	height: 30px;
}

.searchmenu {
	text-align: center;
	height: 120px;
	line-height: 120px;
	margin: 0 auto;
}

.slider img {
	width: 1200px;
	height: 600px
}

#btn2 {
	display: none;
}

.searchmenu>img:hover {
	cursor: pointer;
}

.contents {
	margin: 0 auto;
	/* border: 1px solid black; */
	width: 500px;
}

.num1 {
	font-size: 28px;
	font-weight: bold;
	text-align: center;
}

.inputid {
	width: 500px;
	height: 50px;
	border: 2px dashed #bcbcbc;
}

.inputid1 {
	width: 250px;
	height: 50px;
	border: 2px dashed #bcbcbc;
}

input:focus {
	outline: none;
}

.success {
	width: 500px;
	height: 60px;
	background-color: black;
	color: white;
	text-align: center;
}

.success>a {
	color: white;
	font-weight: bold;
	font-size: 20px;
	line-height: 60px;
}

.pass {
	font-size: 12px;
	color: red;
}

.pass1 {
	font-size: 12px;
	color: red;
}

.login a:hover {
	font-weight: bold;
	text-shadow: black;
}

.invisible {
	display: none;
}

.gender {
	width: 508px;
}

.gender1 {
	float: left;
	width: 20%;
}

.gender2 {
	float: left;
	width: 30%;
}

.gender3 {
	float: left;
	width: 30%;
}

.act {
	width: 508px;
}

.act1 {
	float: left;
	width: 25%;
}

.act2 {
	float: left;
	width: 25%;
}

.act3 {
	float: left;
	width: 25%;
}

.act4 {
	float: left;
	width: 25%;
}

select {
	width: 230px;
	height: 50px;
	padding: .8em .5em;
	border: 1px solid #999;
	font-family: inherit;
	background: url('arrow.jpg') no-repeat 95% 50%;
	border-radius: 0px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

select::-ms-expand {
	display: none;
}

</style>
<script>
	
	/*	function addrcheck(){
		
			if(	$('#addr').is(':checked')){
				$("#addr").hide();				
			}else{
				$("#addr").show();
			}			
			
		
		}
	*/
	
        $(document).ready(function () {
            $('.slider').bxSlider({ auto: true, pause: 3000 });
            $("#btn1").click(function () {
                $(".pd1").show();
                $("#btn1").hide();
                // $("#btn2").show();

            });
            $("#searchClick").click(function () {
                var search2 = $("[name=search2]").val();
                location.href = "https://search.naver.com/search.naver?query=" + search2;
            });
           
            $("#check1").on("click",function()//클릭하면 행동할 함수넣어줌
                    {
                       var email= $("#email");
                       if(email.hasClass("invisible"))
                    	   email.removeClass("invisible");
                       else
                    	   email.addClass("invisible");
                    });
       
    
            $("#check").on("click",function()//클릭하면 행동할 함수넣어줌
            {
               var addr= $("#addr");
               if(addr.hasClass("invisible"))
                  addr.removeClass("invisible");
               else
                   addr.addClass("invisible");
            });
            
            $("#addrSearch").on("click",  
                    function(){
                        new daum.Postcode({
                            oncomplete: function(data) {
                                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                                $("#postCode").val(data.zonecode);
                                $("#roadAddr").val(data.roadAddress);
                                $("#jibunAddr").val(data.jibunAddress);
                                $("#detailAddr").focus();
                            }
                        }).open();
                        return false;
                    }
              );
        });
        
        
        
        var flag1 = false;
        var flag2 = false;
        var flag3 = false;
        var flag4 = false;
        var flag5 = false;


        function check1() {
            //1. 아이디검사 : 영어 대/소문자+숫자 4~12 글자
            var idReg = /^[a-zA-Z0-9]{4,12}$/;
            var id = $("[name=memberId]").val();

            // ^,$ 뜻,
            if (idReg.test(id)) {             //test뜻    name = id가 왜 조건과 이름인지
                $("[name=memberId]").css("border", "2px dashed #bcbcbc");
               	$("[name=memberId]").next().next().html("아이디 입력 완료")
                flag1 = true;
            } else {
                $("[name=memberId]").css("border", "2px dashed #BE2457");
                $("[name=memberId]").next().next().html("아이디는 영어 대/소문자/숫자로 4~12글자입니다.")
                flag1 = false;
            }
        }
        function check2() {
            var pwReg = /^[a-zA-Z0-9]{8,16}$/;  // 구글에 자바스크립트 정규식 검색
            var pw = $("[name=memberPw]").val();

            if (pwReg.test(pw)) {
                $("[name=memberPw]").css("border", "2px dashed #bcbcbc")
                $("[name=memberPw]").next().html("비밀번호 입력 완료");
                flag2 = true;
            }
            else {
                $("[name=memberPw]").css("border", "2px dashed #BE2457");
                $("[name=memberPw]").next().html("비밀번호는 영어 대/소문자/숫자로 8~16글자입니다.")
                flag2 = false;
            }
        }

        function check3() {
            if ($("[name=memberPw]").val() == $("[name=pw_re]").val()) {
                $("[name=pw_re]").css("border", "2px dashed #bcbcbc")
                $("[name=pw_re]").next().html("비밀번호가 일치합니다.");
                flag3 = true;
            }
            else {
                $("[name=pw_re]").css("border", "2px dashed #BE2457");
                $("[name=pw_re]").next().html("비밀번호가 일치하지 않습니다.");
                flag3 = false;
            }
        }
        
        function check4() {
            var nameReg = /^[가-힣]{2,5}$/;
            var name = $("[name=memberName]").val();
            if (nameReg.test(name)) {
                $("[name=memberName]").css("border", "2px dashed #bcbcbc");
                $("[name=memberName]").next().html("사용 가능한 이름입니다.");
                flag4 = true;
            } else {
                $("[name=memberName]").css("border", "2px dashed #BE2457");
                $("[name=memberName]").next().html("이름 2 ~ 5 글자로 입력해주세요");
                flag4 = false;
            }
        }
        
        function check5() {
            //var emailReg = /^[0-9a-zA-Z]*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
            var phoneReg = /^[0-9]{3}-[0-9]{4}-[0-9]{4}/
            var phone = $("[name=memberPhone]").val();
            if (phoneReg.test(phone)) {
                $("[name=memberPhone]").css("border", "2px dashed #bcbcbc");
                $("[name=memberPhone]").next().html("");
                flag5 = true;
            } else {
                $("[name=memberPhone]").css("border", "2px dashed #BE2457");
                $("[name=memberPhone]").next().html("올바른 핸드폰번호를 작성해주세요");
                flag5 = false;
            }
        }
        
        function check6() {
        	var emailReg = /^[0-9a-zA-Z]/
            //var emailReg = /^[0-9a-zA-Z]*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
            //var phoneReg = /^[0-9]{3}[0-9]{4}[0-9]{4}/
            var phone = $("[name=memberEmail]").val();
            if (phoneReg.test(phone)) {
                $("[name=memberEmail]").css("border", "2px dashed #bcbcbc");
                $("[name=memberEmail]").next().html("");
                flag5 = true;
            } else {
                $("[name=memberEmail]").css("border", "2px dashed #BE2457");
                $("[name=memberEmail]").next().html("올바른 핸드폰번호를 작성해주세요");
                flag5 = false;
            }
        }
      
        
        function check8() {
        	var bool=check6();
        	var cnt=check7();
            if (flag1 && flag2 && flag3 && flag4 && flag5 && (cnt >=2)&&bool)  {
                alert("가입성공");
                return true;

            } else {
                alert("가입실패");
				return false;
            }
        }
		function idCheck(){
			var memberId=$("[name=memberId]").val();
			$.ajax({
				url:"/idCheck.do",
				data:{memberId:memberId},
				success:function(data)
				{
					if(data==0)
					{
						flag1=false;
						$("#idCheckComment").html("으딜 감히");
					}
					else
						$("#idCheckComment").html("가능");
				}
			})
		}
       
    </script>
<body>
	<div>
		<div class="main">
			<br>
			<div class="contents">
				<form action="/join.do" method="post">
					<div class="num1">회원정보 입력</div>
					<br>
					<br> 아이디<br>
					<br>
					<!--  <form action="/idCheck" method="post" name="idFrm">
            	
            	<button id="idCheck">중복체크</button> 
            </form>-->
					<input type="text" class="inputid" name="memberId"
						placeholder="아이디를 입력해주세요" onblur="check1();"><span></span>
					<div>
						<span style="font-size: 12px;">영어, 숫자로 이루어진 4~10글자 사이로
							입력해주세요</span>
					</div>
					<button type="button" style="width:80px; height:50px;" onclick="idCheck();">중복체크</button>
					<br>
					<br> 비밀번호<br>
					<br> <input type="password" class="inputid" name="memberPw"
						placeholder="비밀번호를 입력해주세요" onblur="check2();">
					<div>
						<span class="pass1">비밀번호를 입력해주세요</span>
					</div>
					<br>
					<br> 비밀번호 재확인<br>
					<br> <input type="password" class="inputid" name="pw_re"
						placeholder="비밀번호를 다시한번 입력해주세요" onblur="check3();">
					<div>
						<span class="pass1"> 필수입력값 입니다.</span>
					</div>
					<br>
					<br>
					<br> 이름<br>
					<br> <input type="text" class="inputid" name="memberName"
						placeholder="이름을 입력해주세요" onblur="check4();">
					<div>
						<span class="pass1">이름을 입력해주세요</span>
					</div>
					<br>
					<br> 핸드폰번호<br>
					<br> <input type="text" name="memberPhone" class="inputid"
						placeholder="핸드폰번호를 입력해주세요" onblur="check5();">
					<div class="pass1">핸드폰번호 입력 해주세요</div><br>
					<input type="checkbox" id="check2" name="emailcheck">&nbsp&nbsp<span
						style="font-size: 13px; color: #5ABEFF; font-weight: bold;">
						이메일은 다음에 입력합니다</span><br>
					
					<div class="container" id="email" name="email" >
					<br> 이메일주소<br>
					<br>
					<input type="text" name="memberEmail" class="inputid1"
						placeholder="이메일주소를 입력해주세요">
					<select name="selectEmail">
						<option>@naver.com</option>
						<option>@daum.net</option>
						<option>@nate.com</option>
					</select>
					</div><br>
					<!--  <div>
						<span class="pass1"> 필수입력값 입니다.</span>
					</div>
					-->
					<br> <input type="checkbox" id="check" name="addrcheck">&nbsp&nbsp<span
						style="font-size: 13px; color: #5ABEFF; font-weight: bold;">
						주소는 다음에 입력합니다.</span><br>
					<br>
					<div class="container" id="addr" name="addr">
						<div>
							<span style="font-weight: bold;">주소</span> <input type="text"
								id="postCode"  readonly>
							<!-- 틀리는 경우가 많으니 사용자가 입력 못하게한다. -->
							<button id="addrSearch" onclick="return addrSearch();"
								>주소검색</button>
						</div>
						<div>
							<input type="text" id="roadAddr" name="addr1"
								class="form-control" placeholder="도로명주소">
						</div>
						<div>
							<input type="text" id="jibunAddr" name="addr2"
								class="form-control" placeholder="지번주소">
						</div>
						<div>
							<input id="detailAddr" type="text" name="addr3"
								placeholder="상세주소" >
						</div>
					</div>
					<br>
					<br> <input class="success" type="submit" value="가입완료"
						onclick="return check8();"><br>
				</form>
			</div>
		</div>
		<!-- 
	<h1>회원가입 페이지</h1>
	<form action="/joinFrm.do" method="post">
		아이디 : <input type="text" name="memberId"><br>
		비밀번호  : <input type="password" name="memberPw"><br>
		이름 : <input type="text" name="memberName"><br>
		주소 : <input type="text" name="memberAddr"><br>
		전화번호(-포함해서 작성) : <input type="text" name="memberPhone"><br>
		이메일 <input type="text">@<input type="text"><br><br>
		<input type="submit" value="회원가입"><input type="submit" value="취소">
	</form>
	 -->

	</div>
	<br>
</body>
</html>