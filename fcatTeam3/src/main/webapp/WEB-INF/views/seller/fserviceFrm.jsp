<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서비스 등록</title>
 		<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/styles.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>	    
        
<script src="/resources/summernote/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
</head>
<style>
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
        
        .ti1-2{
           
          position: relative;
           left: 30px;
            width: 30%;
            border: 1px solid rgb(153, 151, 151);
            border-radius: 2px;
            padding-left: 30px;
            display: none;
        }
.file_input label {
    position:relative;
    cursor:pointer;
    display:inline-block;
    vertical-align:middle;
    overflow:hidden;
    width:110px;
    height:40px;
    background:white;
    border: 1px solid rgb(153, 151, 151);
    border-radius: 2px;   
    text-align:center;
    line-height:40px;
    color : black;
}
.file_input label input {
    position:absolute;
    width:0;
    height:0;
    overflow:hidden;
}
.tipm{
padding-top : 30px;
padding-bottom: 30px;
line-height: 40px;
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
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">서비스 등록 안내</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#experience">기본정보</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#education">서비스 설명</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#imginsert">작업물 등록</a></li>
                
                    
                </ul>
            </div>
        </nav>
        <!-- Page Content-->
        <div class="container-fluid p-0">
            <!-- About-->
            <section class="resume-section" id="about">
                <div class="resume-section-content">
                    
                        <div class="s1">

                            <h3>서비스 등록</h3>
                            
                        </div>
                    
                    <div class="s2">
                        서비스판매시  홍보성 글이나 무성의한 글은 승인이 거절될 수 있습니다.<br>
                        제공하는 서비스에 상응하는 적절한 가격이 아닐경우 승인이 거절될 수 있습니다. <br>
                        연락처, 이메일 등 개인정보가 포함된 글이 게시될 경우, 사이트 관리자에 의하여 임의로 삭제될 수 있습니다.
                        
                    </div>
                    <div>
                        <table class="t1">
                            <tr>
                                <td colspan="3" class="t1-1">서비스 등록 <span style="color: rgb(196, 189, 255); font-weight: bolder;">tip</span></td>
                            </tr>
                            <tr>
                                <td class="t1-2">
                                    이미지 등록<br>
                                    <p class="tp1">텍스트가 없는 깔끔한 이미지로 등록할 수 록 클릭률이 높으며,<br>
                                    메인페이지에 노출되는 추천재능 리스트에 선정되기 쉽습니다.</p>

                                </td>
                                <td class="t1-2">서비스 설명
                                    <p class="tp1">텍스트가 없는 깔끔한 이미지로 등록할 수 록 클릭률이 높으며,<br>
                                        메인페이지에 노출되는 추천재능 리스트에 선정되기 쉽습니다.</p>
                                </td>
                                <td class="t1-2">추가 서비스 자료
                                    <p class="tp1">텍스트가 없는 깔끔한 이미지로 등록할 수 록 클릭률이 높으며,<br>
                                        메인페이지에 노출되는 추천재능 리스트에 선정되기 쉽습니다.</p>
                                </td>
                            </tr>
                        </table>
                    </div>
                    
                    
                </div>
            </section>
            <hr class="m-0" />
            <!-- Experience-->
            <form action="/fservice.do" method="post" enctype="multipart/form-data">
             <input type="text" name="fsWriter" value=${sessionScope.m.memberId} style="display: none;">
            
            <section class="resume-section" id="experience">
                <div class="resume-section-content">
                    
                    <div class="d-flex flex-column flex-md-row justify-content-between mb-5">
                        <div class="flex-grow-1">
                            <div class="s1">
                                <h3 class="mb-0">기본정보등록</h3>
                            </div>
                            <div class="input-group mb-3">
                                <div class="tit">
                                    제목
                                </div>
                                <input type="text" name="fsTitle" class="ti1" placeholder="나만의 특색있는 서비스의 제목을 등록해주세요" >
                            </div>
                            <div class="input-group mb-3">
                                <div class="tit">
                                    카테고리
                                </div>
                                <select class="ti1-1 ca_d" name="fsCategory">
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

                                  <select class="ti1-2 ca_j1" id="lesson" name="fsChildCategory">
                                    <option selected>2차 카테고리를 선택해주세요</option>
                                    <option value="보컬레슨">보컬레슨</option>
                                    <option value="기타레슨">기타레슨</option>
                                    <option value="수학과외">수학과외</option>
                                    <option value="영어과외">영어과외</option>
                                    <option value="PT">PT</option>
                                    <option value="골프레슨">골프레슨</option>
                                  </select>

                                  <select class="ti1-2 ca_j2" id="home" name="fsChildCategory">
                                    <option selected>2차 카테고리를 선택해주세요</option>
                                    <option value="집인테리어">집인테리어</option>
                                    <option value="조명인테리어">조명인테리어</option>
                                    <option value="타일시공">타일시공</option>
                                    <option value="도배장판시공">도배장판시공</option>
                                    <option value="해충방역">해충방역</option>
                                    <option value="세탁기청소">세탁기청소</option>
                                    
                                  </select>

                                  <select class="ti1-2 ca_j3" id="event" name="fsChildCategory">
                                    <option selected>2차 카테고리를 선택해주세요</option>
                                    <option value="결혼식사회">결혼식사회</option>
                                    <option value="댄스공연">댄스공연</option>
                                    <option value="행사MC">행사MC</option>
                                    <option value="파티기획">파티기획</option>
                                    <option value="영상편집">영상편집</option>
                                    <option value="의상대여">의상대여</option>
                                  </select>

                                <select class="ti1-2 ca_j4" id="business" name="fsChildCategory">
                                    <option selected>2차 카테고리를 선택해주세요</option>
                                    <option value="회계/세무">회계/세무</option>
                                    <option value="영상광고">영상광고</option>
                                    <option value="출판">출판</option>
                                    <option value="나레이션/더빙">나레이션/더빙</option>
                                    <option value="블로그마케팅">블로그마케팅</option>
                                    <option value="현수막제작">현수막제작</option>
                                </select>
                                <select class="ti1-2 ca_j5" id="design" name="fsChildCategory">
                                    <option selected>2차 카테고리를 선택해주세요</option>
                                    <option value="제품디자인">제품디자인</option>
                                    <option value="프레젠테이션디자인">프레젠테이션디자인</option>
                                    <option value="일러스트디자인">일러스트디자인</option>
                                    <option value="로고디자인">로고디자인</option>
                                    <option value="라벨디자인">라벨디자인</option>
                                    <option value="간판디자인">간판디자인</option>
                                </select>
                                <select class="ti1-2 ca_j6" id="health" name="fsChildCategory">
                                    <option selected>2차 카테고리를 선택해주세요</option>
                                    <option value="심리검사">심리검사</option>
                                    <option value="언어치료">언어치료</option>
                                    <option value="연극치료">연극치료</option>
                                    <option value="독서치료">독서치료</option>
                                    <option value="네일">네일</option>
                                    <option value="피부관리">피부관리</option>
                                </select>
                                <select class="ti1-2 ca_j7" id="parttime" name="fsChildCategory">
                                    <option selected>2차 카테고리를 선택해주세요</option>
                                    <option value="편의점알바">편의점알바</option>
                                    <option value="배달알바">배달알바</option>
                                    <option value="포장알바">포장알바</option>
                                    <option value="사무보조알바">사무보조알바</option>
                                    <option value="서빙알바">서빙알바</option>
                                    <option value="행사스텝">행사스텝</option>
                                </select>
                                <select class="ti1-2 ca_j8" id="etc" name="fsChildCategory">
                                    <option selected>2차 카테고리를 선택해주세요</option>
                                    <option value="맞춤옷제작">맞춤옷제작</option>
                                    <option value="패키지여행">패키지여행</option>
                                    <option value="재무설계">재무설계</option>
                                    <option value="커스텀제작">커스텀제작</option>
                                    <option value="이모티콘제작">이모티콘제작</option>
                                    <option value="악기조율">악기조율</option>
                                </select> 
                            </div>
                           
                            
                                <table class="t3">       
                                    <tr>
                                        <td>
                                            <div class="tit-1" >
                                                작업기간
                                            </div>
                                            <div>
                                            <input type="text" class="ti2" name="fsWorking"> 일
                                            </div>
        
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="tit-1" >
                                                가격
                                            </div>
                                            <div>
                                            <input type="text" class="ti2" name="fsPrice"> 원
                                            </div>
                                            
                                        </td>
                                    </tr>
                                </table>
                                
                                <div class="file_input">
    <label>
        썸네일 첨부
        <input type="file" name="file" id="fsPhoto" onchange="javascript:document.getElementById('file_route').value=this.value"><br><br>
    </label>
    



                                
     <!--                             <label>
                                 <input type="file" name="fsPhoto" id="fsPhoto"/>
                                 </label> -->
                                    <div class="select_i"><br> <br><img src="" /></div>
                                    </div>
                                <script>
                                    $("#fsPhoto").change(function(){
                                     if(this.files && this.files[0]) {
                                      var reader = new FileReader;
                                      reader.onload = function(data) {
                                       $(".select_i img").attr("src", data.target.result).width(500);        
                                      }
                                      reader.readAsDataURL(this.files[0]);
                                     }
                                    });
                                   </script> 
                                   
                          
                                 

                                 
                                 

                                
                                
                            
                    </div>
                    </div>
                </div>
            </section>
            <hr class="m-0" />
            <!-- Education-->
            <section class="resume-section" id="education">
                <div class="resume-section-content">
                    
                    
                        <div class="s1">
                            <h3>서비스 설명</h3>
                        </div>
                        <table class="t1">
                            <tr>
                                <td colspan="3" class="t1-1"><textarea class="ta1" placeholder="*카테고리에 적합한 서비스가 아닐경우 검수과정 통과하지 못할수 있습니다." name="fsContent"></textarea></td>
                            </tr>
                            <tr>
                                <td class="t1-2">
                                    아래에 해당사항이 있을경우 필수로 작성 부탁드립니다.<br>
                                    <p class="tp1">초상권의 경우 해당 개인 혹은 기업과 협의되어 상업적으로 이용가능합니다.</p>

                                </td>
                                
                            </tr>
                           
                        </table>
                        
                </div>
            </section>
            
            <hr class="m-0" />
            <section class="resume-section" id="imginsert">
                <div class="resume-section-content">
                    
                        <div class="s1">

                            <h3>작업물 등록</h3>
                            
                        </div>
                    
                    <div class="s2">
                      
                        
                    </div>
                    <div>
                        <table class="t1">
                            <tr>
                                <td colspan="3" class="t1-1">이미지 등록 <span style="color: rgb(196, 189, 255); font-weight: bolder;">tip</span></td>
                            </tr>
                            <tr>
                                <td class="t1-2 tipm" colspan="3">
                                  
• 개인 연락처 혹은 홍보 이미지는 등록하실 수 없습니다.<br>
• 상업적인 이용 및 허가에 대한 부분을 확인하시어 등록해주시기 바랍니다.<br>
• 무단/부정한 이용으로 제3자의 권리를 침해하는 동영상은 등록할 수 없습니다.<br>
• 선명한 고해상도의 사진을 올려 구매자들의 시선을 사로잡아보세요.<br>

                                </td>
                                
                            </tr>
                            
                           
                            
                        </table>
                    </div>
                    
                    <br><br>
                    <textarea id="summernote" class="form-control" rows="5" name="fsDescriptionText" ></textarea>
                    
                    
                </div>
           
            
                
            </section>
            
            
            
        </div>
        
         <div class="sdr">
                            <input type="submit" value="등록하기" class="btn btn-outline-danger">
                            <a href="#" class="btn btn-outline-danger">취소하기</a>
                        </div>    
                        
                        </form>
                        
                        <br><br><br>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
    </body>
    <script>
//여기 아래 부분 
 $(function(){
      
   
   $("#summernote").summernote({
       height: 500, // editor height
         focus: true, // set focus editable area
         lang: "ko-KR", // 한글설정
         placeholder: "내용을 입력하세요.",
         callbacks: {
           // 이미지 첨부 시
           onImageUpload: function (files) {
             // 다중 업로드 처리
             for (var i = 0; i < files.length; i++) {
               uploadImage(files[i], this);
             }
           }
         }
       });
   });
       // 이미지 업로드
       function uploadImage(file, editor) {
        console.log(file)
         var formData = new FormData();
         formData.append("file", file);
         $.ajax({
           data: formData,
           type: "POST",
           url: "/uploadImage.do",
           enctype: 'multipart/form-data',
           cache: false,
           contentType: false,
           processData: false,
           success: function (data) {
             console.log(data);
             // 파일 네임 전송용
             $("[name=filename]").val(data);
             // 이미지 경로 설정
             data = "/resources/upload/notice/" + data;
             // 이미지 미리보기
             $(editor).summernote('insertImage', data);
           }
         });
       }

     



//$('#summernote').summernote({
	//  height: 300,                 // 에디터 높이
	 // minHeight: null,             // 최소 높이
	//  maxHeight: null,             // 최대 높이
	//  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	//  lang: "ko-KR",					// 한글 설정
	//  placeholder : "내용 입력",
//});

</script>
</html>