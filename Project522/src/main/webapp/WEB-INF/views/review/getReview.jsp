<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html >

  <head>
   
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no" />
   <meta name="description" content="" />
   <meta name="author" content="" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>리뷰 상세페이지</title>

    <!-- Bootstrap core CSS -->
    <link href="../../resources/review/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="../../resources/review/assets/css/fontawesome.css">
    <link rel="stylesheet" href="../../resources/review/assets/css/templatemo-woox-travel.css">
    <link rel="stylesheet" href="../../resources/review/assets/css/owl.css">
    <link rel="stylesheet" href="../../resources/assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="../../resources/css/make.css" rel="stylesheet" />

   <link rel="stylesheet" type="text/css" href="../../resources/css/make.css">
   
<!--

TemplateMo 580 Woox Travel

https://templatemo.com/tm-580-woox-travel

-->
	<style>
		.modal {
	    display: none; /* 모달창 숨겨 놓기 */
	    position: fixed; 
	    z-index: 1; /* 모달창을 제일 앞에 두기 */
	    padding-top: 100px;
	    left: 0; top: 0;
	    width: 100%; height: 100%;
	    overflow: auto; /* 스크롤 허용 auto */
	    cursor: pointer; /* 마우스 손가락모양 */
	    background-color: rgba(0, 0, 0, 0.8);
	  }
	  /* 모달창 이미지 */
	  .modal_content {
	    margin: auto;
	    display: block;
	    width: 50%; height: auto;
	    max-width: 1000px;
	    border-radius: 10px;
	    animation-name: zoom;
	    animation-duration: 0.8s;
	  }
	  /* 모달창 애니메이션 추가 */
	  @keyframes zoom {
	    from {transform: scale(0)}
	    to {transform: scale(1)}
	  }
	  /* 닫기 버튼 꾸미기 */
	  .imgclose {
	    position: absolute;
	    top: 15px;
	    right: 35px;
	    color: #f1f1f1;
	    font-size: 40px;
	    font-weight: bold;
	    transition: 0.3s;
	  }
	  .imgclose:hover, .imgclose:focus{
	    color: #bbb;
	    text-decoration: none;
	    cursor: pointer;
	  }
	
	</style>
  </head>

