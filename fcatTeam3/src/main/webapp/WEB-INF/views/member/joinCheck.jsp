<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style>
        .main {
            font-family: 'Noto Serif KR', serif;
            margin : 0 auto;
            width :440px;
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
            width: calc(1200px/4);
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

        .terms {
            text-align: center;
        }

        .num1 {
            /* text-align: center; */
            border: 1px solid black;
            width: 440px;
            height: 100px;
            font-size: 15px;
            margin: 0 auto;
            overflow: auto;
        }

  

        .personal {
            width: 440px;
            height: 100px;
            overflow: auto;
            margin: 0 auto;
            border: 1px solid black;
            font-size: 13px;
        }

        .agree1 {
            text-align: center;
        }
        
        .agree {
            text-align: left;
        }

		#agree3{
			width : 20px;
			height : 20px;
		}

        .login a:hover {
            font-weight: bold;
            text-shadow: black;
        }

        input[type=button] {
            border-radius: 10px;
            width: 150px;
            height: 50px;
            color: white;
            background-color: #5e5e5e;
            font-weight: bold;
        }
    </style>
    <script>
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
        });
        $(document).ready(function () {
            $("#agree3").click(function () {
                if ($("#agree3").prop('checked')) {    // checked 옵션을 반환하는것
                    $("#agree1").prop('checked', true);
                    $("#agree2").prop('checked', true); //agree2의 Checked옵션을 true로 바꾼다.
                    $("#agree4").prop('checked', true);
                }
                else {
                    $("#agree1").prop('checked', false);
                    $("#agree2").prop('checked', false);
                    $("#agree4").prop('checked', false);
                }
            });
        });

        function result() {
            if ($("#agree1").prop("checked") && $("#agree2").prop("checked")) {            	
        
                return true;
            } else {
            	alert("필수 항목이 전부 체크되지 않았습니다.");
            	return false;                
            }
        }
    </script>
<body>

	<div class="main">
        <div class="loginwrap">
            <form action="/joinFrm.do" method="post">
                <input id="agree3" type="checkbox"> 이용약관, 개인정보 수집 및 이용, 위치정보 이용약관<br>
                (선택), 프로모션 정보 수신(선택)에 모두 동의합니다.<br><br>
                <input type="checkbox" id="agree1"><span style="font-weight: bold;">[필수]</span> 약관에
                    동의합니다.<br><br>
                    <div class="num1"><span style="font-weight: bold; text-align : left;"> <br>제 1조 (목적)</span><br>
                        <span style="font-size: 13px; text-align: left;">
              				본 ' 서비스 이용 약관' (이하 "본 약관"이라 합니다)은 이용자가 (유)<br>
                      		제공하는 사이트 및 사이트 관련 각종 서비스(이하 "서비스"라 합니다.)를<br>
                    		이용함에 있어 "닷컴"과  "이용자"의 권리 의무 및 책임 사항을 규정함을 목적으로 합니다.<br></span>
                            <span style="font-weight: bold ; text-align: left;">제 2조(정의)</span><br>
                            	본 약관의 주요 용어는 아래와 같이 정의합니다.<br>
                            ①""는 (유) 말하며 공식 쇼핑몰을 말합니다.<br>
                            ②"서비스"란 사이트및 사이트 관련 각종 서비스를 말합니다.<br>
                            ③"이용자"란 "사이트"에 접속하여 이 약관에 따라 ""이 제공하는 "서비스"를 받는 "회원"입니다.<br>                            
                    </div><br>
                    <br>
                    <input type="checkbox" id="agree2"> <span style="font-weight: bold;">[필수]</span> 취급방침에
                    동의합니다.<br><br>
                
                <div class="num1"><br>
                    "”은 (이하 '회사'는) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에<br>
                    관한 법률을 준수하고 있습니다.<br>
                    회사는 개인정보 취급방침을 통하여 고객님께서 제공하시는 개인정보가<br>
                    어떠한 용도와 방식으로 이용되고<br>
                    있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.<br>
                    
                </div><br>
                <div>
                    <input type="checkbox" id="agree4">
                    <span style="font-weight: bold;">위치정보 이용약관 동의(선택)</span>
                </div>
                <div class="num1">
                    위치정보 이용약관에 동의하시면, 위치를 활용한 광고 정보<br>
                    수신 등을 포함하는 위치기반 서비스를 이용할 수 있습니다.<br><br>
                    <span style="font-weight: bold; float: left;">제 1조 (목적)</span><br><br>
                    	이 약관은 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는 위치<br>
                    기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임

                </div><br>
                <div class="agree">
                
                    <input type="submit" value="회원가입" onclick="return result()">
                </div><br>



                <!-- <div class="loginbox">
                    <input type="text" name="id" placeholder="ID">
                    <input type="password" name="pw" placeholder="PASSWORD">
                    <input type="submit" id="login" value="LOGIN">
                    <a href="#">Forgot Password?</a></li>
                </div> -->
            </form>
        </div>

    </div>
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>