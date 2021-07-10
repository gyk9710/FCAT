<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<title>index</title>
</head>
<body>
<%@include file="/WEB-INF/views/admin/adminSide.jsp" %>
    <!-- 카드 섹션-->
    <section>
      <div class="container-fluid">
        <div class="row">
          <div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
            <div class="row pt-md-5 mt-md-3 mb-5">
              <div class="col-sm-6 p-2">
                <div class="card card-common">
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <i class="fas fa-user fa-3x"></i>
                      <div class="text-right text-secondary">
                        <h5>금일 방문 회원 수</h5>
                        <h3 id="todayVisitor"></h3>
                      </div>
                    </div>
                  </div>
                  <!-- 
                  <div class="card-footer text-secondary">
                    <i class="fas fa-sync mr-3"></i>
                    <span>Updated Now</span>
                  </div>
                   -->
                </div>
              </div>
              <div class="col-sm-6 p-2">
                <div class="card card-common">
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <i class="fas fa-users fa-3x text-success"></i>
                      <div class="text-right text-secondary">
                        <h5>총 회원수</h5>
                        <h3  id="allMemberCount"></h3>
                      </div>
                    </div>
                  </div>
                  <!-- 
                  <div class="card-footer text-secondary">
                    <i class="fas fa-sync mr-3"></i>
                    <span>Updated Now</span>
                  </div>
                   -->
                </div>
              </div>
              <div class="col-sm-6 p-2">
                <div class="card card-common">
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <i class="fas fa-shopping-cart fa-3x text-warning"></i>
                      <div class="text-right text-secondary">
                        <h5>총 거래 채결 수</h5>
                        <h3 id="totalPayment"></h3>
                      </div>
                    </div>
                  </div>
                  <!-- 
                  <div class="card-footer text-secondary">
                    <i class="fas fa-sync mr-3"></i>
                    <span>Updated Now</span>
                  </div>
                   -->
                </div>
              </div>
              <div class="col-sm-6 p-2">
                <div class="card card-common">
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <i class="fas fa-credit-card fa-3x "></i>
                      <div class="text-right text-secondary">
                        <h5>총 거래 채결 액</h5>
                        <h3 id="totalPay"></h3>
                      </div>
                    </div>
                  </div>
                  <!-- 
                  <div class="card-footer text-secondary">
                    <i class="fas fa-sync mr-3"></i>
                    <span>Updated Now</span>
                  </div>
                   -->
                </div>
              </div> 
              <!-- bar chart -->
              <div class="col-md-6 col-sm-6" >
                <div class="container">
                  <canvas id="myChart"></canvas>
                </div>
              </div>
               
              <div class="col-md-6 col-sm-6  ">
                <div class="container">
                    <div class="card-body">
                        <canvas id="myChart2"></canvas>
                    </div>
                </div>
            </div> 
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- 카드 섹션 끝-->
	<script>
	  $(document).ready(function(){
       $.ajax({
	            type : "GET",
	            url : "allMemberCount.do",
	            success : function(data){
	                $("#allMemberCount").html(data+"명") ;
	            }  
	        });
      $.ajax({
          type : "GET",
          url : "todayVisitor.do",
          success : function(data){
              $("#todayVisitor").html(data+"명") ;
          }  
      });
      
      $.ajax({
          type : "GET",
          url : "totalPayment.do",
          success : function(data){
              $("#totalPayment").html(data+"건") ;
          }  
      });
      
      $.ajax({
          type : "GET",
          url : "totalPay.do",
          success : function(data){
              $("#totalPay").html(data+"원") ;
          }  
      });
      
      $.ajax({
          type : "GET",
          url : "memberVisitor.do",
          success : function(returnData){
              var d = new Date();
              var date = (d.getMonth()+1)+"월"+d.getDate()+"일";
              var arr = new Array();
              for(var key in returnData){
            	  arr.push(returnData[key]);
              }
              console.log(arr);
              var ctx = document.getElementById('myChart');
              var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                  labels: [(d.getMonth()+1)+"월"+(d.getDate()-6)+"일",(d.getMonth()+1)+"월"+(d.getDate()-5)+"일",(d.getMonth()+1)+"월"+(d.getDate()-4)+"일",(d.getMonth()+1)+"월"+(d.getDate()-3)+"일",(d.getMonth()+1)+"월"+(d.getDate()-2)+"일", (d.getMonth()+1)+"월"+(d.getDate()-1)+"일", "오늘"],
                  datasets: [{
                    label: '방문자수',
                    data: arr,
                    borderWidth: 1
                  }]
                },
                options: {
                  scales: {
                    yAxes: [{
                      ticks: {
                        beginAtZero: true
                      }
                    }]
                  }
                }
              });
          }  
      });
      
      $.ajax({
          type : "GET",
          url : "joinMember.do",
          success : function(returnData){
              var d = new Date();
              var month = d.getMonth();
              var arr = new Array();
              for(var key in returnData){
            	  arr.push(returnData[key]);
              }
              console.log(arr);
              var ctx = document.getElementById('myChart2');
              var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                  labels: [month-4+"월",month-3+"월",month-2+"월",month-1+"월",month+"월",month+1+"월"],
                  datasets: [{
                    label: '가입한 회원 수',
                    data: arr,
                    fill: false,
                    borderColor : 'rgb(255, 192, 192)',
                    backgroundColor: 'transparent',
                    borderWidth: 3
                    
                  }]
                },
                options: {
                  scales: {
                    yAxes: [{
                      ticks: {
                        beginAtZero: true
                      }
                    }]
                  }
                }
              });
          }  
      });
       
      
	    });	
	  
      	  
	
	</script>
    
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
<!-- 

 	   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>

 -->
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <script src="/resources/js/adminscript.js"></script>
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    -->
</body>
</html>