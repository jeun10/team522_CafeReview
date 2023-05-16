<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>home</title>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="./resources/css/styles.css" rel="stylesheet" />
        <link href="./resources/css/custom.css" rel="stylesheet" />
        <link href="./resources/css/sidebars.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
								integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
								crossorigin="anonymous">
    </head>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cbeb53fc639beafda1dfcf096df608fc&libraries=services"></script>
    
<style>
	.pagination {
	    height: 36px;
	    margin: 18px 0;
	    color: #442f1e;
	}
	
	.pagination ul {
	    display: inline-block;
	    *display: inline;
	    /* IE7 inline-block hack */
	    *zoom: 1;
	    margin-left: 0;
	    color: #ffffff;
	    margin-bottom: 0;
	    -webkit-border-radius: 3px;
	    -moz-border-radius: 3px;
	    border-radius: 3px;
	    -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
	    -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
	    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
	}
	
	.pagination li {
	    display: inline;
	    color: #442f1e;
	}
	
	.pagination a {
	    float: left;
	    padding: 0 14px;
	    line-height: 34px;
	    color: #442f1e;
	    text-decoration: none;
	    border: 1px solid #ddd;
	    border-left-width: 0;
	}
	
	.pagination a:hover,
	.pagination .active a {
	    background-color: #442f1e;
	    color: #ffffff;
	}
	
	.pagination a:focus {
	    background-color: #442f1e;
	    color: #ffffff;
	}
	
	
	.pagination .active a {
	    color: #ffffff;
	    cursor: default;
	}
	
	.pagination .disabled span,
	.pagination .disabled a,
	.pagination .disabled a:hover {
	    color: #999999;
	    background-color: transparent;
	    cursor: default;
	}
	
	.pagination li:first-child a {
	    border-left-width: 1px;
	    -webkit-border-radius: 3px 0 0 3px;
	    -moz-border-radius: 3px 0 0 3px;
	    border-radius: 3px 0 0 3px;
	}
	
	.pagination li:last-child a {
	    -webkit-border-radius: 0 3px 3px 0;
	    -moz-border-radius: 0 3px 3px 0;
	    border-radius: 0 3px 3px 0;
	}
	
	.pagination-centered {
	    text-align: center;
	}
	
	.pagination-right {
	    text-align: right;
	}
	
	.pager {
	    margin-left: 0;
	    margin-bottom: 18px;
	    list-style: none;
	    text-align: center;
	    color: #363636;
	    *zoom: 1;
	}
	
	.pager:before,
	.pager:after {
	    display: table;
	    content: "";
	}
	
	.pager:after {
	    clear: both;
	}
	
	.pager li {
	    display: inline;
	    color: #363636;
	}
	
	.pager a {
	    display: inline-block;
	    padding: 5px 14px;
	    color: #363636;
	    background-color: #fff;
	    border: 1px solid #ddd;
	    -webkit-border-radius: 15px;
	    -moz-border-radius: 15px;
	    border-radius: 15px;
	}
	
	.pager a:hover {
	    text-decoration: none;
	    background-color: #f5f5f5;
	}
	
	.pager .next a {
	    float: right;
	}
</style>   
    
    
<style>
	.btn-outline-dark:hover {
	  background-color: #442f1e !important;
	  color: #fff !important;
	}
    
</style>

<script type="text/javascript">
function clearAllFilters() {
	  // 내부 시설 필터 해제
	  var checkboxes = document.getElementsByName("SelectTag3");
	  checkboxes.forEach(function(checkbox) {
	    checkbox.checked = false;
	  });
	  
	  // 주변환경 필터 해제
	  checkboxes = document.getElementsByName("SelectTag1");
	  checkboxes.forEach(function(checkbox) {
	    checkbox.checked = false;
	  });
	  
	  // 분위기 필터 해제
	  document.getElementById("quietCheckbox").checked = false;
	  document.getElementById("calmCheckbox").checked = false;
	  document.getElementById("livelyCheckbox").checked = false;
	  document.getElementById("emotionalCheckbox").checked = false;
	  document.getElementById("loudCheckbox").checked = false;
	}


