<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport"
         content="width=device-width, initial-scale=1, shrink-to-fit=no" />
      <meta name="description" content="" />
      <meta name="author" content="" />
       <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
   
       <title>가게별 리뷰 목록</title>
   
       <!-- Bootstrap core CSS -->
       <link href="../../resources/review/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   
       <!-- Additional CSS Files -->
       <link rel="stylesheet" href="../../resources/review/assets/css/fontawesome.css">
       <link rel="stylesheet" href="../../resources/review/assets/css/templatemo-woox-travel.css">
       <link rel="stylesheet" href="../../resources/review/assets/css/owl.css">
       <link rel="stylesheet" href="../../resources/review/assets/css/animate.css">
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
   /* pagination */
     
     .pagination {
         height: 36px;
         margin: 18px 0;
         color: #363636;

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
         color: #363636;
     }
     
     .pagination a {
         float: left;
         padding: 0 14px;
         line-height: 34px;
         color: #363636;
         text-decoration: none;
         border: 1px solid #ddd;
         border-left-width: 0;
     }
     
     .pagination a:hover,
     .pagination .active a {
         background-color: #442f1e;
         color: #ffffff;
         border: 1px solid #ddd;
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
</head>
<body>
   <!-- ***** Header Area Start ***** -->

<!-- 맨위 로그인창 -->
   <div class="bg-light">

	<!-- 맨위 로그인창 -->
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
   </div>

   
   <div class="visit-country">
         
         <div class="container">
            <div class="row">
               
               <div class="col-lg-9" style="margin:0 auto;">
                  <div class="items">
                     <div class="row">
                           <div class="mt-5 mb-5">
                              <span style="color:gray;font-size:18px;"><i>${SearchContent}</i> 에 대한 검색내용</span>
                           </div>
                        <c:forEach items="${List}" var="review">
                           <div class="col-lg-11">
                              <div class="item">
                                 <div class="row">

                                    <div class="col-lg-12">
                                       <div class="right-content">

                                          <div style="margin-top:10px;">
                                              <a class='move'
                                                href='<c:out value="${review.review_Num}"/>'><h4 class="mb-2"> ${review.review_Title}</h4></a>
                                             <span class="mb-2"><i class="fas fa-coffee"></i> ${review.review_Cafename}</span>
                                          </div>

                                          <ul class="info">
                                             <li><i class="fa fa-user"></i> ${review.user_nickname}</li>
                                             <li><i class="fa fa-calendar"></i><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${review.review_Date }"/></li>
                                             <li><i class="fa-solid fa-hashtag"></i>${review.review_SelectTag1},${review.review_SelectTag2}</li>
                                          </ul>

                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <!-- list end -->
                        </c:forEach>
                         <c:if test="${List.size() < 3}">
						  	<c:set var="dummyCount" value="${3 - List.size()}" />
								<c:forEach begin="1" end="${dummyCount}">
								
		                           <div class="col-lg-11"  style="opacity: 0;">
		                              <div class="item">
		                                 <div class="row">
		
		                                    <div class="col-lg-12">
		                                       <div class="right-content">
		
		                                          <div style="margin-top:10px;">
		                                              <h4 class="mb-2"> ${review.review_Title}</h4>
		                                             <span class="mb-2"><i class="fas fa-coffee"></i> ${review.review_Cafename}</span>
		                                          </div>
		
		                                          <ul class="info">
		                                             <li><i class="fa fa-user"></i></li>
		                                             <li><i class="fa fa-calendar"></i></li>
		                                             <li><i class="fa-solid fa-hashtag"></i></li>
		                                          </ul>
		
		                                    </div>
		                                 </div>
		                              </div>
		                           </div>
								</div>
								</c:forEach>
							</c:if>

                     </div>
                  </div>
               </div>

            </div>

         </div>
         <div class="col-lg-12 mt-5 mb-3" style="display: flex; justify-content: center;">

            
              <ul class="pagination" >

                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                  <li class="paginate_button page-item ${pageMaker.cri.pageNum == num ? 'active' : ''}">
                    <a class="page-link" href="${num}">${num}</a>
                  </li>
                </c:forEach>

              </ul>

            <!--  end Pagination  -->
      
            <form id='actionForm' action="/review/DetailReview" method='get'>
               <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
               <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
               <input type='hidden' name='review_Cafename' value='${pageMaker.cri.review_Cafename}'>
            </form>

         </div>
      </div>
      	<footer class="py-5 bg-light">
		<div class="container">
		<p class="m-0 text-center" style="color: #442f1e;"> <strong>Copyright &copy;Project Team522</strong></p>
		</div>
	</footer>
   <!-- Bootstrap core JavaScript -->
   <script src="../../resources/review/vendor/jquery/jquery.min.js"></script>
   <script
      src="../../resources/review/vendor/bootstrap/js/bootstrap.min.js"></script>

   <script src="../../resources/review/assets/js/isotope.min.js"></script>
   <script src="../../resources/review/assets/js/owl-carousel.js"></script>
   <script src="../../resources/review/assets/js/isotope.js"></script>
   <script src="../../resources/review/assets/js/tabs.js"></script>
   <script src="../../resources/review/assets/js/popup.js"></script>
   <script src="../../resources/review/assets/js/custom.js"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
   <!-- Core theme JS-->
   <script src="../../resources/js/scripts.js"></script>
   
   <script>
      $(".option").click(function() {
         $(".option").removeClass("active");
         $(this).addClass("active");
      });
   </script>
   <script type="text/javascript">
      $(document).ready(function(){
         var actionForm = $("#actionForm");
         $(".paginate_button a").on(
               "click",
               function(e) {
                  e.preventDefault();
                  console.log('click');
                  actionForm.find("input[name='pageNum']")
                        .val($(this).attr("href"));
                  actionForm.submit();
         });
         
         $(".move").on("click",function(e){
            e.preventDefault();
            actionForm.append("<input type='hidden' name='review_Num' value='"+$(this).attr("href")+"'>");
            actionForm.attr("action","/review/getReview");
            actionForm.submit();
         });
         
      });
   </script>

</body>
</html>