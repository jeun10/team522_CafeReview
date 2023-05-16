<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>카페 리스트</title>
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link href="../../resources/css/styles.css" rel="stylesheet" />
<link href="../../resources/css/custom.css" rel="stylesheet" />
<link href="../../resources/css/customList.css" rel="stylesheet" />
<link href="../../resources/css/sidebars.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link href="../../resources/css/customList.css" rel="stylesheet" />
<link href="../../resources/css/customList_2.css" rel="stylesheet" />
</head>

<body>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
		integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA="
		crossorigin="anonymous" />
	<!-- 맨위 로그인창 -->
	<div id="nav">
		<jsp:include page="../nav.jsp" />
	</div>
	<header class=" py-3" style="background-color: #D4BDA5;">
		<div class="container px-3 px-lg-3 my-3">
			<img src="../../resources/assets/banner.png" class="img-fluid"
				alt="logo"
				style="display: block; margin: -50px auto 0; height: 300px;" />
			<div class="d-flex w-50 p-2 px-4"
				style="display: block; margin: -30px auto; height: 65px;">
				<input class="form-control me-2 input-lg" type="text" id="CafeName"
					name="Search" placeholder="리뷰할 카페의 이름 이나 지역을 검색하세요" value="">
				<button class="btn btn-outline-dark" id="search" type="submit"
					style="border: 1.3px solid #774c2a; color: #56361d;">Search</button>
			</div>
		</div>
	</header>
	<!-- 맨위 로그인창 -->
	<div class="d-flex w-50 p-2 " style="display: block; margin: 0 auto;">
	</div>
	<div class="d-flex justify-content-center align-items-center h-100">
		<div class="col-lg-9 mt-4 mt-lg-0">
			<div class="row justify-content-center">
				<div class="col-md-12 mt-4">
					<div class="user-dashboard-info-box mb-4 bg-white p-4 shadow-sm"
						style="min-height: calc(100vh - 100px); max-width: 700px; margin: 0 auto;">
						<div class="" id="results" style="height: calc(100% - 40px);">
						</div>

						<div style="height: 40px;">
							<div class="pagination justify-content-center mb-0">

								<div id="pagination" style="margin: 0 auto;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script src="../../resources/js/AjaxAddress.js"></script>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous"></script>

	<!-- Core theme JS-->
	<script src="./resources/js/scripts.js"></script>
	<script type="text/javascript"></script>
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2023</p>
		</div>
	</footer>
</body>

</html>