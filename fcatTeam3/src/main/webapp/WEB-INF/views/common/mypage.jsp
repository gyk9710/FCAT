<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my page</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
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
                            <li><a href="#">서비스 등록</a></li>
                            <li><a href="#">서비스 수정</a></li>
                            <li><a href="#">서비스 삭제</a></li>
                        </ul>
                    
                    </li>
                    <li>
                        <a href="#">커뮤니티</a>
                        <ul class="sub-menu">
                            <li><a href="#">쪽지함</a></li>
                            <li><a href="#">채팅방</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            </c:when>
            <c:otherwise>
            <ul class="main-menu">
                    
                    <li>
                        <a href="#">판매자 권한</a>
                        <ul class="sub-menu">
                                    <li><a href="/sellerAskFrm.do">판매자 전환 신청</a></li>
                                    
                            
                        </ul>
                       </li>
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
                            <li><a href="#">채팅방</a></li>
                        </ul>
                    </li>
                </ul>
                </div>
            </c:otherwise>

		 </c:choose>

        </div>
        <div class="my_r">

        <h3>판매관리</h3>
        <div class="my_list">

            <table class="table-sm table-bordered table-hover text-center center">
                <thead>
                    <tr class="my_list_tr">
                        <th><input type="checkbox" id="allCheck"></th>
                        <th>번호</th>
                        <th>서비스제목 (fstitle)</th>
                        <th>대분류</th>
                        <th>중분류</th>
                        <th>신청인</th>
                        <th>확인</th>
                    </tr>
                </thead>

                <tbody class="text-center">
                    <c:forEach items="${list }" var="rs" varStatus="i">
                        <tr>
                            <td><input type="checkbox" name="requestService"></td>
                            <td>${i.count }</td>
                            <td>기타 경력 60년입니다</td>
                            <td>${rs.fsCategory}</td>
                            <td>${rs.fsChildCategory}</td>
                            <td>${rs.requestId}</td>
                            <td>
                                <button class="mybtn">승인</button>
                                <button class="mybtn">반려</button>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td><input type="checkbox" name="requestService"></td>
                        <td>2</td>
                        <td class="list_title">수학 레알누구보다 려요</td>
                        <td>레슨</td>
                        <td>수학과외</td>
                        <td>user01</td>
                        <td>
                            <button class="mybtn">승인</button>
                            <button class="mybtn">반려</button>
                        </td>
                    </tr>
                </tbody>
            </table>
            <br>
            <div class="submit_btn">
                
                <button class="mybtn2">체크 수락</button>
                <button class="mybtn2">체크 거절</button>
            </div>
        </div>

        </div >
        
    </div>
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>