/**
 * 
 */
 $(".active").parent().next().slideToggle(100);
	$(function() {
		$(".more").click(function(evente) {
			$(this).parent().next().slideToggle(400);
			if ($(this).attr("class") == "more") {
				$(this).addClass("rotate");
			} else {
				$(this).removeClass("rotate");
			}
			evente.stopPropagation(); //이벤트버블링제거
		});
		$(".more").parent().click(function() {
			$(this).children().last().click();
		});
		$(".sub-menu").children().click(function() {
			var tab_id = $(this).children().attr('data-tab');
			console.log(tab_id);
			$(".sub-menu").children().children().removeClass("current");
			$('.tab-content').removeClass('now');

			$(this).children().addClass("current");
			$("#" + tab_id).addClass('now');

		});
	});
	function heartsClick(e) {
		if ($(e).children().attr("id") == "nofilling") {
			$(e).html("<i class='fas fa-heart'></i>");
			var memberId = $("#memberId").val();
			var fsNo = $(e).next().val();
			console.log(fsNo);
			console.log(memberId);
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
			var fsNo = $(e).next().val();
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
	$(".likeList").click(function() {
		var idx = $(".likeList").index(this);
		var fsNo = $(".fsNo").eq(idx).val();
		console.log(idx);
		console.log(fsNo);
		var pageFront = "/serviceDetail.do?fsNo=";
		var page = pageFront + fsNo;
		location.href = page;
	});
	//회원정보
	 var bool1 = false;
            var bool2 = false;
            var bool3 = false;
            var bool4 = false;

            function addSearch() {
              new daum.Postcode({
                oncomplete: function (data) {
                  $("#postCode").val(data.zonecode);
                  $("#roadAddr").val(data.roadAddress);
                  $("#jibunAddr").val(data.jibunAddress);
                  $("#detailAddr").focus();
                },
              }).open();
            }
            $("#memberPw").keyup(function () {
              var Reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,12}$/;
              var name = $(this).val();
              if (Reg.test(name)) {
                $(this).attr("class", "form-control is-valid");
                $("[id = error-msg1]").html(
                        ""
                      );
                self.bool1 = true;
              } else if (!Reg.test(name)) {
                $(this).attr("class", "form-control is-invalid");
                $("[id = error-msg1]").attr("class", "invalid-feedback");
                $("[id = error-msg1]").html(
                  "8~12 자, 최소 하나의 문자 및 하나의 숫자"
                );
                self.bool1 = false;
              }
            });
            $("#memberPwRe").keyup(function () {
              var pw = $("#memberPw").val();
              var pwRe = $(this).val();
              if (pw == pwRe) {
                $(this).attr("class", "form-control is-valid");
                $("[id = error-msg2]").html("");
                self.bool2 = true;
              } else {
                $(this).attr("class", "form-control is-invalid");
                $("[id = error-msg2]").attr("class", "invalid-feedback");
                $("[id = error-msg2]").html("비밀번호가 같지 않습니다.");
                self.bool2 = false;
              }
            });
            $("#memberPhone").keyup(function () {
              var Reg = /^\d{2,3}-\d{3,4}-\d{4}$/;
              var name = $(this).val();
              if (Reg.test(name)) {
                $(this).attr("class", "form-control is-valid");
                $("[id = error-msg4]").html("");
                self.bool4 = true;
              } else if (!Reg.test(name)) {
                $(this).attr("class", "form-control is-invalid");
                $("[id = error-msg4]").attr("class", "invalid-feedback");
                $("[id = error-msg4]").html("ex)010-1234-5678");
                self.bool4 = false;
              }
            });

            $("#btnbtn").click(function (e) {
              if (
                !self.bool1 ||
                !self.bool2 ||
//                 !self.bool3 ||
                !self.bool4 ||
                $("#memberPw").val() == "" ||
                $("#memberPwRe").val() == "" ||
//                 $("#memberName").val() == "" ||
                $("#memberPhone").val() == ""
              ) {
                alert("작성한 내용을 다시 확인해주세요.");
                if ($("#memberPw").val() == "") {
                  $("#memberPw").attr("class", "form-control is-invalid");
                  $("#noSpace1").attr("class", "invalid-feedback");
                  $("#noSpace1").html("필수 입력항목입니다.");
                }
                if ($("#memberPwRe").val() == "") {
                  $("#memberPwRe").attr("class", "form-control is-invalid");
                  $("[id = noSpace2]").attr("class", "invalid-feedback");
                  $("[id = noSpace2]").html("필수 입력항목입니다.");
                }
//                 if ($("#memberName").val() == "") {
//                   $("#memberName").attr("class", "form-control is-invalid");
//                   $("[id = noSpace3]").attr("class", "invalid-feedback");
//                   $("[id = noSpace3]").html("필수 입력항목입니다.");
//                 }
                if ($("#memberPhone").val() == "") {
                  $("#memberPhone").attr("class", "form-control is-invalid");
                  $("[id = noSpace4]").attr("class", "invalid-feedback");
                  $("[id = noSpace4]").html("필수 입력항목입니다.");
                }
                return false;
              }
              return true;
//       		$('#modal').modal("show");
            });
            $("#btn-modal").click(function (){
            	if($("#memberPwInput").val()==""){
            		  alert("작성한 내용을 다시 확인해주세요.");
            	}else{
            		var id = $("#memberIdInput").val();
                    var pw = $("#memberPwInput").val();
            	        $.ajax({
            	          url: "/pwCheck.do",
            	          type: "post",
            	          data: {
            	        	  memberId: id,
            	        	  memberPw: pw,
            	            },
            	          success: function (data) {
            	        	  if(data==0){
            	        		  alert("비밀번호를 잘못 입력하셨습니다.");
            	        		  return
            	        	  }else if (data==1){
            	        		  modalOn()
            	        		    const closeBtn = modal.querySelector(".close-area")
						            closeBtn.addEventListener("click", e => {
						                modalOff()
						            })
						            modal.addEventListener("click", e =>{
						                const evTarget = e.target
						                if(evTarget.classList.contains("modal-overlay")) {
						                    modalOff()
						                }
						            })
						            window.addEventListener("keyup", e => {
						                if(isModalOn() && e.key === "Escape") {
						                    modalOff()
						                }
						            })
            	        	  }
            	          },
            	          error: function () {
            	          alert("서버 연결 이상");
            	          }
            	        });
            	}
            });
            $("#btn-modalDelete").click(function (){
            	if($("#memberPwInput2").val()==""){
            		  alert("작성한 내용을 다시 확인해주세요.");
            	}else{
            		var id = $("#memberIdInput").val();
                    var pw = $("#memberPwInput2").val();
            	        $.ajax({
            	          url: "/pwCheck.do",
            	          type: "post",
            	          data: {
            	        	  memberId: id,
            	        	  memberPw: pw,
            	            },
            	          success: function (data) {
            	        	  if(data==0){
            	        		  alert("비밀번호를 잘못 입력하셨습니다.");
            	        		  return
            	        	  }else if (data==1){
            	        	   $("#modalDelete").modal("show");
            	        	  }
            	          },
            	          error: function () {
            	          alert("서버 연결 이상");
            	          }
            	        });
            	}
            });
          
            const modal = document.getElementById("modal")
            function modalOn() {
                modal.style.display = "flex"
            }
            function isModalOn() {
                return modal.style.display === "flex"
            }
            function modalOff() {
                modal.style.display = "none"
            }
            const btnModal = document.getElementById("")
            btnModal.addEventListener("click", e => {
                modalOn()
            })
            const closeBtn = modal.querySelector(".close-area")
            closeBtn.addEventListener("click", e => {
                modalOff()
            })
            modal.addEventListener("click", e =>{
                const evTarget = e.target
                if(evTarget.classList.contains("modal-overlay")) {
                    modalOff()
                }
            })
            window.addEventListener("keyup", e => {
                if(isModalOn() && e.key === "Escape") {
                    modalOff()
                }
            })
  