<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>home</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<!-- <link href="../../../resources/MyPage/style.css" rel="stylesheet"> -->

<!--마이페이지-->
<!--마이페이지 css-->
<link href="../../../resources/MyPage/MyPage.css" rel="stylesheet">
<link href="../../../resources/MyPage/button.css" rel="stylesheet">
<!--마이페이지 Google Fonts-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@1,700&family=Roboto:wght@500&display=swap"
	rel="stylesheet">
<!--마이페이지 google icon-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</head>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cbeb53fc639beafda1dfcf096df608fc&libraries=services"></script>

<body class="bg-light">
	<div id="nav">
		<jsp:include page="../nav.jsp" />
	</div>
	<div id="header">
		<c:import url="../header.jsp" />
	</div>

	<!--마이페이지-->
	<div id="first" class="border container">
		<div class="row" style="margin-top: 20px;">
			<div class="col-sm-3" style="height: 750px;">
				<img src="../../../resources/MyPage/image/image.png"
					class="rounded-circle" alt="Cinque Terre" width="140" height="140" style="margin-top: 30px;">
				<h4><c:out value="${replyList[0].user_id}" /></h4>
				<div class="user">
					<div class="text-start">
						<button type="button" class="btn"
							onclick="location.href='/MyPage/MyPageReview'">> Review</button>
					</div>
					<div class="text-start">
						<button type="button" class="btn"
							onclick="location.href='/MyPage/MPC'">> Community</button>
					</div>

					<div class="text-start">
						<button type="button" class="btn"
							onclick="location.href='/MyPage/MyPageReply'">> Comment</button>
					</div>
				</div>
				<div class="Logout">
					<button type="button" class="btn" onclick="location.href='/user_login/logout'">Log Out</button>
				</div>
			</div>      
			<!--오른쪽 화면-->
			<div class="col-sm-9" id="layoutMP">
				<!-- ======= Alt Services Section ======= -->
				<section id="alt-services" class="alt-services">
					<div class="container" data-aos="fade-up">
						<div class="col-lg-5 d-flex flex-column justify-content-center">
							<h3>Comment</h3>
							<div id="review" class="container">
								<!--review-->
								<c:forEach items="${replyList}" var="replyList">
									<div class="review_page">
										<div class="icon-box d-flex position-relative"
											data-aos="fade-up" data-aos-delay="100">
											<i class="bi bi-easel flex-shrink-0"> <span
												class="material-symbols-outlined"> edit_square </span>
											</i>
											<div>
												<h4 class='move'>
													<a href="" class="stretched-link">${replyList.comment_date}</a>
												</h4>
												<p><b>Contents : </b>${replyList.comment_contents}</p>
											</div>
										</div>
										<div class="delete_button">
											<button type="button" class="btn"
												onclick="remove(${replyList.comment_num})">x</button>
										</div>
									</div>
									
								 <script type="text/javascript">
									    $(document).ready(function() {
									        var actionForm = $("#actionForm");
									
									        $(".page-item a").on(
									            "click",
									            function(e) {
									                e.preventDefault();
									                console.log('click');
									                actionForm.find("input[name='pageNum']").val($(this).attr("href"));
									                actionForm.submit(); 
									            }
									        );
									        
									        
									/*         $(".move").on("click",function(e){
												e.preventDefault();
												actionForm.append("<input type='hidden' name='reply' value='${replyList.comment_num}'>");
												actionForm.attr("action","/community/get");
												actionForm.submit();
											}); */
									    });
									</script>          
									
								</c:forEach>
							</div>
						</div>
					</div>
				</section>
				<!-- End Alt Services Section -->
				<div class="container mt-3" style="margin-bottom: 50px;">
					<div class='page-list'>
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li class="page-item"><a href="${pageMaker.startPage -1}">Previous</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li class="page-item  ${pageMaker.cri.pageNum == num ? "active":""} ">
									<a class="page-link" href="${num}">${num}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next}">
								<li class="page-item"><a href="${pageMaker.endPage +1 }">next</a></li>
							</c:if>
						</ul>
					</div>
				</div>
				<form id='actionForm' action="/MyPage/MyPageReply" method='get'>
					<input type='hidden' name='pageNum'
						value='${pageMaker.cri.pageNum}'> <input type='hidden'
						name='amount' value='${pageMaker.cri.amount}'>
				</form>
			</div>
		</div>
     

	</div>
	</div>
	<script>
		function remove(comment_num) {
			  if (confirm("삭제하시겠습니까?")) {
			    $.ajax({
			      url: "/MyPage/removeMyPageReply",
			      type: "POST",
			      data: { "comment_num": comment_num },
			      success: function() {
			        location.reload();
			      }
			    });
			  }
			}
	</script>

	<script type="text/javascript">
	    $(document).ready(function() {
	        var actionForm = $("#actionForm");
	
	        $(".page-item a").on(
	            "click",
	            function(e) {
	                e.preventDefault();
	                console.log('click');
	                actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	                actionForm.submit(); 
	            }
	        );
	    });
	</script>


	<!--bootstrap core-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="./resources/js/scripts.js"></script>
</body>
</html>
