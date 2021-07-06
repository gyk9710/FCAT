<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
     <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/styles.css" rel="stylesheet" />

        <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    </head>
    <style>
    .cate{
  display: inline-block;
  font-size: 16px;
  color: gray;
  margin-bottom: 10px;
}
.prow{
  margin-left: 16px;
  clear: left;
  
}
.cre{
  
  height: 200px;
  line-height: 200px;
  padding: 10px;
  display: inline-block;
  
}
.sellertop{
  border-radius:  2px;
  border: 1px solid gray;
  padding: 20px;
}
.select_img{
  float: left;
}
.profile{
  
  width: 150px;
  height: 200px;
 
}
.tesch{
  width: 70%; 
  border-radius: 2px;
  height: 40px;
  padding: 8px;
  border: 1px solid gray;
  margin-bottom: 15px;
}
.tesch2{
  width: 50%; 
  border-radius: 2px;
  height: 40px;
  padding: 8px;
  border: 1px solid gray;
  margin-bottom: 20px;
}
.tesch3{
  width: 20%; 
  border-radius: 2px;
  height: 40px;
  padding: 8px;
  border: 1px solid gray;
}

.sellerA{
  width: 80%;
  border: 1px solid gray;
  border-radius: 3px;
  height: 100px;
  margin-bottom: 10px;
  padding: 10px;
  
}
        .s1{
           
            margin: 30px 0px 30px 0px;
        }
        .s2{
            margin-bottom: 30px;
        }
        .t1{
            width: 90%;
            border: 1px solid rgb(153, 151, 151);
            
        }
        .t3{
            width: 60%;
            border: 1px solid white;
            
        }
        .t1-1{
            
            border: 1px solid rgb(153, 151, 151);
            height: 50px;
            padding-left: 20px;
            
        }
        .t1-2{
            padding-top: 20px;
            padding-left: 20px;
        }
        .tp1{
            color: rgb(71, 71, 71);
            font-size: 10px;
        }
        .ti1{
            width: 80%;
            border: 1px solid rgb(153, 151, 151);
            border-radius: 3px;
            padding-left: 30px;
        }
        .ti1-1{
            width: 27%;
            
            border: 1px solid rgb(153, 151, 151);
            border-radius: 3px;
            padding-left: 30px;
        }
        .ti1-2{
           position: relative;
           left: 30px;
            width: 30%;
            border: 1px solid rgb(153, 151, 151);
            border-radius: 2px;
            padding-left: 30px;
            display: none;

        }


        .ti2{
            width: 130px;
            height: 40px;
            border: 1px solid rgb(153, 151, 151);
            border-radius: 3px;
            padding-left: 30px;
            margin-bottom: 15px;
            
        }
        .tit{
            width: 110px;
            border: 1px solid rgb(153, 151, 151);
            border-radius: 3px;
            text-align: center;
            height: 40px;
            line-height: 40px;
            color: black;
            float: left;
        }
        .tit-img{
            width: 110px;
            border: 1px solid rgb(153, 151, 151);
            border-radius: 3px;
            text-align: center;
            height: 40px;
            line-height: 40px;
            color: black;
            margin-bottom: 15px;

        }
        .tit-1{
            width: 110px;
            border: 1px solid rgb(153, 151, 151);
            border-radius: 3px;
            text-align: center;
            height: 40px;
            line-height: 40px;
            color: black;
            float: left;
        }

        .ta1{
            width: 100%;
            height: 500px;
            border: 1px solid white;
            padding-top: 10px;
        }
        .won{
            display: inline-block;
            height: 50px;
            line-height: 50px;
            background-color: red;
        }
        .sdr{
            padding: 30px 0px 30px 0px;
            width: 90%;
            text-align: center;
        }
        .header{
            width: 100%;
            background-color: thistle;
        }
        .img_i{
            display: none;
        }
        .img_btn{
            width: 100px;
            height: 40px;
            line-height: 40px;
            text-align: center;
            background-color: white;
            border: 1px solid rgb(153, 151, 151);
            border-radius: 3px;
            color: black;


        }

    </style>
    <script>
        $(function(){
          
            $(".ca_d").change(function(){
                var name= $(".ca_d option:selected").val();
                console.log(name);
				$(".ti1-2").prop("disabled",true);
				$(".ti1-2").hide();
                if(name=='레슨'){                	
                    $(".ca_j1").show();
                    $(".ca_j1").prop("disabled",false);
                }
                if(name=='홈/리빙'){
                    $(".ca_j2").show();
                    $(".ca_j2").prop("disabled",false);
                }
                if(name=='이벤트'){
                    $(".ca_j3").show();
                    $(".ca_j3").prop("disabled",false);
                }

                if(name=='비즈니스'){
                    $(".ca_j4").show();
                    $(".ca_j4").prop("disabled",false);
                }

                if(name=='디자인/개발'){
                    $(".ca_j5").show();
                    $(".ca_j5").prop("disabled",false);
                }

                if(name=='건강/미용'){
                    $(".ca_j6").show();
                    $(".ca_j6").prop("disabled",false);
                }

                if(name=='알바'){
                    $(".ca_j7").show();
                    $(".ca_j7").prop("disabled",false);
                }

                if(name=='기타'){
                    $(".ca_j8").show();
                    $(".ca_j8").prop("disabled",false);
                }
            })
        });    
    </script>
    <body>
        
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary  " id="sideNav">
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">판매자 전환 안내</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#experience">기본정보</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#education">추가정보 </a></li>
                
                    
                </ul>
            </div>
        </nav>
        <!-- Page Content-->
        <div class="container-fluid p-0">
            <!-- About-->
            <section class="resume-section" id="about">
                <div class="resume-section-content">
                    
                        <div class="s1">

                            <h3>판매자 전환</h3>

                        </div>
                    
                    <div class="s2 sellertop">

                        판매자 전환시 홍보성 글이나 무성의한 글은 전환이 거절될 수 있습니다.<br>
                        제공하는 서비스에 상응하는 적절한 가격이 아닐경우 전환요청이 거절될 수 있습니다. <br>
                        
                        
                    </div>
                    
                    
                    
                </div>
            </section>
            <hr class="m-0" />
            <!-- Experience-->
            <section class="resume-section" id="experience">
                <div class="resume-section-content">
                

                    
                    
                    <div class="d-flex flex-column flex-md-row justify-content-between mb-5">
                        <div class="flex-grow-1">
                            <div class="s1">
                                <h3 class="mb-0">기본정보등록</h3>
                            </div>
                           <form action="/sellerAsk.do" method="post" enctype="multipart/form-data">
                           <input type="text" name="saId" value=${sessionScope.m.memberId} style="display: none;">
                            <input type="file" id="saProfile" name="file" style="display: none;">
                            <div class="select_img"> <br><img class="profile" src="/resources/img/userPf.png" /></div>
                            <div class="cre"><pre>   *  프로필 사진 권장사이즈는 150 x 200 입니다.</pre></div>
                            <br><br>
                            <label for="saProfile" class="tit-img prow">프로필 등록</label><br>
                            <span class="cate">전문분야와 상세분야를 선택해주세요 </span><br>
                            <script>
                                $("#saProfile").change(function(){
                                 if(this.files && this.files[0]) {
                                  var reader = new FileReader;
                                  reader.onload = function(data) {
                                   $(".select_img img").attr("src", data.target.result);        
                                  }
                                  reader.readAsDataURL(this.files[0]);
                                 }
                                });
                               </script>   
                            <div class="input-group mb-3">

                                <div class="tit">
                                    카테고리
                                </div>
                                <select class="ti1-1 ca_d" name="saCategory">
                                    <option selected>카테고리를 선택해주세요</option>
                                    <option value="레슨">레슨</option>
                                    <option value="홈/리빙">홈/리빙</option>
                                    <option value="이벤트">이벤트</option>
                                    <option value="비즈니스">비즈니스</option>
                                    <option value="디자인/개발">디자인/개발</option>
                                    <option value="건강/미용">건강/미용</option>
                                    <option value="알바">알바</option>
                                    <option value="기타">기타</option>
                                    
                                  </select>

                                  <select class="ti1-2 ca_j1" id="lesson" name="saChildCategory">
                                    <option selected>2차 카테고리를 선택해주세요</option>
                                    <option value="보컬레슨">보컬레슨</option>
                                    <option value="기타레슨">기타레슨</option>
                                    <option value="수학과외">수학과외</option>
                                    <option value="영어과외">영어과외</option>
                                    <option value="PT">PT</option>
                                    <option value="골프레슨">골프레슨</option>
                                  </select>

                                  <select class="ti1-2 ca_j2" id="home" name="saChildCategory">
                                    <option selected>2차 카테고리를 선택해주세요</option>
                                    <option value="집인테리어">집인테리어</option>
                                    <option value="조명인테리어">조명인테리어</option>
                                    <option value="타일시공">타일시공</option>
                                    <option value="도배장판시공">도배장판시공</option>
                                    <option value="해충방역">해충방역</option>
                                    <option value="세탁기청소">세탁기청소</option>
                                    
                                  </select>

                                  <select class="ti1-2 ca_j3" id="event" name="saChildCategory">
                                    <option selected>2차 카테고리를 선택해주세요</option>
                                    <option value="결혼식사회">결혼식사회</option>
                                    <option value="댄스공연">댄스공연</option>
                                    <option value="행사MC">행사MC</option>
                                    <option value="파티기획">파티기획</option>
                                    <option value="영상편집">영상편집</option>
                                    <option value="의상대여">의상대여</option>
                                  </select>

                                <select class="ti1-2 ca_j4" id="business" name="saChildCategory">
                                    <option selected>2차 카테고리를 선택해주세요</option>
                                    <option value="회계/세무">회계/세무</option>
                                    <option value="영상광고">영상광고</option>
                                    <option value="출판">출판</option>
                                    <option value="나레이션/더빙">나레이션/더빙</option>
                                    <option value="블로그마케팅">블로그마케팅</option>
                                    <option value="현수막제작">현수막제작</option>
                                </select>
                                <select class="ti1-2 ca_j5" id="design" name="saChildCategory">
                                    <option selected>2차 카테고리를 선택해주세요</option>
                                    <option value="제품디자인">제품디자인</option>
                                    <option value="프레젠테이션디자인">프레젠테이션디자인</option>
                                    <option value="일러스트디자인">일러스트디자인</option>
                                    <option value="로고디자인">로고디자인</option>
                                    <option value="라벨디자인">라벨디자인</option>
                                    <option value="간판디자인">간판디자인</option>
                                </select>
                                <select class="ti1-2 ca_j6" id="health" name="saChildCategory">
                                    <option selected>2차 카테고리를 선택해주세요</option>
                                    <option value="심리검사">심리검사</option>
                                    <option value="언어치료">언어치료</option>
                                    <option value="연극치료">연극치료</option>
                                    <option value="독서치료">독서치료</option>
                                    <option value="네일">네일</option>
                                    <option value="피부관리">피부관리</option>
                                </select>
                                <select class="ti1-2 ca_j7" id="parttime" name="saChildCategory">
                                    <option selected>2차 카테고리를 선택해주세요</option>
                                    <option value="편의점알바">편의점알바</option>
                                    <option value="배달알바">배달알바</option>
                                    <option value="포장알바">포장알바</option>
                                    <option value="사무보조알바">사무보조알바</option>
                                    <option value="서빙알바">서빙알바</option>
                                    <option value="행사스텝">행사스텝</option>
                                </select>
                                <select class="ti1-2 ca_j8" id="etc" name="saChildCategory">
                                    <option selected>2차 카테고리를 선택해주세요</option>
                                    <option value="맞춤옷제작">맞춤옷제작</option>
                                    <option value="패키지여행">패키지여행</option>
                                    <option value="재무설계">재무설계</option>
                                    <option value="커스텀제작">커스텀제작</option>
                                    <option value="이모티콘제작">이모티콘제작</option>
                                    <option value="악기조율">악기조율</option>
                                </select> 
                            </div>
                                <span class="cate">자기소개를 작성해주세요</span><br>
                                <textarea class="sellerA" placeholder="본인의 능력을 잘 나타내는 자기소개를 작성해주세요" name="saIntrod"></textarea>
                                
                                <div class="inputArea">
                                    
                                   

                                
                                
                    </div>
                    
                </div>
            </section>
            <hr class="m-0" />
            <!-- Education-->
            <section class="resume-section" id="education">
                <div class="resume-section-content">
                    
                    
                        <div class="s1">
                            <h3>추가정보 등록</h3>
                        </div>
                        <span class="cate">학력 전공을 작성해주세요</span><br>
                        <input type="text" class="tesch" placeholder="학교명 (ex kh정보대학교)" name="saCollege" >
                        <input type="text" class="tesch2" placeholder="전공 (ex 컴퓨터공학과)" name="saMajor">
                        <select class="tesch3" name="saState">
                            <option value="" disabled selected hidden>상태</option>
                            <option>재학</option>
                            <option>휴학</option>
                            <option>이수</option>
                            <option>졸업</option>
                        </select>
                        <br>
                        <span class="cate">보유한 자격증을 작성해주세요</span><br>
                        <input type="text" class="tesch" placeholder="자격증명 (ex 전산회계2급)" name="saLicense"><br>
                        <input type="text" class="tesch3" placeholder="발급일 (ex yyyy-mm-dd)" name="saLcDate">
                        <input type="text" class="tesch2" placeholder="발급기관 (ex 한국세무사회)" name="saLcOrg">
                        <div class="sdr">
                            <input type="submit" value="등록하기" class="btn btn-outline-success">
                            <a href="#" class="btn btn-outline-success">취소하기</a>
                        </div>
						</form>
                       
                </div>


            </section>
            <hr class="m-0" />
            
        </div>
    
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>

</body>
</html>