<body>


  <!-- ***** Header Area Start ***** -->
   <div class="bg-light">
      <header class="container ">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
	    		<a class="navbar-brand" href="/"><img src="/resources/img/logo2.png" class="img-fluid" alt="logo" style="height:24px; width:120px;"></a>
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
   </div>
  <!-- ***** Header Area End ***** -->



  <div class="reservation-form">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
         <div id="map" class="rounded-3" style="width:100%;height:350px;"></div>
                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cbeb53fc639beafda1dfcf096df608fc&libraries=services"></script>
            <script>
               var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                   mapOption = {
                       center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                       level: 1 // 지도의 확대 레벨
                   };  
               
               // 지도를 생성합니다    
               var map = new kakao.maps.Map(mapContainer, mapOption); 
               
               // 주소-좌표 변환 객체를 생성합니다
               var geocoder = new kakao.maps.services.Geocoder();
               var address_name='${review.review_Cafeaddr}';
               // 주소로 좌표를 검색합니다
               geocoder.addressSearch((address_name), function(result, status) {
               
                   // 정상적으로 검색이 완료됐으면 
                    if (status === kakao.maps.services.Status.OK) {
               
                       var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
               
                       // 결과값으로 받은 위치를 마커로 표시합니다
                       var marker = new kakao.maps.Marker({
                           map: map,
                           position: coords
                       });
               
                       // 인포윈도우로 장소에 대한 설명을 표시합니다
                     /*   var infowindow = new kakao.maps.InfoWindow({
                           content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
                       });
                       infowindow.open(map, marker); */
               
                       // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                       map.setCenter(coords);
                   } 
               });    
            </script>
        </div>
        
        <div class="col-lg-12">
           
         
          <div id="reservation-form">
             
             <div class="row mb-4">
                <div class="more-info row">
	               <div class="col-lg-6 col-sm-6">
	                   <div class="info-item">
	                        <i class="fas fa-coffee"></i>
	                        <h5>카페 이름</h4>
	                        <input type="hidden" name="review_Cafename" value='<c:out value="${review.review_Cafename }" />'></input>
	                        <p><c:out value="${review.review_Cafename }" /></p>
	                   </div>
	                 </div>
                 
	                 <div class="col-lg-6 col-sm-6">
		                <div class="info-item">
		                	<i class="fa fa-map-marker"></i>
		                    <h5>카페 위치</h4>
		                    <input type="hidden" name="review_Cafeaddr" value='<c:out value="${review.review_Cafeaddr }" />'></input>
		                    <p><c:out value="${review.review_Cafeaddr }" /></p>
		            	</div>
	                </div>
            	</div>

            </div>

            <div class="row">
              <div class="col-lg-12 mt-4 mb-3">
                <b><p style="font-size:25px; color:black;" class="mb-2"><c:out value="${review.review_Title }"/></p></b>
                <input type="hidden" name="user_id" value='<c:out value="${review.user_Id}" />'>
                     <span style="font-size:16px;" ><lable style="color:#625a53;"> 글 작성자: <c:out value="${review.user_nickname}"/> ( <c:out value="${review.user_Id}" /> )  </lable></span>
               <span class="ms-3"><label style="color:#625a53;"> 글 작성일: <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${review.review_Date }"/></label></span>
              </div>
              
              <div class="col-lg-6  mb-3">
                  <fieldset>
                      <h5 class="mt-2" style="font-size:22px;">방문목적</h5>
                      <p class="mt-1">
                     <span class="badge" style="font-size:16px; background-color: #5f4f43;"><c:out value="${review.review_SelectTag1 }" /></span>
                  </p>
                  </fieldset>       
              </div>
              
              <div class="col-lg-6  mb-3">
                <fieldset>
                <h5 class="mt-2" style="font-size:22px;">분위기</h5>
               <p class="mt-1">
                  <span class="badge" style="font-size:16px; background-color: #5f4f43;"><c:out value="${review.review_SelectTag2 }" /></span>
               </p>
                </fieldset>
              </div>
              
              <div class="col-lg-6  mb-3">
                  <fieldset>
                         <h5 class="mt-2" style="font-size:22px;">편의시설</h5>
                  <p class="mt-1">
                     <span class="badge" style="font-size:16px; background-color: #5f4f43;"><c:out value="${review.review_SelectTag3 }" /></span>
                  </p>
                  </fieldset>
              </div>
              
              <div class="col-lg-6 mb-3">
                <fieldset>
                  <h5 class="mt-2" style="font-size:22px;">해쉬태그</h5>
                  <p class="mt-1">
                     <c:if test="${not empty hashtagarray}">
                        
                           <c:forEach items="${hashtagarray}" var="hasharr">
                              <span class="badge" style="font-size:16px; background-color: #5f4f43;"><a style="color:white;"href="/review/HashReview?review_Hashtag=<c:out value='${hasharr}' />"><c:out value='${hasharr}' /></a></span>
                           </c:forEach>
                        
                     </c:if>
                  </p>
                </fieldset>
              </div>
              
              <div class="col-lg-12" style="margin-top:80px;">
                 <c:if test="${not empty imgarray}">
	                <div class="cities-town">
	                   <div class="container">
	                     <div class="row">
	                       <div class="slider-content">
	                         <div class="row">
	                                                 
	                           <div class="col-lg-12">
	                             <div class="owl-cites-town owl-carousel">
		                           <c:forEach items="${imgarray}" var="imgarr">
		                              <div class="item">
		                                    <div class="thumb">
		                                      <img src="/imgf/<c:out value='${imgarr}' />" width="200"  onerror="this.src='/resources/img/imgalt.png';">
		                                     
		                                    </div>
		                              </div>      
		                           </c:forEach>
	                               
	                             </div>
	                           </div>
	                         </div>
	                       </div>
	                     </div>
	                   </div>
	                 </div>
            	</c:if>
           	</div>
            
            <div class="modal">
				<span class="imgclose">&times;</span>
				<div class="modal_content">
					<img src="" alt="">
				</div>
			</div>
            <div class="col-lg-12 mt-2">
                  <fieldset>
                      <label for="chooseDestination" class="form-label" style="color:#625a53;">글 내용</label>
                      <textarea  rows="12" name="review_Content"
                     readonly="readonly"><c:out
                        value="${review.review_Content}" />
                  </textarea>
                  </fieldset>
              </div>
              <div>                        
	            <form name="infoForm" role="form" method="post">         
	               <input type="hidden" id="review_Num" name="review_Num" value='<c:out value="${review.review_Num}"/>'>
	               <input type="hidden" id="user_Id" name="user_Id" value='<c:out value="${review.user_Id}"/>'>
	               <input type="hidden" id="pageNum" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
	               <input type="hidden" id="amount" name="amount" value='<c:out value="${cri.amount}"/>'>
	               
	            </form>
	
	            <script type="text/javascript">
	               var formObj = $("form[name='infoForm']");
	               var str = '${review.review_Cafename }';
	               var cafename= str.replace(' ', '+');
	               console.log(cafename);
	               $(document).ready(function() {
	                  // 목록 
	                  $(".list_btn").on("click", function(){
	                     location.href = "/review/DetailReview?review_Cafename="+cafename+
	                           "&pageNum="+${cri.pageNum}+"&amount="+${cri.amount};
	                  });
	                  
	                  // 수정 
	                  $(".update_btn").on("click", function(){
	                     formObj.attr("action", "/review/modifyReview");
	                     formObj.attr("method", "get");
	                     formObj.submit();            
	                  });
	                  // 삭제
	                  $(".delete_btn").on("click", function(){
	                     
	                     var deleteYN = confirm("삭제하시겠습니까?");
	                     if(deleteYN == true){
	                        
	                     formObj.attr("action", "/review/reviewdelete");
	                     formObj.attr("method", "post");
	                     formObj.submit();   
	                     }
	                  });      
	               });
	            </script> 
	            <!-- 목록보기 -->
	            <div class="ec-base-tab gFlex">
	               <div class="board">
	                  <button type="button" class="list_btn">목록</button>
	                  <c:if test="${not empty sessionScope.userInfo}">
	                     <c:if test="${review.user_Id == sessionScope.userInfo.user_id}">
	                        <button type="button" class="update_btn" >수정</button>
	                        <button type="button" class="delete_btn">삭제</button>
	                     </c:if>
	                  </c:if>
	               </div>
	            </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
	<footer class="py-5 bg-light">
		<div class="container">
		<p class="m-0 text-center" style="color: #442f1e;"> <strong>Copyright &copy;Project Team522</strong></p>
		</div>
	</footer>


  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
  <script src="../../resources/review/vendor/jquery/jquery.min.js"></script>
  <script src="../../resources/review/vendor/bootstrap/js/bootstrap.min.js"></script>

  <script src="../../resources/review/assets/js/isotope.min.js"></script>
  <script src="../../resources/review/assets/js/owl-carousel.js"></script>
  <script src="../../resources/review/assets/js/wow.js"></script>
  <script src="../../resources/review/assets/js/tabs.js"></script>
  <script src="../../resources/review/assets/js/popup.js"></script>
  <script src="../../resources/review/assets/js/custom.js"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
   <!-- Core theme JS-->
   <script src="../../resources/js/scripts.js"></script>
  <script>
    $(".option").click(function(){
      $(".option").removeClass("active");
      $(this).addClass("active"); 
    });
  </script>
  <script>
  $(function(){
		//이미지 클릭시 해당 이미지 모달
		$(".thumb").click(function(){
			$(".modal").show();
			// 해당 이미지 가겨오기
			var imgSrc = $(this).children("img").attr("src");
			var imgAlt = $(this).children("img").attr("alt");
			$(".modal_content img").attr("src", imgSrc);
			$(".modal_content img").attr("alt", imgAlt);
			
		});
		
		//.modal안에 span x표시 클릭시 .modal닫기
		$(".modal .imgclose").click(function(){
			$(".modal").hide();
		});
		
		//.modal밖에 클릭시 닫힘
		$(".modal").click(function (e) {
	    if (e.target.className != "modal") {
	      return false;
	    } else {
	      $(".modal").hide();
	    }
	  });
	});
  </script>

  </body>

</html>