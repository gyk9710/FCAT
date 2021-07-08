<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<style>
.center {
	margin: 0 auto;
	width: 800px;
	overflow: hidden;
}

.centerleft {
	width: 400px;
	float: left;
}

.centerEmpty {
	width: 100px;
	float: left;
}

.centerRight {
	width: 300px;
	float: left;
}

.bold {
	font-weight: bold;
}
</style>


<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<form action="/afterpayment.do" style="display:none; width:0px; height:0px;">
		<input type="text" name="couponName">
		<input type="text" name="memberId">
		<input type="text" name="impCode">
		<input type="text" name="merchantUid">
		<input type="text" name="paymentName">
		<input type="text" name="amount"  >
		<input type="text" name="buyerEmail"  >
		<input type="text" name="buyerName"  >
		<input type="text" name="buyerPhone"  >
		<input type="text" name="buyerAddr"  >
		<input type="text" name="buyerPostcode"  >
		<input type="text" name="buyerId"  >
		<input type="text" name="sellerId"  >
		<input id="sub"	type="submit" value="결제완료">
	</form>

	<div class="center">
		<div style="height: 130px"></div>
		<div class="centerleft">

			<div></div>
			<img src="${sessionScope.fs.fsPhoto}"
				style="width: 300px; height: 200px;"><br> <br> <span
				class="bold">서비스 설명</span><br> <br>
			<div style="float: left;">
				기본항목<br> <br> 워터마크 디럭스<br> <br> 할인쿠폰
			</div>
			<div style="float: right;">
				가격<br> <br> ${sessionScope.fs.fsPrice}<br> <br> 
				<select id="selectCoupon" onchange="couponChange();">
					<option>쿠폰 선택하세요</option>
				</select>
			</div>
		</div>
		

		<!-- 메모장 -->
		<!-- 아작스 -> db ->쿠폰정보 가져옴 ->
		그걸로 원가 * 쿠폰할인율 해서 쿠폰할인값 구함->
		원가-쿠폰할인값 = 최종가격  -->

		<div class="centerEmpty">&nbsp</div>
		<div class="centerRight">
			<div style="overflow: hidden">
				<div style="float: left;">
					총 서비스 금액<br> <br> 쿠폰 할인
				</div>
				<div style="float: right;">
					<span id="cost">${sessionScope.fs.fsPrice}</span>원<br> <br> <span
						id="discountPrice">0 </span>원
				</div>
			</div>
			<br>
			<hr>
			<div style="overflow: hidden">
				<div style="float: left;">총 결제 금액</div>
				<div style="float: right;">
					<span id="totalPrice">${sessionScope.fs.fsPrice}</span>원
				</div>
			</div>
			<br>
			<button id="payment" style="width: 300px; height: 50px;">결제하기</button>
		</div>
	
	</div>
	<script>
	$("#selectCoupon").show();
	console.log("${sessionScope.fs.fsPhoto}");
	function couponChange(){	
		
		var select=$("#selectCoupon").val();
		console.log(select);
		if(select==="쿠폰 선택하세요")
		{
			$("#discountPrice").html("0");
			$("#totalPrice").html($("#cost").html());
		}
		var memberId="${sessionScope.m.memberId}";
		console.log(memberId);
		var CouponList;
		$.ajax({
			url:"/couponChange.do",
			data:{couponName : select,memberId:memberId},
			dataType:"json",
			success:
				function(data)
				{	
					var cost=parseInt($("#cost").html());
					var discout=cost*(parseInt(data.couponDiscount)/100.0)
					var total=cost-discout;

					console.log(data.couponDiscount);

					console.log(discout);

					console.log(total);
					$("#discountPrice").html(discout);
					$("#totalPrice").html(total);
				}
		})
		
	}
	
	
		var CouponList;
		var memberId="${sessionScope.m.memberId}";
		$.ajax({
			url:"/getCouponList.do",
			data:{memberId:memberId},
			type:"POST",
			dataType:"json",
			success:
				function(data)
				{
					CouponList=data;
					var len=data.length;
					var str=$("#selectCoupon").html();
					for(var i=0;i<len;++i)
					{
						str+="<option value='"+data[i].couponName+"'>"+data[i].couponName+"</option>";
					}
					$("#selectCoupon").html(str);
					
				}
		})
		
		
		var price;
		var d;
		var date;
		var im_code;
		var merchant_uid;
		var paymentName;
		var amount;
		var buyer_email;
		var buyer_name;
		var buyer_phone;
		var buyer_addr;
		var buyer_postcode;
		
		function trigger1()
		{
			
			 price = $("#totalPrice").html();
			 d = new Date();
			 date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()
						+""+d.getHours()+""+d.getHours()+""+d.getSeconds();
			 im_code='imp41353926';
			 merchant_uid="상품명_"+date;
			 paymentName="결제 테스트";
			 amount=price;
			 buyer_email="rr0610@naver.com";
			 buyer_name="지혜성";
			 buyer_phone="010-4191-4667";
			 buyer_addr="서울시 구로구 고척로 52길 48";
			 buyer_postcode="76621";
			
			$("[name=couponName]").val($("#selectCoupon").val());
			$("[name=memberId]").val("${sessionScope.m.memberId}");
			$("[name=impCode]").val(im_code);
			$("[name=merchantUid]").val(merchant_uid);
			$("[name=paymentName]").val(paymentName);
			$("[name=amount]").val(amount);
			$("[name=buyerEmail]").val(buyer_email);
			$("[name=buyerName]").val(buyer_name);
			$("[name=buyerPhone]").val(buyer_phone);
			$("[name=buyerAddr]").val(buyer_addr);
			$("[name=buyerPostcode]").val(buyer_postcode);
			$("[name=buyerId]").val("${sessionScope.m.memberId}");
			$("[name=sellerId]").val("박지성");
			$("#sub").trigger("click");
		}
		
		$("#payment").click(function(){
			 price = $("#totalPrice").html();
			 d = new Date();
			 date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()
						+""+d.getHours()+""+d.getHours()+""+d.getSeconds();
			 im_code='imp41353926';
			 merchant_uid="상품명_"+date;
			 paymentName="결제 테스트";
			 amount=price;
			 buyer_email="rr0610@naver.com";
			 buyer_name="지혜성";
			 buyer_phone="010-4191-4667";
			 buyer_addr="서울시 구로구 고척로 52길 48";
			 buyer_postcode="76621";
			
			
			IMP.init(im_code);
			
			IMP.request_pay({
				merchant_uid : merchant_uid,			//거래ID
				name : paymentName,					//결제 이름
				amount : amount,						//결제 금액
				buyer_email : buyer_email,	//구매자 email주소
				buyer_name : buyer_name,					//구매자 이름
				buyer_phone : buyer_phone,		//구매자 전화번호
				buyer_addr : buyer_addr,	//구매자 주소
				buyer_postcode : buyer_postcode			//구매자 우편번호
			}, function(rsp){
				if(rsp.success){					//결제 성공시
					alert("결제 성공");
					console.log("카드 승인번호 : "+rsp.apply_num);
					trigger1();
				}else{								//결제 실패시
					alert("결제 실패");
				}
			});
			
			
			
		});
	</script>
	
	<br><br><br>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>


































