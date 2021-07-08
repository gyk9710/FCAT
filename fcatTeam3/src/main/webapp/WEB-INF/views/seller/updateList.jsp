<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my page</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<style>
.utbtn{
	width: 43px;
    border: 1px solid;
    color: white;
    background-color: #00c7ae;
    height: 30px;
    border-radius: 4px;
    margin-left: 3px;
    float: left;
    position: relative;
    left: 30px;
}
</style>
</head><script>
    $(function(){
        $(".sub-menu").prev().append("<span class='more'>+</span>");
        $(".more").click(function(evente){
            $(this).parent().next().slideToggle(400);
            if($(this).attr("class") == 'more'){
                $(this).addClass('active');
            }else{
                $(this).removeClass('active');
            }
            evente.stopPropagation();//이벤트버블링제거

        });
        $(".more").parent().click(function(){
            $(this).children().last().click();
        })
    
    });
    
    
    
</script>
<link rel="stylesheet" href="/resources/css/mypage.css"> 
<body>

    <div class="container">
        <div class="my_l">
            
           
                
                 <div class="menu">
                	<h3 style="text-align: center;">MY PAGE</h3>
                	<c:choose>
                	<c:when test="${sessionScope.m.grade==1}">
               
                <ul class="main-menu">
                    
                    <li>
                        <a href="#">판매관리</a>
                        <ul class="sub-menu">
                                    <li><a href="#">요청중</a></li>
                                    <li><a href="#">진행중</a></li>
                                    <li><a href="#">완료</a></li>
                            
                        </ul>
                    
                    <li>
                        <a href="#">나의서비스</a>
                        <ul class="sub-menu">
                            <li><a href="/fserviceFrm.do">서비스 등록</a></li>
                            <li><a href="/myserviceUpdateList.do?fsWriter=${sessionScope.m.memberId}">서비스 수정</a></li>
                            <li><a href="#">서비스 삭제</a></li>
                        </ul>
                    
                    </li>
                    <li>
                        <a href="#">커뮤니티</a>
                        <ul class="sub-menu">
                            <li><a href="#">쪽지함</a></li>
                            <li><a href="/chatList.do?memberId=${sessionScope.m.memberId}">채팅방</a></li>
                        </ul>
                    </li>
                </ul>
            
            	</c:when>
            	<c:otherwise>
            <ul class="main-menu">
                    
                    <li>
                        <a href="#">판매자 권한</a>
                        <ul class="sub-menu">
                                    <li><a href="/sellerAskFrm.do">판매자 전환 신청</a></li>
                                    
                            
                        </ul>
                       </li>
                       </ul>
            <ul class="main-menu">
                    
                    <li>
                        <a href="#">구매관리</a>
                        <ul class="sub-menu">
                                    <li><a href="#">요청중</a></li>
                                    <li><a href="#">진행중</a></li>
                                    <li><a href="#">완료</a></li>
                            
                        </ul>
                    
                 
                    <li>
                        <a href="#">커뮤니티</a>
                        <ul class="sub-menu">
                            <li><a href="#">쪽지함</a></li>
                            <li><a href="/chatList.do?memberId=${sessionScope.m.memberId}">채팅방</a></li>
                        </ul>
                    </li>
                </ul>
                
           		</c:otherwise>
			</c:choose>
			</div>
		 	

        </div>
        <div class="my_r">

        <span style="font-size: 20px; display: inline-block; margin-bottom: 10px;">나의 서비스</span>&nbsp;&nbsp;&nbsp;   서비스 수정
        <div class="my_list">

            <table class="table-sm table-bordered table-hover text-center center">
                <thead>
                    <tr class="my_list_tr">
                        
                        <th>번호</th>
                        <th>서비스제목 (fstitle)</th>
                        <th>대분류</th>
                        <th>중분류</th>
                      	<th>가격</th>
                        <th>확인</th>
                    </tr>
                </thead>

                <tbody class="text-center">
                    <c:forEach items="${list }" var="fs" varStatus="i">
                        <tr>
                            <td>${i.count }</td>
                            <td>${fs.fsTitle} </td>
                            <td>${fs.fsCategory}</td>
                            <td>${fs.fsChildCategory}</td>
                            <td>${fs.fsPrice }</td>
                            
                            <td>
                                <button class="utbtn">수정</button>
                              
                            </td>
                        </tr>
                    </c:forEach>
                    
                </tbody>
            </table>
            <br>
           
        </div>

        </div >
        
    </div>
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>