</script>

<body class="bg-light">
	<!-- 맨위 로그인창 -->
	<header class="container ">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
	    		<a class="navbar-brand" href="/"><img src="./resources/img/logo2.png" class="img-fluid" alt="logo" height="70" width="120"></a>
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
				          <a class="nav-link active" aria-current="page" href="user_login/logout">로그아웃</a>
				        </li>
				    </c:when>
				    <c:otherwise>
				    <li class="nav-item">
				    	<a class="nav-link active" aria-current="page" href="user_login/login">로그인</a>
			    	</li>
			        <li class="nav-item">
			          <a class="nav-link" href="user_login/join">회원가입</a>
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
			<img src="./resources/assets/banner.png" class="img-fluid" alt="logo" style="display: block; margin: -50px auto 0; height: 300px;"/>
			<form action="/Search" method="get" class="d-flex w-50 p-2 px-4" style="display: block; margin: -30px auto; height: 65px;">
			    <input class="form-control me-2" type="search" id="Search" name="Search" placeholder="카페 리뷰 검색" aria-label="조회할 카페 검색" value="">
			    <button class="btn btn-outline-dark" type="submit" style="border: 1.3px solid #774c2a; color: #56361d;">Search</button>
			</form>
		  </div>
		</header>
	<!-- 필터 열기  -->
	<div class="flex-shrink-0 px-5 py-3">
		<c:choose>
			<c:when test="${not empty sessionScope.userInfo}">
				<a class="btn btn-outline-dark btn-sm" href='review/listReview' style="border: 1.3px solid #774c2a; color: #56361d;">리뷰 작성</a>
			</c:when>
			 <c:otherwise>					
			 <span class="  btn-sm" id='sidebarTogglde' style="opacity: 0;">필터 열d기</span>
			 </c:otherwise>		
 		</c:choose>
 			<button class="btn btn-outline-dark btn-sm" id='sidebarToggle' style="border: 1.3px solid #774c2a; color: #56361d;">필터 열기</button> <br/>
	</div>
	
	<!-- 컨텐츠 영역  -->
	<div class="d-flex" id='wrapper'>
	<!-- 필터  -->
	<form action="Filter" method="get">
		<div class="border-end bg-white" id='sidebar-wrapper'>
		  <div class="list-group list-group-flush">
		    <div class="flex-shrink-0 p-5 " style="width: 270px; height: 50px;">
		      <span class="d-flex align-items-center pb-3 mb-3 link-body-emphasis">&nbsp;&nbsp;
				<img src="./resources/img/coffeeicon1.png" class="bi pe-none me-2 mb-1" width="40" height="40"/>	
		        &nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-outline-dark btn-sm" type="submit" style="border: 1.3px solid #774c2a; color: #56361d;">필터 적용</button>
		      </span>
					 <ul class="list-unstyled ps-0">
					 <c:set var="studyChecked" value="false" />
					 <c:set var="meetingChecked" value="false" />
					 <c:set var="hobbyChecked" value="false" />
					 <c:set var="communityChecked" value="false" />
				  	<c:set var="takeoutChecked" value="false" />
				   	<c:set var="dessertChecked" value="false" />
					 <c:if test="${not empty SelectTag1}">
					 	<c:forEach var="tag" items="${SelectTag1}">
					 		<c:if test="${fn:contains(tag, '공부')}">
			                	<c:set var="studyChecked" value="true" />
			           		</c:if>
				            <c:if test="${fn:contains(tag, '회의')}">
				                <c:set var="meetingChecked" value="true" />
				            </c:if>
				            <c:if test="${fn:contains(tag, '모임')}">
				                <c:set var="communityChecked" value="true" />
				            </c:if>
				            <c:if test="${fn:contains(tag, '취미')}">
				                <c:set var="hobbyChecked" value="true" />
				            </c:if>          
				            <c:if test="${fn:contains(tag, '테이크 아웃')}">
				                <c:set var="takeoutChecked" value="true" />
				            </c:if>  
				            
				            <c:if test="${fn:contains(tag, '후식')}">
				                <c:set var="dessertChecked" value="true" />
				            </c:if>  
			        	</c:forEach>
			    	</c:if>
			   
					<c:set var="quietChecked" value="false" />
					<c:set var="calmChecked" value="false" />
					<c:set var="livelyChecked" value="false" />
					<c:set var="emotionalChecked" value="false" />
					<c:set var="loudChecked" value="false" />
					<c:set var="goodBGMChecked" value="false" />
					
					<c:if test="${not empty SelectTag2}">
					    <c:forEach var="tag" items="${SelectTag2}">
					        <c:if test="${fn:contains(tag, '조용함')}">
					            <c:set var="quietChecked" value="true" />
					        </c:if>
					        <c:if test="${fn:contains(tag, '잔잔함')}">
					            <c:set var="calmChecked" value="true" />
					        </c:if>
					        <c:if test="${fn:contains(tag, '활기참')}">
					            <c:set var="livelyChecked" value="true" />
					        </c:if>
					        <c:if test="${fn:contains(tag, '감성넘침')}">
					            <c:set var="emotionalChecked" value="true" />
					        </c:if>
					        <c:if test="${fn:contains(tag, '배경음악이 큰편')}">
					            <c:set var="loudChecked" value="true" />
					        </c:if>
   					        <c:if test="${fn:contains(tag, '좋은 BGM')}">
					            <c:set var="goodBGMChecked" value="true" />
					        </c:if>
					    </c:forEach>
					</c:if>
					
					<c:set var="parkingChecked" value="false" />
					<c:set var="restroomChecked" value="false" />
					<c:set var="cleanRestroomChecked" value="false" />
					<c:set var="manyOutletChecked" value="false" />
					<c:set var="lotsseatsChecked" value="false" />
					<c:set var="fewerseatsChecked" value="false" />
					<c:if test="${not empty SelectTag3}">
						<c:forEach var="tag" items="${SelectTag3}">
							<c:if test="${fn:contains(tag, '주차가능')}">
								<c:set var="parkingChecked" value="true" />
							</c:if>
							<c:if test="${fn:contains(tag, '내부화장실')}">
								<c:set var="restroomChecked" value="true" />
							</c:if>
							<c:if test="${fn:contains(tag, '화장실 깨끗함')}">
								<c:set var="cleanRestroomChecked" value="true" />
							</c:if>
							<c:if test="${fn:contains(tag, '콘센트많음')}">
								<c:set var="manyOutletChecked" value="true" />
							</c:if>
							
							<c:if test="${fn:contains(tag, '자리가 많음')}">
								<c:set var="lotsseatsChecked" value="true" />
							</c:if>
							
							
							<c:if test="${fn:contains(tag, '자리가 적음')}">
								<c:set var="fewerseatsChecked" value="true" />
							</c:if>
						</c:forEach>
					</c:if>
					
					<li class="mb-1">
			<button type="button" class="btn  d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="true">
			<img src="./resources/img/coffeeicon2.png" class="bi pe-none me-2 mb-1" width="35" height="35"/><strong style="color: #774c2a;">방문 목적</strong></button><button type="button" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="true">
			</button>			    <div class="collapse show" id="dashboard-collapse">
					    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><input class="form-check-input" type="checkbox" id="checkboxNoLabel2" name="SelectTag1" value="공부" <c:if test="${studyChecked}">checked</c:if> />&nbsp;&nbsp;공부</a></li>
						    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><input class="form-check-input" type="checkbox" id="checkboxNoLabel2" name="SelectTag1" value="회의" <c:if test="${meetingChecked}">checked</c:if> />&nbsp;&nbsp;회의</a></li>
						    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><input class="form-check-input" type="checkbox" id="checkboxNoLabel2" name="SelectTag1" value="모임" <c:if test="${communityChecked}">checked</c:if> />&nbsp;&nbsp;모임</a></li>
						    <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><input class="form-check-input" type="checkbox" id="checkboxNoLabel2" name="SelectTag1" value="취미" <c:if test="${hobbyChecked}">checked</c:if> />&nbsp;&nbsp;취미</a></li>
					    	<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><input class="form-check-input" type="checkbox" id="checkboxNoLabel2" name="SelectTag1" value="후식" <c:if test="${dessertChecked}">checked</c:if> />&nbsp;&nbsp;후식</a></li>
					    	<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><input class="form-check-input" type="checkbox" id="checkboxNoLabel2" name="SelectTag1" value="테이크아웃" <c:if test="${takeoutChecked}">checked</c:if> />&nbsp;&nbsp;테이크아웃</a></li>
					    
					    
					    </ul>
					    </div>
					</li>
					<li class="mb-1">
			<button type="button" class="btn  d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse1" aria-expanded="true">
				    <img src="./resources/img/coffeeicon3.png" class="bi pe-none me-2 mb-1" width="35" height="35"/><strong style="color: #4f311b;">분위기&nbsp;&nbsp;&nbsp;&nbsp;</strong></button><button type="button" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse1" aria-expanded="true">
			</button>					    <div class="collapse show" id="dashboard-collapse1">
					        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						        <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><input class="form-check-input" type="checkbox" id="checkboxNoLabel2" name="SelectTag2" value="조용함" <c:if test="${quietChecked}">checked</c:if> />&nbsp;&nbsp;조용함</a></li>
						        <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><input class="form-check-input" type="checkbox" id="checkboxNoLabel2" name="SelectTag2" value="잔잔함" <c:if test="${calmChecked}">checked</c:if> />&nbsp;&nbsp;잔잔함</a></li>
						        <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><input class="form-check-input" type="checkbox" id="checkboxNoLabel2" name="SelectTag2" value="활기참" <c:if test="${livelyChecked}">checked</c:if> />&nbsp;&nbsp;활기참</a></li>
						        <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><input class="form-check-input" type="checkbox" id="checkboxNoLabel2" name="SelectTag2" value="감성넘침" <c:if test="${emotionalChecked}">checked</c:if> />&nbsp;&nbsp;감성넘침</a></li>
								<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><input class="form-check-input" type="checkbox" id="checkboxNoLabel2" name="SelectTag2" value="좋은 BGM" <c:if test="${goodBGMChecked}">checked</c:if> />&nbsp;&nbsp;좋은 BGM</a></li>
								<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><input class="form-check-input" type="checkbox" id="checkboxNoLabel2" name="SelectTag2" value="배경음악이 큰편" <c:if test="${loudChecked}">checked</c:if> />&nbsp;&nbsp;배경음악이 큰편</a></li>
					        
					        </ul>
					        
					    </div>
					</li>
					<li class="mb-1">
		<button type="button" class="btn  d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse2" aria-expanded="true">
				 <img src="./resources/img/coffeeicon4.png" class="bi pe-none me-2 mb-1" width="35" height="35"/><strong style="color: #442f1e;">내부시설&nbsp;</strong></button><button type="button" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse2" aria-expanded="true">
			</button>					    <div class="collapse show" id="dashboard-collapse2">
					        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
					        <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><input class="form-check-input" type="checkbox" id="checkboxNoLabel2" name="SelectTag3" value="주차가능" <c:if test="${parkingChecked}">checked</c:if> />&nbsp;&nbsp;주차가능</a></li>
					            <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><input class="form-check-input" type="checkbox" id="checkboxNoLabel2" name="SelectTag3" value="내부화장실" <c:if test="${restroomChecked}">checked</c:if> />&nbsp;&nbsp;내부화장실</a></li>
					           <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><input class="form-check-input" type="checkbox" id="checkboxNoLabel2" name="SelectTag3" value="콘센트많음" <c:if test="${manyOutletChecked}">checked</c:if> />&nbsp;&nbsp;콘센트많음</a></li>
						      	<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><input class="form-check-input" type="checkbox" id="checkboxNoLabel2" name="SelectTag3" value="자리가 많음" <c:if test="${lotsseatsChecked}">checked</c:if> />&nbsp;&nbsp;자리가 많음</a></li>
								<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><input class="form-check-input" type="checkbox" id="checkboxNoLabel2" name="SelectTag3" value="자리가 적음" <c:if test="${fewerseatsChecked}">checked</c:if> />&nbsp;&nbsp;자리가 적음</a></li>
						 		<li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded"><input class="form-check-input" type="checkbox" id="checkboxNoLabel2" name="SelectTag3" value="화장실 깨끗함" <c:if test="${cleanRestroomChecked}">checked</c:if> />&nbsp;&nbsp;화장실 깨끗함</a></li>
					        
					        </ul>
					    </div>
					</li>
					<li class="border-top my-3"></li>
					</ul>
				</div>
			</div>
		</div>
	</form>
	
	 <!-- Page content-->
		<div id="page-content-wrapper">
		 
		  <!-- 카페 리스트 -->
		  <div class="container-fluid">
		    <section class="py-4">
		      <div class="container px-4 px-lg-5 mt-5">
		        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
					<c:forEach items="${List}" var="review" varStatus="status" begin="0" end="7">
		            <div class="col mb-5 p-3">
		                <div class="card h-100 " style="border: 1.3px solid #774c2a;">
		                  <!-- 지도 위치-->
		                <div> 
							<!-- 지도 설정 -->
							<c:set var="mapIndex" value="${status.index + 1}"/>
							<div id="map${mapIndex}" style="width:100%;height:250px;"></div>
							<script>
							var mapContainer${mapIndex} = document.getElementById('map${mapIndex}'), // 지도를 표시할 div 
							    mapOption${mapIndex} = {
							        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
							        level: 3 // 지도의 확대 레벨
							    };  
							
							// 지도를 생성합니다    
							var map${mapIndex} = new kakao.maps.Map(mapContainer${mapIndex}, mapOption${mapIndex}); 
							
							// 주소-좌표 변환 객체를 생성합니다
							var geocoder = new kakao.maps.services.Geocoder();
							var address_name='${review.review_Cafeaddr}';
							// 주소로 좌표를 검색합니다
							geocoder.addressSearch((address_name), function(result, status) {
							
							    // 정상적으로 검색이 완료됐으면 
							     if (status === kakao.maps.services.Status.OK) {
							
							        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
							
							        // 결과값으로 받은 위치를 마커로 표시합니다
							        var marker${mapIndex} = new kakao.maps.Marker({
							            map: map${mapIndex},
							            position: coords
							        });
	
							        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							        map${mapIndex}.setCenter(coords);
							    } 
							});    
							</script>	
						</div>
						<div class="input_wrap">
							<input type="hidden" name="review_Cafeaddr"value='<c:out value="${review.review_Cafeaddr}"/>'></input>
						</div>
	                  	<!-- 컨텐츠 내용-->
		                  <div class="card-body p-4">
		                    <div class="text-center">
		                      <h5 class="fw-bolder pt-2" style="border-top: 1.3px solid #774c2a;">${review.review_Cafename}</h5>
		                      <div class="d-flex justify-content-center mb-2">
		                        <div>
	                        	<span class="badge" style="background-color: #774c2a;">${review.review_SelectTag1}</span><br/>
	   		                    <span class="badge" style="background-color: #4f311b;">${review.review_SelectTag2}</span><br/>
	   		                    <span class="badge" style="background-color: #442f1e;">${review.review_SelectTag3}</span><br/>
		                        </div> 
		                      </div>
		                    </div>
		                  </div>
		                  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                    <div class="text-center">
		                      <form action='review/DetailReview' method='GET'>
		                        <input type="hidden" name="review_Cafename" value="${review.review_Cafename}">
								<button type="submit" class="btn btn-outline-dark mt-auto" style="border: 1.3px solid #774c2a; color: #56361d;">
								<strong>더많은 리뷰 보기</strong>
								</button>
		                      </form>
		                    </div>
		                  </div>
		                </div>
		            </div>
		          </c:forEach>
	          
          <c:if test="${List.size() < 8}">
		    <c:set var="dummyCount" value="${8 - List.size()}" />
		    <c:forEach begin="1" end="${dummyCount}">
		         <div class="col mb-5" style="    opacity: 0;">
	                <div class="card h-100">
	                  <!-- 지도 위치-->
	                <div class="">
						<!-- 지도 설정 -->
						<c:set var="mapIndex" value=""/>

						<div id="map${mapIndex}" style="width:100%;height:250px;"></div>
						
			
					</div>
							<div class="input_wrap">
							<input type="hidden" name="review_Cafeaddr"value='<c:out value=""/>'></input>
						</div>
	                  <!-- Product details-->
	                  <div class="card-body p-4">
	                    <div class="text-center">
	                      <!-- Product name-->
	                      <h5 class="fw-bolder"></h5>
	                      <!-- Product reviews-->
	                      <div class="d-flex justify-content-center mb-2">
	                        <div>
	                        <span class="badge bg-secondary"></span>
   		                    <span class="badge bg-success"></span>
   		                    <span class="badge bg-dark"></span>
	                        </div>
	                        
	                      </div>
	                    </div>
	                  </div>
	                  <!-- Product actions-->
	                  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                    <div class="text-center">
	                        <br/> <br/>
	                        
	                    </div>
	                  </div>
	                </div>
	             
	            </div>
  			 </c:forEach>
		</c:if>

		<!-- 현재 페이지 목록을 감싸는 div 태그 -->
		<c:if test="${totalPages > 0}">
			<div class="page-list">
			  <ul class="pagination">
				<!-- Previous 버튼 -->
				<li class="page-item <c:if test='${hasPrevPage eq false}'>disabled</c:if>">
				  <a class="page-link" href="${requestUrl}&page=${prevPage}" aria-disabled="${hasPrevPage eq false}">Previous</a>
				</li>
				<!-- 페이지 목록 -->
				<c:forEach begin="0" end="${totalPages - 1}" var="pageNum">
				    <li class="page-item <c:if test='${pageNum eq currentPage}'>active</c:if>">
				        <a class="page-link" href="${requestUrl}&page=${pageNum}" aria-disabled="${hasNextPage eq false}">${pageNum + 1}</a>					 
				    </li>
				</c:forEach>
				<!-- Next 버튼 -->
				<li class="page-item  <c:if test='${hasNextPage eq false}'>disabled</c:if>">
				  <a class="page-link" href="${requestUrl}&page=${nextPage}" aria-disabled="${hasNextPage eq false}">Next</a>
				</li>		    
		  		</ul>
			</div>
		</c:if>
			<!-- 현재 페이지 목록을 감싸는 div 태그 -->
	        </div>
	      </div>
	    </section>
	  </div>
	</div>
	</div>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<script src="./resources/js/scripts.js"></script>
	<!-- Footer-->
	<footer class="py-5 bg-light">
		<div class="container">
      <p class="m-0 text-center" style="color: #442f1e;"><strong>Copyright &copy;Project Team 522</strong></p>
		</div>
	</footer>
</body>
</html>