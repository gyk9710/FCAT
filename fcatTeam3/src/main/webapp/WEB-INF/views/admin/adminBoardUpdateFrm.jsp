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
	    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <script src="/resources/js/adminscript.js"></script>
<script src="/resources/summernote/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
<title>index</title>
</head>
<body>
<%@include file="/WEB-INF/views/admin/adminSide.jsp" %>
    <section>
      <div class="container-fluid">
        <div class="row mb-5">
          <div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
            <div class="row">
              <div class="col-12">
                <br><br><br>
                <h1 class="text-muted text-center mb-3">고객센터</h1>
                
 	<form action="/adminBoardUpdate.do" method="post">
	<input type="hidden" name="boardNo" value="${board.boardNo }">
		<div class="form-group">
				<select class="selectform" name="boardClass">
					<option selected disabled>-분류-</option>
					<option value="0">FAQ</option>
					<option value="1">공지사항</option>
				</select>
			<input type="text" class="titleform" placeholder="제목" name="boardTitle" value="${board.boardTitle }"required>
		</div>
	<br><br>
		<div class="form-group">
			<label for="content"></label>
			<textarea id="summernote" class="form-control" rows="5" name="boardContent" required>${board.boardContent }</textarea>
		</div>
	
		<button type="submit" class="btn btn-info float-right">수정하기</button>
	</form>
              </div>
            </div>
          </div>
        </div>
      </div>  
    </section>
<script>
//여기 아래 부분
$('#summernote').summernote({
	  height: 300,                 // 에디터 높이
	  minHeight: null,             // 최소 높이
	  maxHeight: null,             // 최대 높이
	  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	  lang: "ko-KR",					// 한글 설정
	  placeholder : "내용 입력",
});

</script>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    -->
</body>
</html>