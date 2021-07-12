<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>

		<html>
		<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>

		<head>
			<meta charset="UTF-8">
			<title>FCAT</title>
			<style>
				input:-ms-input-placeholder {
					color: #a8a8a8;
				}

				input::-webkit-input-placeholder {
					color: #a8a8a8;
				}

				input::-moz-placeholder {
					color: #a8a8a8;
				}

				.search {
					height: 40px;
					width: 450px;
					border: 2px solid #37C3C3;
					background: #ffffff;
				}

				.searchText {
					font-size: 16px;
					width: 325px;
					padding: 6px;
					border: 1px;
					outline: none;
					float: left;
				}

				.searchButton {
					width: 50px;
					height: 100%;
					border: 0px;
					background: #37C3C3;
					outline: none;
					float: right;
					color: #ffffff;
				}

				.wrapper {
					margin: 0 auto;
					width: 1140px;
				}

				.wrapperContent {
					width: 1140px;
					height: 600px;
				}

				.wrapperLeft {
					float: left;
					width: 570px;
					padding-left: 170px;
				}

				.wrapperRight {
					float: left;
					width: 570px;
				}

				.emptyLeftUp {
					height: 80px;
				}

				.emptyLeftDown {
					padding: 15px;
				}

				.emptyRightUp {
					height: 100px;
				}

				.SearchDown {
					list-style: none;
					overflow: hidden;
					padding: 0px;
				}

				.serviceSearch {
					font-weight: bolder;
					float: left;
					width: 100px;
				}

				.userSearch {
					font-weight: bolder;
					float: left;
				}

				.btn-primary {
					background-color: #6f42c1;
					width: 100px;
				}

				.flex {
					display: flex;
				}

				.row {
					flex-direction: row;
				}

				.column {
					flex-direction: column;
				}

				.category {
					width: 24%;
					display: inline-block;
					text-align: center;
					align-items: flex-start;
				}

				.main-search-containor {
					width: 100%;
				}

				@media (min-width :700px) {
					.main-search-containor {
						width: 500px;
					}
				}

				.textbolder {
					font-weight: bolder;
					font-size: 23px;
				}

				.serviceList {
					width: 1140px;
				}

				div.fixed {
					width: 135px;
					height: 45px;
					position: fixed;
					top: 1000;
					right: 0;
				}

				.section input[id*="slide"] {
					display: none;
				}

				.section .slidewrap {
					max-width: 1200px;
					margin: 0 auto;
					overflow: hidden;
				}

				.section .slidelist {
					white-space: nowrap;
					font-size: 0;
				}

				.section .slidelist>li {
					display: inline-block;
					vertical-align: middle;
					width: 100%;
					transition: all .5s;
				}

				.section .slidelist>li>a {
					display: block;
					position: relative;
				}

				.section .slidelist>li>a img {
					width: 100%;
				}

				.section .slidelist label {
					position: absolute;
					top: 50%;
					transform: translateY(-50%);
					padding: 50px;
					cursor: pointer;
				}

				.left {
					left: 30px;
					background: url('/resources/img/left.png') center center/100% no-repeat;
				}

				.left1 {
					left: 30px;
					background: url('/resources/img/left1.png') center center/100% no-repeat;
				}

				.right {
					right: 30px;
					background: url('/resources/img/right.png') center center/100% no-repeat;
				}

				.right1 {
					right: 30px;
					background: url('/resources/img/right1.png') center center/100% no-repeat;
				}

				.fixed {
					right: 0;
					bottom: 1;
					width: 50px;
					height: 10px;
					background-color: #A7F2DC;
					position: fixed;
				}

				* {
					margin: 0;
					padding: 0;
					box-sizing: border-box;
				}

				ul,
				li {
					list-style: none;
				}

				.slidebox {
					max-width: 900px;
					margin: 0 auto;
					position: relative;
				}

				.slidebox .slidelist {
					position: relative;
					white-space: nowrap;
					font-size: 0;
				}

				.slidebox .slidelist .slideitem {
					position: relative;
					display: inline-block;
					vertical-align: middle;
					background-color: #fff;
					width: 100%;
					transition: all 1s;
					overflow: hidden
				}

				.slidebox .slidelist .slideitem a {
					display: block;
					position: relative;
				}

				.slidebox .slidelist .slideitem>a img {
					max-width: 100%;
				}

				.slidebox .slide-control [class*="control"] label {
					position: absolute;
					top: 50%;
					transform: translateY(-50%);
					padding: 20px;
					border-radius: 50%;
					cursor: pointer;
				}

				.slidebox .slide-control [class*="control"] label.prev {
					left: -50px;
					background: #333 url('./resources/img/left.png')
				}

				.slidebox .slide-control [class*="control"] label.next {
					right: -50px;
					background: #333 url('./resources/img/right.png')
				}

				.slidebox .slide-control [class*="control"] label.prev1 {
					left: -50px;
					background: #333 url('./resources/img/left1.png')
				}

				.slidebox .slide-control [class*="control"] label.next1 {
					right: -50px;
					background: #333 url('./resources/img/right1.png')
				}

				[name="slide"] {
					display: none;
				}

				#slide01:checked~.slidelist .slideitem {
					left: 0;
				}

				#slide02:checked~.slidelist .slideitem {
					left: -100%;
				}

				#slide03:checked~.slidelist .slideitem {
					left: -200%;
				}

				[name="slide1"] {
					display: none;
				}

				#slide04:checked~.slidelist .slideitem {
					left: 0;
				}

				#slide05:checked~.slidelist .slideitem {
					left: -100%;
				}

				#slide06:checked~.slidelist .slideitem {
					left: -200%;
				}

				.slide-control [class*="control"] {
					display: none;
				}

				#slide01:checked~.slide-control label.prev {
					display: none;
				}

				#slide01:checked~.slide-control .control01 {
					display: block;
				}

				#slide02:checked~.slide-control .control02 {
					display: block;
				}

				#slide03:checked~.slide-control .control03 {
					display: block;
				}

				#slide03:checked~.slide-control label.next {
					display: none;
				}

				#slide04:checked~.slide-control label.prev1 {
					display: none;
				}

				#slide04:checked~.slide-control .control01 {
					display: block;
				}

				#slide05:checked~.slide-control .control02 {
					display: block;
				}

				#slide06:checked~.slide-control .control03 {
					display: block;
				}

				#slide06:checked~.slide-control label.next1 {
					display: none;
				}

				.categoryLogo {
					width: 24%;
					height: 263px;
					float: left;
					text-align: center;
					align-items: flex-start;
				}

				.textRight {
					text-align: right !important;
				}

				.contentPicture {
					style: "width:217px; height: 162px;"
				}

				.categoryLogosNoPoint {
					list-style: none;
				}

				.categoryLogos {
					overflow: hidden;
				}

				.contentTitle {
					style: font-weight: bolder;
				}

				.categoryitem {
					width: 217px;
					align-items: flex-start;
				}

				.slideitem {
					overflow: hidden;
					width: 25%;
				}

				.slideitem1 {
					width: 25%;
					white-space: normal;
					float: left;
				}

				.slidelist {
					overflow: hidden;
				}

				.chatBtn {
					width: 128px;
					height: 39px;
					padding: 8px;
					border-radius: 40px;
					background-color: #A6F2DB;
					line-height: 26px;
					text-align: center;
					position: fixed;
					bottom: 10px;
					right: 10px;
					cursor: pointer;
				}

				.chatPaper {
					width: 360px;
					height: 720px;
					border-radius: 15px;
					background-color: white;
					position: fixed;
					bottom: 10px;
					right: 10px;
					box-shadow: rgb(0 0 0/ 20%) 0px 0px 0.428571rem;
				}

				.chatPaperhead {
					margin: 0px;
					padding: 0px;
					background-color: #A6F2DB;
					height: 60px;
					width: 360px;
					border-top-left-radius: 15px;
					border-top-right-radius: 15px;
					overflow: hidden;
				}

				.chatting {
					width: 500px;
					display: none;
				}

				#chatPaperMessage>p {
					text-align: center;
					width: 100%;
				}

				.sendMsg {
					width: 80%;
				}

				.sendBtn {
					width: 20%;
				}

				.chat {
					word-break: break-word;
					margin-bottom: 10px;
					padding: 8px;
					border-radius: 10px;
				}

				.chat.chatRight {
					background-color: #A6F2DB;
					align-self: flex-end;
				}

				.chat.chatLeft {
					background-color: #F0F0F1;
					align-self: flex-start;
				}

				#chatPaperMessage {
					height: 550px;
					overflow-y: auto;
					display: flex;
					flex-direction: column;
				}

				#messageInsert {
					height: 60px;
					overflow: hidden
				}

				#messageLeft {
					width: 66px;
					float: left;
				}

				#messageCenter {
					width: 248px;
					float: left;
				}

				#messageRight {
					width: 46px;
					float: left;
				}

				.chatPaperheadleft {
					width: 40px;
					float: left;
				}

				.chatPaperheadCenter {
					width: 260px;
					float: left;
				}

				.chatPaperheadRight {
					width: 60px;
					float: left;
					padding: 15px 12px;
				}

				.waitChat {
					visibility: visible;
					margin-top: 160px;
					text-align: center;
					height: 600px;
				}

				.chatEmpty {
					width: 0px;
					height: 0px;
					visibility: hidden;
				}
				.category > a{
					text-decoration: none;
				}
			</style>
		</head>

		<body>
			<!--  헤더  -->
			<%@include file="/WEB-INF/views/common/header.jsp" %>

				<div class="wrapper">
					<div class="wrapperContent">
						<div class="wrapperLeft">
							<div class="emptyLeftUp"></div>
							<div class="emptyLeftDown">
								<ul class="SearchDown">
									<li class="serviceSearch">서비스 찾기</li>
									<li class="userSearch">고객 찾기</li>
								</ul>
								<br> <br> <span style="font-weight: bolder; font-size: 30px;">1분 만에 <br>
									고수를 찾아드려요
								</span><br> <br>
								<!-- <div class="search">
								<input class="searchText" type="text" placeholder="서비스를 입력하세요">
								<button class="searchButton" type="button">검색</button>
							</div> -->

								<br>
								<ul style="padding-left: 0px;">
								
									<li class="category">
									<a href="/categorySearch.do?category=레슨&nowPage=1">
										<p>
											<img src="/resources/img/search1.png" style="width: 52px; height: 52px;"><br>레슨
										</p>
											</a>
									</li>
									
									<li class="category">
										<a href="/categorySearch.do?category=홈/리빙&nowPage=1">
										<p>
											<img src="/resources/img/search2.png" style="width: 52px; height: 52px;"><br>홈/리빙
										</p>
										</a>
									</li>
									<li class="category">
										<a href="/categorySearch.do?category=이벤트&nowPage=1">
										<p>
											<img src="/resources/img/search3.png" style="width: 52px; height: 52px;"><br>이벤트
										</p>
										</a>
									</li>
									<li class="category">
										<a href="/categorySearch.do?category=비지니스&nowPage=1">
										<p>
											<img src="/resources/img/search4.png" style="width: 52px; height: 52px;"><br>비지니스
										</p>
										</a>
									</li>
									<li class="category">
										<a href="/categorySearch.do?category=디자인/개발&nowPage=1">
										<p>
											<img src="/resources/img/search5.png" style="width: 52px; height: 52px;"><br>디자인/개발
										</p>
										</a>
									</li>
									<li class="category">
										<a href="/categorySearch.do?category=건강/미용&nowPage=1">
										<p>
											<img src="/resources/img/search6.png" style="width: 52px; height: 52px;"><br>건강/미용
										</p>
										</a>
									</li>
									<li class="category">
										<a href="/categorySearch.do?category=알바&nowPage=1">
										<p>
											<img src="/resources/img/search7.png" style="width: 52px; height: 52px;"><br>알바
										</p>
										</a>
									</li>
									<li class="category">
										<a href="/categorySearch.do?category=기타&nowPage=1">
										<p>
											<img src="/resources/img/search8.png" style="width: 52px; height: 52px;"><br>기타
										</p>
										</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="wrapperRight">
							<div class="emptyRightUp"></div>
							<div class="wrapperpicture">
								<img src="/resources/img/capture.png" style="width: 350px; height: 400px">
							</div>
						</div>
					</div>
					<div class="serviceList">
						<span class="textbolder">프캣 인기 서비스</span><br>
						<div class="slidebox">
							<input type="radio" name="slide" id="slide01" checked> <input type="radio" name="slide" id="slide02">
							<input type="radio" name="slide" id="slide03">
							<ul class="slidelist">
								<li class="slideitem">
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/logo1.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">싼값에
												이쁜 카테고리 만들어 드립니다. 이쁘게 꾸며드릴테니 많이 찾아주세요 <br>50,000원
											</span>
										</a>
									</div>
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/logo2.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">따뜻한
												감성이 돋보이는 로고 제작해드려요 많은 연락 부탁드립니다 <br>30,000원
											</span>
										</a>
									</div>
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/glassDesign.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">이쁜안경
												디자인 해드려요 <br>40,000원
											</span>
										</a>
									</div>
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/businessCard.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">명함
												이쁘게 만들어 드립니다 다른곳 보다 싸고 훨씬 이뻐요 :) <br>25,000원
											</span>
										</a>
									</div>
								</li>
								<li class="slideitem">
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/blog.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">하루에
												1만명 방문 블로그가, 성장부터 수익화까지 알려 드립니다. <br>30,000원
											</span>
										</a>
									</div>
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/autosystem.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">오토센스
												누적수익 2억5천만 마케터가 오토수익방법 알려드립니다. <br>119,000원
											</span>
										</a>
									</div>
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/parsona.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">에드센스
												파소나 공식으로 천만원 버는 노하우 최초공개 드립니다 <br>590,000원
											</span>
										</a>
									</div>
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/stock.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">실제
												사용중인 단타 매매법과 사용법 강의해 드립니다. <br>1,700,000원
											</span>
										</a>
									</div>
								</li>
								<li class="slideitem">
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/coupangpartner.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">당신의
												쿠팡파트너스 수익 날때까지 도와 드립니다. <br>59,000원
											</span>
										</a>
									</div>
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/coupangpartner1.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">쿠팡파트너스
												월 150만원 자동화 수익 만드는 법 그대로 드립니다. <br>159,000원
											</span>
										</a>
									</div>
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/alone.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">될
												때까지 하는 구매대행 홀로서기 프로젝트 도와드립니다.<br>150,000원
											</span>
										</a>
									</div>
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/sense.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">애드센스
												따상상 월 800만원 수익화 만들었던 노하루를 드립니다. <br>19,000원
											</span>
										</a>
									</div>
								</li>
							</ul>
							<div class="slide-control">
								<div class="control01">
									<label for="slide03" class="prev"></label> <label for="slide02" class="next"></label>
								</div>
								<div class="control02">
									<label for="slide01" class="prev"></label> <label for="slide03" class="next"></label>
								</div>
								<div class="control03">
									<label for="slide02" class="prev"></label> <label for="slide01" class="next"></label>
								</div>
							</div>
						</div>
					</div>
					<br>
					<div class="serviceList">
						<span class="textbolder">인기 로고 서비스</span><br>
						<div class="slidebox">
							<input type="radio" name="slide1" id="slide04" checked> <input type="radio" name="slide1" id="slide05">
							<input type="radio" name="slide1" id="slide06">
							<!-- <input type="radio" name="slide1" id="slide04"> -->
							<ul class="slidelist">
								<li class="slideitem">
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/logo3.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">원하시는
												캐릭터 심볼 로고 드립니다. <br>55,000원
											</span>
										</a>
									</div>
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/logo4.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">따뜻한
												감성이 돋보이는 로고 제작해드려요 많은 연락 부탁드립니다 <br>30,000원
											</span>
										</a>
									</div>
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/logo5.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">즉시
												상담 100퍼센트 만족도 신속하고 정확한 로고를 드립니다. <br>99,000원
											</span>
										</a>
									</div>
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/logo6.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">"심플
												끝판왕" 평점 5.0점 만점 김로고가 제작해 드립니다. <br>80,000원
											</span>
										</a>
									</div>
								</li>
								<li class="slideitem">
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/logo7.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">마음을
												이끄는 감각적이고 세련된 일러스트로고를 디자인해 드립니다. <br>100,000원
											</span>
										</a>
									</div>
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/logo8.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">MAMUSEDESIGN
												로고디자인 드립니다. <br>75,000원
											</span>
										</a>
									</div>
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/logo9.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">심플
												감성 일러스트 로고를 드립니다. <br>100,000원
											</span>
										</a>
									</div>
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/logo10.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">"디자이너
												마케터 변호사"가 완벽한 로고를 만들어 드립니다.<br>90,000원
											</span>
										</a>
									</div>
								</li>
								<li class="slideitem">
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/logo11.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">CI,
												BI 간단하고 심플한 로고디자인을 만들어 드립니다. <br>60,000원
											</span>
										</a>
									</div>
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/logo12.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">깔끔한
												로고 요즘 디자인 1대1 맞춤 디자인을 드립니다.립니다. <br>159,000원
											</span>
										</a>
									</div>
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/alone.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">될
												때까지 하는 구매대행 홀로서기 프로젝트 도와드립니다.<br>150,000원
											</span>
										</a>
									</div>
									<div class="slideitem1">
										<a href="#" class="categoryitem"> <img src="/resources/img/sense.png"
												style="width: 217px; height: 150px;"> <br> <span
												style="font-weight: bold; font-size: 12px; color: black;">애드센스
												따상상 월 800만원 수익화 만들었던 노하루를 드립니다. <br>19,000원
											</span>
										</a>
									</div>
								</li>
							</ul>
							<div class="slide-control">
								<div class="control01">
									<label for="slide06" class="prev1"></label> <label for="slide05" class="next1"></label>
								</div>
								<div class="control02">
									<label for="slide04" class="prev1"></label> <label for="slide06" class="next1"></label>
								</div>
								<div class="control03">
									<label for="slide05" class="prev1"></label> <label for="slide04" class="next1"></label>
								</div>
							</div>
						</div>
						<div class="chatPaper" id="chatPaper">
							<div class="chatPaperhead">
								<div class="chatPaperheadleft">&nbsp</div>
								<div class="chatPaperheadCenter">&nbsp</div>
								<div class="chatPaperheadRight">
									<div style="color:black; text-decoration:none; cursor:pointer" onclick="closeChat();">닫기</div>
								</div>
							</div>
							<div class="waitChat" id="waiting">잠시만 기다려주세요</div>
							<div id="chatPaperMessage">
							</div>
							<hr>
							<div id="messageInsert">
								<div id="messageLeft">&nbsp</div>
								<div id="messageCenter">
									<input id="chatMessage" type="text" style="padding: 20px 10px; width:248px; border: 0px;"
										placeholder="메세지를 입력해주세요"
										onKeypress="javascript:if(event.keyCode==13){$('#messageRightBtn').trigger('onclick')}">
								</div>
								<div id="messageRight">
									<button id="messageRightBtn" type="button" style="border:0px;" onclick="sendMessage();"><img
											src="/resources/img/send.png" style="padding:15px 12px;"></button>
									<!--  
						<button id="messageRightBtn2" type="button" style="border:0px;"><img src="/resources/img/send.png" style="padding:15px 12px;"onclick="sendMessage();"></button>						
					-->
								</div>
							</div>
						</div>
						<c:choose>
							<c:when test="${m.grade eq 3}">
								<a class="chatBtn" id="chatBtn" onclick="chatBtnclick();">상담대기</a>
							</c:when>
							<c:otherwise>
								<a class="chatBtn" id="chatBtn" onclick="chatBtnclick();">고객센터</a>
							</c:otherwise>
						</c:choose>
						<br>
						<hr>
						<br>
					</div>
				</div>
				<%@ include file="/WEB-INF/views/common/footer.jsp" %>
					<script>
						jQuery(document).ready(function () {
							$("#chatPaper").hide();
						});
						function chatBtnclick() {
							$("#chatPaper").show();
							$("#chatBtn").hide();

							$("#waiting").removeClass("chatEmpty");
							$("#waiting").addClass("waitChat");

							initChat(${ m.grade });
						}

						function closeChat() {
							$("#chatPaper").hide();
							$("#chatBtn").show();
							var data = { type: "close" };
							ws.send(JSON.stringify(data));
						}
					</script>
					<script>
						var ws;
						var id;
						var name;


						function initChat(cs) {
							console.log(cs);
							id = '${sessionScope.m.memberId}';
							name = '${sessionScope.m.memberName}';
							ws = new WebSocket("ws://192.168.219.103/chat.do");
							if (cs === 3)
								ws.onopen = startCsChat;
							else
								ws.onopen = startChat;

							ws.onmessage = firstMessage;
							ws.onclose = endChat;
						}
						function startCsChat() {
							var data = { type: "csEnter", msg: "상담사(" + name + ")" };
							ws.send(JSON.stringify(data));
							//appendChat("<p>채팅방에 입장했습니다</p>");
						}

						function startChat() {
							var data = { type: "enter", msg: id + "(" + name + ")" };
							ws.send(JSON.stringify(data));
							//	appendChat("<p>채팅방에 입장했습니다</p>");
						}

						function firstMessage(param) {
							$("#waiting").addClass("chatEmpty");
							$("#waiting").removeClass("waitChat");
							$("#chatPaperMessage").html("");
							appendChat(param.data);
							ws.onmessage = receiveMsg;
						}

						function receiveMsg(param) {
							appendChat(param.data);
						}
						function endChat() {
							appendChat("<p>채팅이 종료되었습니다</p>");
						}
						function appendChat(msg) {
							console.log($("#chatPaperMessage")[0]);
							console.log($("#chatPaperMessage")[0].scrollHeight);
							$("#chatPaperMessage").append(msg);
							$("#chatPaperMessage").scrollTop($("#chatPaperMessage")[0].scrollHeight);
						}
						function sendMessage() {
							var message = $("#chatMessage").val();
							if (message !== "") {
								var data = { type: "chat", msg: message };
								ws.send(JSON.stringify(data));
								appendChat("<div class='chat chatRight'><span>" + message + "</span></div>");
								$("#chatMessage").val("");
							}

						}
					</script>
		</body>

		</html>