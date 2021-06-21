<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="/resources/headerassets/materialize/css/materialize.min.css" media="screen,projection" />
    <!-- Bootstrap Styles-->
    <link href="/resources/headerassets/css/headerbootstrap.css" rel="stylesheet" />
    
    <!-- FontAwesome Styles-->
    <link href="/resources/headerassets/css/headerfont-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="/resources/headerassets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="/resources/headerassets/css/headercustom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

    <link rel="stylesheet" href="/resources/headerassets/js/Lightweight-Chart/cssCharts.css"> 
    <style>
        .h_search{
            width: 20% !important;
            color: black;
            border-bottom: 1px solid black !important;
            position: relative;
            left: 30px;
            top: 10px;
            
        }
        .b_search{
           
           
            position: relative;
            left: 30px;
            top: 10px;
           
            
        }
        .f_i{
            display: inline;
        }
    
    </style>
</head>
<body>

    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle waves-effect waves-dark" data-toggle="collapse" data-target=".sidebar-collapse">
                
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand waves-effect waves-dark"  href="#"><img src="/resources/headerassets/img/logo-w.png"  class="large material-icons"> fCat</a>
            
   
        </div>
            <form class="f_i">
                <input type="text" placeholder="원하는 서비스를 검색해주세요" class="h_search">
                    <button class="btn btn-outline-secondary b_search" type="button" id="button-addon1">검색</button>
                    
                  
            </form>
        <ul class="nav navbar-top-links navbar-right"> 
            <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown4"><i class="fa fa-envelope fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>				
            
            <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown2"><i class="fa fa-bell fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>
            <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown1"><i class="fa fa-user fa-fw"></i> <b>가연님</b> <i class="material-icons right">arrow_drop_down</i></a></li>
        </ul>
    </nav>
    <input type="text" placeholder="원하는 서비스를 검색해주세요" class="h_search">
            <input type="submit" value="search" class="b_search">
    

    <!-- Dropdown Structure 마이페이지 드롭다운 -->
	<!-- Dropdown Structure -->
    <ul id="dropdown1" class="dropdown-content">
        <li><a href="#"><i class="fa fa-user fa-fw"></i> my page</a>
        </li>
        <li><a href="#"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
        </li>
        </ul>
        <ul id="dropdown2" class="dropdown-content w250">
          <li>
                                        <div>
                                            <i class="fa fa-comment fa-fw"></i> New Comment
                                            <span class="pull-right text-muted small">4 min</span>
                                        </div>
                                    </a>
                                </li>
                                
                                <li class="divider"></li>
                                <li>
                                        <div>
                                            <i class="fa fa-envelope fa-fw"></i> Message Sent
                                            <span class="pull-right text-muted small">4 min</span>
                                        </div>
                                    
                                </li>
                               
                                <li class="divider"></li>
                                <li>
                                    <a class="text-center" href="#">
                                        <strong>See All Alerts</strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </li>
        </ul>

        <ul id="dropdown4" class="dropdown-content dropdown-tasks w250 taskList">
                <li>
                                            <div>
                                                <strong>판매자 닉네임</strong>
                                                <span class="pull-right text-muted">
                                                    <em>Today</em>
                                                </span>
                                            </div>
                                            <p>작업기간 단축 원하시면 + 20000원 더해주시면 됩니다</p>
                                        </a>
                                    </li>
                                    
                                    
                                    
                                    <li class="divider"></li>
                                    <li>
                                        <a class="text-center" href="#">
                                            <strong>모든 대화방 보기</strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </li>
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