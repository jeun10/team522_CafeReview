<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>카페 리스트</title>
	<!-- Bootstrap icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<link href="../../resources/css/styles.css" rel="stylesheet" />
	<link href="../../resources/css/custom.css" rel="stylesheet" />
	<link href="../../resources/css/customList.css" rel="stylesheet" />
	<link href="../../resources/css/customList_2.css" rel="stylesheet" />    
	<link href="../../resources/css/sidebars.css" rel="stylesheet" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
					integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
					integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />							 
	<style>
	.btn-outline-dark:hover {
		background-color: #442f1e !important;
		color: #fff !important;
	} 
	</style>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cbeb53fc639beafda1dfcf096df608fc&libraries=services"></script>

</head>

<body>
<!-- 맨위 로그인창 -->
	<header class="container ">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
	    		<a class="navbar-brand" href="/"><img src="../../resources/img/logo2.png" class="img-fluid" alt="logo" height="70" width="120"></a>
	    		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      			<span class="navbar-toggler-icon"></span>
	   			</button>
	   			<div class="collapse navbar-collapse " id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				    <c:choose>
				     <c:when test="${not empty sessionScope.userInfo}">
				        <li class="nav-item">
				          <a class="nav-link" href="/MyPage/MyPageReivew">마이페이지</a>
				        </li>
			          	<li class="nav-item">
				          <a class="nav-link active" aria-current="page" href="/user_login/logout">로그아웃</a>
				        </li>
				    </c:when>
				    <c:otherwise>
				    <li class="nav-item">
				    	<a class="nav-link active" aria-current="page" href="/user_login/login">로그인</a>
			    	</li>
			        <li class="nav-item">
			          <a class="nav-link" href="/user_login/join">회원가입</a>
			        </li>
				    </c:otherwise>
				    </c:choose>
				    <li class="nav-item dropdown">
				    	<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
	          		<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			            <li><a class="dropdown-item" href="/community/list?pageNum=1&amount=5&type=G&keyword=1-DAY-CLASS">1-DAY-CLASS</a></li>
			            <li><a class="dropdown-item" href="/community/list?pageNum=1&amount=5&type=G&keyword=카페 탐방">카페 탐방</a></li>
			            <li><a class="dropdown-item" href="/community/list?pageNum=1&amount=5&type=G&keyword=봉사 활동">봉사 활동</a></li>
			            <li><a class="dropdown-item" href="/community/list?pageNum=1&amount=5&type=G&keyword=나눔 카페">나눔 카페</a></li>
			            </ul>
			       </li>
	      		</ul>
	
		    </div>
		  </div>
		</nav>
	</header>
	<!-- 소개 배너 -->
		<header class=" py-3" style="background-color: #D4BDA5; ">
		  <div class="container px-3 px-lg-3 my-3">
			<img src="../../resources/assets/banner.png" class="img-fluid" alt="logo" style="display: block; margin: -50px auto 0; height: 300px;"/>
			<div class="d-flex w-50 p-2 px-4" style="display: block; margin: -30px auto; height: 65px;">
		    <input class="form-control me-2 input-lg" type="text" id="CafeName" name="Search" placeholder="리뷰할 카페의 이름 이나 지역을 검색하세요" value="">
		    <button class="btn btn-outline-dark" id="search" type="submit" style="border: 1.3px solid #774c2a; color: #56361d;">Search</button>
			</div>
		  </div>
		</header>

  <div class="d-flex w-50 p-2 " style="display: block; margin: 0 auto;">
</div>
<div class="d-flex justify-content-center align-items-center h-100">
  <div class="col-lg-9 mt-4 mt-lg-0">
    <div class="row justify-content-center">
      <div class="col-md-12 mt-4">
        <div class="user-dashboard-info-box mb-4 bg-white p-4 shadow-sm" style="min-height: calc(100vh - 100px); max-width: 700px; margin: 0 auto;">
          <div class="" id="results" style="height: calc(100% - 40px);">
          </div>
         
          <div style="height: 40px;">
            <div class="pagination justify-content-center mb-0">
           
              <div id="pagination" style= "margin: 0 auto;">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

  <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
  <script src="../../resources/js/AjaxList.js"></script>
  	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
	
  <!-- Footer-->
	<footer class="py-5 bg-light">
		<div class="container">
      		<p class="m-0 text-center" style="color: #442f1e;"><strong>Copyright &copy;Project Team 522</strong></p>
		</div>
	</footer>
</body>



</html>