<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
    />
      <link rel="stylesheet" href="/resources/css/search.css" /> 
</head>
<body>
<%@include file="/WEB-INF/views/common/headerBootstrap5.jsp" %>
	<div class="route-wrap">
      <div class="route">
        <span>a>b</span>
      </div>
    </div>
    <div class="content-wrap">
      <div class="categori-wrap">
        <div class="categori-title">
          <h4>추천 카테고리</h4>
          <hr />
          <div class="accordion" id="accordionPanelsStayOpenExample">
            <div class="accordion-item">
              <div class="accordion-header" id="panelsStayOpen-headingOne">
                <button
                  class="accordion-button"
                  type="button"
                  data-bs-toggle="collapse"
                  data-bs-target="#panelsStayOpen-collapseOne"
                  aria-expanded="true"
                  aria-controls="panelsStayOpen-collapseOne"
                >
                  IT/프로그래밍
                  <div class="badge rounded-pill bg-primary" id="badge">14</div>
                </button>
              </div>
              <div
                id="panelsStayOpen-collapseOne"
                class="accordion-collapse collapse show"
                aria-labelledby="panelsStayOpen-headingOne"
              >
                <div class="accordion-body">
                  <strong>This is the first item's accordion body.</strong>
                </div>
              </div>
            </div>
            <div class="accordion-item">
              <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                <button
                  class="accordion-button collapsed"
                  type="button"
                  data-bs-toggle="collapse"
                  data-bs-target="#panelsStayOpen-collapseTwo"
                  aria-expanded="false"
                  aria-controls="panelsStayOpen-collapseTwo"
                >
                  Accordion Item #2
                </button>
              </h2>
              <div
                id="panelsStayOpen-collapseTwo"
                class="accordion-collapse collapse"
                aria-labelledby="panelsStayOpen-headingTwo"
              >
                <div class="accordion-body">
                  <strong>This is the second item's accordion body.</strong> It
                  is hidden by default, until the collapse plugin adds the
                </div>
              </div>
            </div>
            <div class="accordion-item">
              <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                <button
                  class="accordion-button collapsed"
                  type="button"
                  data-bs-toggle="collapse"
                  data-bs-target="#panelsStayOpen-collapseThree"
                  aria-expanded="false"
                  aria-controls="panelsStayOpen-collapseThree"
                >
                  Accordion Item #3
                </button>
              </h2>
              <div
                id="panelsStayOpen-collapseThree"
                class="accordion-collapse collapse"
                aria-labelledby="panelsStayOpen-headingThree"
              >
                <div class="accordion-body">
                  <strong>This is the third item's accordion body.</strong> It
                  is hidden by default, until the collapse plugin adds the
                </div>
              </div>
            </div>
          </div>
        </div>

        <!--  -->
      </div>
      <div class="searchList-wrap">
        <div class="searchRow">
          <div class="searchItem">
            <div class="box-shadow">
              <div class="photo">
                <img src="dog.jpg" class="img-fluid img-thumbnail" alt="..." />
              </div>
              <span>판매자명</span>
              <div class="icon-wrap">
                <i class="bi bi-star-fill" id="star"></i>
                <button type="button" id="heart" class="btn btn-outline-danger">
                  <i class="bi bi-heart"></i>
                </button>
              </div>
              <div class="serviceTitle">
                <h5>ㅎㅇdd</h5>
              </div>
              <div class="serviceComment">상세</div>
              <div class="price">10,000</div>
            </div>
          </div>
          <div class="searchItem">
            <div class="box-shadow">
              <div class="photo">
                <img src="dog.jpg" class="img-fluid img-thumbnail" alt="..." />
              </div>
              <span>판매자명</span>
              <div class="icon-wrap">
                <i class="bi bi-star-fill" id="star"></i>
                <i class="bi bi-heart"></i>
              </div>
              <div class="serviceTitle">
                <h5>ㅎㅇ</h5>
              </div>
              <div class="serviceComment">상세</div>
              <div class="price">10,000</div>
            </div>
          </div>
          <div class="searchItem">
            <div class="box-shadow">
              <div class="photo">
                <img src="dog.jpg" class="img-fluid img-thumbnail" alt="..." />
              </div>
              <span>판매자명</span>
              <div class="icon-wrap">
                <i class="bi bi-star-fill" id="star"></i>
                <i class="bi bi-heart"></i>
              </div>
              <div class="serviceTitle">
                <h5>ㅎㅇ</h5>
              </div>
              <div class="serviceComment">상세</div>
              <div class="price">10,000</div>
            </div>
          </div>
          <div class="searchItem">
            <div class="box-shadow">
              <div class="photo">
                <img src="dog.jpg" class="img-fluid img-thumbnail" alt="..." />
              </div>
              <span>판매자명</span>
              <div class="icon-wrap">
                <i class="bi bi-star-fill" id="star"></i>
                <i class="bi bi-heart"></i>
              </div>
              <div class="serviceTitle">
                <h5>ㅎㅇ</h5>
              </div>
              <div class="serviceComment">상세</div>
              <div class="price">10,000</div>
            </div>
          </div>
        </div>
        <hr />
      </div>
    </div>
</body>

  
</html>