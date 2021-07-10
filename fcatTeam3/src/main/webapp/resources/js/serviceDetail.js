
	function sendRequest(msgSender){
	
		var msgReceiver = $("#fsWriterFont").html();
		var msgTitle = "서비스 요청!";
		var msgContent = msgSender+"님이"+$("#fsTitle").html()+"에 대해 서비스를 요청하였습니다";
		location.href="/payment.do";
		
			/*$.ajax({
			url : "/payment.do",
			type : "post",
			data : {msgSender:msgSender,msgReceiver:msgReceiver,msgTitle:msgTitle,msgContent:msgContent},
			success : function(data){
				if(data == '1'){
					alert("요청 성공");
					location.reload();
				}else{
					alert("요청 실패");
				}
			}
		});*/
	
		
	}

	(function(global, $) {
		var $menu = $(".floating-menu li.m"), $contents = $(".scroll"), $doc = $("html, body");
		$(function() {
			$menu
					.on(
							"click",
							"a",
							function(e) {
								var $target = $(this).parent(), idx = $target
										.index(), section = $contents.eq(idx), offsetTop = section
										.offset().top - 60; //헤더 높이만큼 빼줌
								$doc.stop().animate({
									scrollTop : offsetTop,
								}, 200);
								return false;
							});
		});

		$(window)
				.scroll(
						function() {
							var scltop = $(window).scrollTop() + 60; //헤더높이만틈 더해 줌

							$
									.each(
											$contents,
											function(idx, item) {
												var $target = $contents.eq(idx), i = $target
														.index(), targetTop = $target
														.offset().top;

												if (targetTop <= scltop) {
													$menu.removeClass("on");
													$menu.eq(idx)
															.addClass("on");
												}
												if (!(200 <= scltop)) {
													$menu.removeClass("on");
												}
											});
						});

		var btnTop = $(".btn-top");
		btnTop.on("click", "a", function(e) {
			e.preventDefault();
			$doc.stop().animate({
				scrollTop : 0,
			}, 200);
		});
	})(window, window.jQuery);
	$(document).ready(function() {
		//상대적인 좌표 값을 반환, .offset()가 반환 하는 객체는 left와 top 속성을 제공

		//top 속성을 이용해서 메뉴의 수직 위치를 구함

		var menu_offset = $(".floating-menu").offset();

		//스크롤 바를 스크롤할 때 매개변수로 전달된 함수를 실행시킴

		$(window).scroll(function() {
			//문서의 스크롤바 위치와 메뉴의 수직 위치를 비교해서

			//문서의 스크롤바 위치가 메뉴의 수직 위치보다 크면(위치로 표현하면 아래)

			if ($(document).scrollTop() >= menu_offset.top) {
				//메뉴에 menu-fixed 클래스를 추가해서 메뉴를 고정시킴

				$(".floating-menu").addClass("menu-fixed");
			} else {
				//메뉴에서 menu-fized 클래스를 제거해서 메뉴를 수직으로 이동할 수 있도록 처리함

				$(".floating-menu").removeClass("menu-fixed");
			}
		});
	});
	function heartsClick(e) {
		if ($(e).children().attr("id") == "nofilling") {
			$(e).html("<i class='fas fa-heart'></i>");
			var memberId = $("#memberId").val();
			var fsNo = $("#fsNo").val();
			console.log(memberId);
			console.log(fsNo);

			$.ajax({
				url : "/serviceLike.do",
				type : "post",
				data : {
					memberId : memberId,
					fsNo : fsNo,
				},
				success : function(data) {
				},
				error : function() {
					alert("서버 연결 이상");
				}
			})
		} else {
			$(e).html("<i class='far fa-heart' id='nofilling'></i>");
			var memberId = $("#memberId").val();
			var fsNo = $("#fsNo").val();
			$.ajax({
				url : "/serviceCancelLike.do",
				type : "post",
				data : {
					memberId : memberId,
					fsNo : fsNo,
				},
				success : function(data) {
				},
				error : function() {
					alert("서버 연결 이상");
				}
			})
		}
	}
	$(".noright").click(function() {
		alert("로그인 후 사용해주세요.");
	})
	$(".reComment").click(function() {
		var idx = $(".reComment").index(this); //클릭한 게 몇번쨰 답글달기 버튼인지 구하는 코드
		$(this).hide();
		$(".answerInput").eq(idx).css("display", "flex");
		$(".cancelComment").click(function() {
			$(".reComment").eq(idx).show();
			$(".answerInput").eq(idx).css("display", "none");
		});
	});
	$("#questionBtn").click(function() {
		var comment = $("#questionInput").val();
		var fsNo = $("#fsNo").val();
		var memberId = $("#memberId").val();
		var date = new Date();
		console.log(comment);
		var year = date.getFullYear(); //년도
		var month = date.getMonth() + 1; //월
		var day = date.getDate(); //일

		if ((day + "").length < 2) { // 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
			day = "0" + day;
		}

		var getToday = year + "-" + month + "-" + day; // 오늘 날짜 (2017-02-07)

		$.ajax({
			url : "/insertQuestion.do",
			type : "post",
			data : {
				fsNo : fsNo,
				memberId : memberId,
				getToday : getToday,
				comment : comment,
			},
			success : function(data) {
				location.reload();
			},
			error : function() {
				alert("서버 연결 이상");
			}
		})
	});
	$(".putRecomment").click(function() {
		var idx = $(".putRecomment").index(this); //클릭한 게 몇번쨰 답글달기 버튼인지 구하는 코드
		var comment = $(".answerText").eq(idx).val();
		var qNo = $(".qNo").eq(idx).val();
		var fsNo = $("#fsNo").val();
		var memberId = $("#memberId").val();
		var date = new Date();
		console.log(qNo);
		var year = date.getFullYear(); //년도
		var month = date.getMonth() + 1; //월
		var day = date.getDate(); //일

		if ((day + "").length < 2) { // 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
			day = "0" + day;
		}

		var getToday = year + "-" + month + "-" + day; // 오늘 날짜 (2017-02-07)

		$(".answerInput").eq(idx).css("display", "none");

		$.ajax({
			url : "/insertAnswer.do",
			type : "post",
			data : {
				fsNo : fsNo,
				memberId : memberId,
				getToday : getToday,
				comment : comment,
				qNo : qNo,
			},
			success : function(data) {
				location.reload();
			},
			error : function() {
				alert("서버 연결 이상");
			}
		})
	});
	$(".deleteComment").click(function() {
		var idx = $(".deleteComment").index(this); //클릭한 게 몇번쨰 답글달기 버튼인지 구하는 코드
		var qNo = $(".qNo").eq(idx).val();
		confirm("정말 삭제하시곘습니까?");
		$.ajax({
			url : "/deleteComment.do",
			type : "post",
			data : {
				qNo : qNo,
			},
			success : function(data) {
				location.reload();
			},
			error : function() {
				alert("서버 연결 이상");
			}
		})
	});