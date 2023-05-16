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

<title>WoOx Travel Reservation Page</title>

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
<!--

TemplateMo 580 Woox Travel

https://templatemo.com/tm-580-woox-travel

-->
</head>
<%
String place_name = request.getParameter("place_name");
String category_name = request.getParameter("category_name");
String address_name = request.getParameter("address_name");
String road_address_name = request.getParameter("road_address_name");

%>
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
					<form id="reservation-form" name="gs" method="post" role="search"
						action="/community/register">
						<div class="row">
							<div class="col-lg-12">
								<h4>소모임 작성</h4>
							</div>
							<div class="col-lg-6">
								<fieldset>
									<label for="Name" class="form-label">작성자</label> <input
										type="text" name='user_id' value="${sessionScope.userInfo.user_id}" class="form-control"
										autocomplete="on" required>
										<input type="hidden" id="nickname" name="nickname"
									value="${sessionScope.userInfo.user_nickname}">
								</fieldset>
							</div>
							<div class="col-lg-6">
								<fieldset>
									<label for="Title" class="form-label">소모임 제목</label> <input
										type="text" class="form-control" name='community_title'
										placeholder="소모임 제목" autocomplete="on" required>
								</fieldset>
							</div>
							<div class="col-lg-6">
								<fieldset>
									<label for="chooseCategory" class="form-label">카테고리 선택</label>
									<select name="community_category" class="form-control"
										aria-label="Default select community_category"
										id="community_category" onChange="this.form.click()">
										<option selected>카테고리</option>
										<option value="1-DAY-CLASS">1-DAY-CLASS</option>
										<option value="카페 탐방">카페 탐방</option>
										<option value="봉사 활동">봉사 활동</option>
										<option value="나눔 카페">나눔 카페</option>
									</select>
								</fieldset>
							</div>
							<div class="col-lg-6">
								<fieldset>
									<label for="Number" class="form-label">소모임 일정</label> <input
										type="date" name="community_schedule" class="form-control"
										id="community_schedule" required>
								</fieldset>
							</div>
							<div class="col-lg-6">
								<fieldset>
									<label for="address" class="form-label">소모임 주소</label> <input
										type="text" name="community_place" class="form-control"
										placeholder="소모임 장소" value='<c:out value="<%=address_name %>" />' autocomplete="on" required>
								</fieldset>
							</div>
							<div class="col-lg-6">
								<fieldset>
									<label for="address" class="form-label">소모임 장소</label> <input
										type="text" name="community_map" class="form-control"
										placeholder="가게 이름" value='<c:out value="<%=place_name %>" />' autocomplete="on">
								</fieldset>
							</div>
							<div class="col-lg-12">
								<fieldset>
									<label for="chooseDestination" class="form-label">내용</label>
									<div class="input-group">
										<span class="input-group-text"></span>
										<textarea class="form-control" aria-label="With textarea"
											rows="20" name="community_context"></textarea>
									</div>
								</fieldset>
							</div>
							<div class="col-lg-12">
								<br>
								<br>
								<fieldset>
									<button 
										type="submit" class="btn btn-default">작성</button>
								</fieldset>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- Scripts -->
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
