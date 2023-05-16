<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인 화면</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="../../resources/css/styles.css" rel="stylesheet" />
        <link href="../../resources/css/custom.css" rel="stylesheet" />
        <link href="../../resources/css/customList.css" rel="stylesheet" />
        <link href="../../resources/css/sidebars.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
								integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
								crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

   <style>
    .btn-outline-dark:hover {
  background-color: #442f1e !important;
  color: #fff !important;
} 
.btn.btn-danger {
  background-color: #d4bda5 !important;
}
.btn.btn-danger:hover {
 background-color: #af9b87 !important;

}
    
    </style>

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
				          <a class="nav-link" href="MyPage/MyPageReivew">마이페이지</a>
				        </li>
			          	<li class="nav-item">
				          <a class="nav-link active" aria-current="page" href="logout">로그아웃</a>
				        </li>
				    </c:when>
				    <c:otherwise>
				    <li class="nav-item">
				    	<a class="nav-link active" aria-current="page" href="/">로그인</a>
			    	</li>
			        <li class="nav-item">
			          <a class="nav-link" href="join">회원가입</a>
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
			<form action="/Search" method="get" class="d-flex w-50 p-2 px-4" style="display: block; margin: -30px auto; height: 65px;">
			    <input class="form-control me-2" type="search" id="Search" name="Search" placeholder="카페 리뷰 검색" aria-label="조회할 카페 검색" value="">
			    <button class="btn btn-outline-dark" type="submit" style="border: 1.3px solid #774c2a; color: #56361d;">Search</button>
			</form>
		  </div>
		</header>

<div class="container" style="margin-top:100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6"  style="min-height: calc(100vh - 100px); max-width: 700px; margin: 0 auto;">
				<div class="card shadow">
					<div class="card-body">
	
						<form action="login_pro" method="post">
					    <div class="form-group">
					        <label for="user_id">아이디</label>
					        <input type="text" id="user_id" name="user_id" class="form-control" required="ID를 입력해주세요">
					    </div>
					    <div class="form-group">
					        <label for="user_pw">비밀번호</label>
					        <input type="password" id="user_pw" name="user_pw" class="form-control" required="비밀번호를 입력해주세요">
					    </div>
					    <div class="form-group text-right">
					        <button type="submit" class="btn btn-outline-dark" style="border: 1.3px solid #774c2a; color: #56361d;" >로그인</button>
					        <a href="join" class="btn btn-danger" style="border: 1.3px solid #774c2a; color: #56361d;">회원가입</a>
					    </div>
					</form>
					
					<% if (request.getAttribute("error") != null) { %>
				    <script>
				        alert("<%= request.getAttribute("error") %>");
				    </script>
				
				<% } %>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
	<!-- Footer-->
	<footer class="py-5 bg-light">
		<div class="container">
      <p class="m-0 text-center" style="color: #442f1e;"><strong>Copyright &copy;Project Team 522</strong></p>
		</div>
	</footer>
</body>
</html>








    