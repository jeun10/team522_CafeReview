<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<title>댓글 수정</title>

<!-- Bootstrap core CSS -->
<link
	href="../../../resources/community/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Additional CSS Files -->
<link rel="stylesheet"
	href="../../../resources/community/assets/css/fontawesome.css">
<link rel="stylesheet"
	href="../../../resources/community/assets/css/templatemo-woox-travel.css">
<link rel="stylesheet"
	href="../../../resources/community/assets/css/owl.css">
<link rel="stylesheet"
	href="../../../resources/community/assets/css/animate.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--
<!--

TemplateMo 580 Woox Travel

https://templatemo.com/tm-580-woox-travel

-->

</head>

<body>
	<div id="nav">
		<c:import url="../nav.jsp" />
	</div>
	<!-- ***** Preloader Start ***** -->
	<!-- <div id="js-preloader" class="js-preloader">
		<div class="preloader-inner">
			<span class="dot"></span>
			<div class="dots">
				<span></span> <span></span> <span></span>
			</div>
		</div>
	</div> -->

	<!-- ***** Preloader End ***** -->

	<!-- ***** Header Area Start ***** -->

	<!-- ***** Header Area End ***** -->

	<div class="reservation-form">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<form id="reservation-form" role="form"
						action="/community/modifyReply" method="post">
						<div class="row">
							<input type='hidden' class="form-control" name='comment_num'
								value='${comment.comment_num}'> <input type='hidden'
								class="form-control" name='community_num'
								value='${comment.community_num}'> <input type='hidden'
								class="form-control" name='comment_ori_number'
								value='${comment.comment_ori_number}'> <input
								type='hidden' class="form-control" name='user_id'
								value='${reply.user_id }'> <input type='hidden'
								class="form-control" name='comment_date'
								value='${comment.comment_date}'>
						</div>
						<div class="col-lg-12">
							<fieldset>
								<label for="Name" class="form-label">내용</label> <input
									type="text" name="comment_contents"
									value="${comment.comment_contents}">
							</fieldset>
							<br>
						</div>
						<div class="col-lg-2">
							<fieldset>
								<button type="submit" data-oper='modifyReply' >등록</button>
							</fieldset>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- Scripts -->
	<!-- Bootstrap core JavaScript -->
	<!-- Bootstrap core JavaScript -->
	<script src="../../../resources/community/vendor/jquery/jquery.min.js"></script>
	<script
		src="../../../resources/community/vendor/bootstrap/js/bootstrap.min.js"></script>

	<script src="../../../resources/community/assets/js/isotope.min.js"></script>
	<script src="../../../resources/community/assets/js/owl-carousel.js"></script>
	<script src="../../../resources/community/assets/js/wow.js"></script>
	<script src="../../../resources/community/assets/js/tabs.js"></script>
	<script src="../../../resources/community/assets/js/popup.js"></script>
	<script src="../../../resources/community/assets/js/custom.js"></script>

	<script>
		$(".option").click(function() {
			$(".option").removeClass("active");
			$(this).addClass("active");
		});
	</script>
	<div id="footer">
		<c:import url="../footer.jsp" />
	</div>
</body>

</html>
