<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<title>community</title>

<!-- Bootstrap core CSS -->
<link
	href="../../../resources/community/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../../resources/css/customList.css" rel="stylesheet" />
<link href="../../resources/css/customList_2.css" rel="stylesheet" />

<!-- Additional CSS Files -->
<link rel="stylesheet"
	href="../../../resources/community/assets/css/fontawesome.css">
<link href="./resources/css/custom.css" rel="stylesheet" />
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
<!-- Core theme CSS (includes Bootstrap)-->

<!--

TemplateMo 580 Woox Travel

https://templatemo.com/tm-580-woox-travel

-->

</head>
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
/*      border: 1.3px solid #774c2a;
 */
.pagination a {
	float: left;
	padding: 0 14px;
	line-height: 34px;
	color: #442f1e;
	text-decoration: none;
	border: 1px solid #ddd;
}

.pagination a:hover, .pagination .active a {
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

.pagination .disabled span, .pagination .disabled a, .pagination .disabled a:hover
	{
	color: #774c2a;
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
	color: #774c2a;
	*zoom: 1;
}

.pager:before, .pager:after {
	display: table;
	content: "";
}

.pager:after {
	clear: both;
}

.pager li {
	display: inline;
	color: #774c2a;
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
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cbeb53fc639beafda1dfcf096df608fc&libraries=services"></script>

<body class="bg-light">
	<div id="nav">
		<jsp:include page="../nav.jsp" />
	</div>
	<div id="header">
		<c:import url="../header.jsp" />
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
	<div class="d-flex">
		<!-- 필터  버튼  -->
		<div class="border-end bg-white" id='sidebar-wrapper'>
			<div class="list-group list-group-flush">
				<div class="flex-shrink-0 p-5 " style="width: 270px; height: 50px;">
					<a href="/community/list"
						class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
						<span class="fs-5 fw-semibold">소모임</span>
					</a>
					<ul class="list-unstyled ps-0">
						<li class="mb-1"><a class="btn"
							href="/community/list?pageNum=1&amount=5&type=G&keyword=1-DAY-CLASS">1-DAY-CLASS</a>
							<a class="btn"
							href="/community/list?pageNum=1&amount=5&type=G&keyword=카페 탐방">카페
								탐방</a> <a class="btn"
							href="/community/list?pageNum=1&amount=5&type=G&keyword=봉사 활동">봉사
								활동</a> <a class="btn"
							href="/community/list?pageNum=1&amount=5&type=G&keyword=나눔 카페">나눔
								카페</a></li>
					</ul>
				</div>
			</div>
		</div>


		<div class="visit-country col-8">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="items">
							<div class="row justify-content-center"
								style="margin-left: 100px">
								<div class="d-flex justify-content-center"
									style="display: flex; justify-content: center;">
									<div class="flex-column  justify-content-center col-lg-9"
										style="display: flex; justify-content: center;">
										<form id='searchForm' action="/community/list" method='get'>
											<div class="input-group mb-3">
												<select class="form-select d-flex w-10" name='type'>
													<option value="T"
														<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
													<option value="C"
														<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
													<option value="W"
														<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
												</select> <input type='text' name='keyword'
													class="form-control  d-flex w-75"
													value='<c:out value="${pageMaker.cri.keyword}"/>' />
												<button class='btn btn-outline-secondary'>검색</button>
											</div>
											<c:if test="${pageMaker.cri.type == 'G'}">
												<input type='hidden' name='keyword' class="form-control" />
											</c:if>
											<input type='hidden' name='pageNum' class="form-control"
												value='1' /> <input type='hidden' name='amount'
												class="form-control"
												value='<c:out value="${pageMaker.cri.amount}"/>' />
										</form>
									</div>
								</div>


								<div class="d-flex justify-content-center">
									<div class="flex-column col-lg-12">
										<br>
										<c:forEach var='obj' items="${list}" varStatus="status">
											<div class="item">
												<div class="row">
													<div class="col-lg-3">
														<div class="image h-50 d-inline-block">
															<img
																src="../../../resources/community/assets/images/country-03.jpg"
																alt="" border="0">
															<c:set var="mapIndex" value="${status.index + 1}" />
															<div class="card h-30">
																<div id="map${mapIndex}"
																	style="width: 100%; height: 210px; margin-top: -100%"></div>
															</div>

															<script>
							var mapContainer${mapIndex} = document.getElementById('map${mapIndex}'), // 지도를 표시할 div 
							    mapOption${mapIndex} = {
							        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
							        level: 4 // 지도의 확대 레벨
							    };  
							
							// 지도를 생성합니다    
							var map${mapIndex} = new kakao.maps.Map(mapContainer${mapIndex}, mapOption${mapIndex}); 
							
							// 주소-좌표 변환 객체를 생성합니다
							var geocoder = new kakao.maps.services.Geocoder();
							var address_name='${obj.community_place}';
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
							
							        // 인포윈도우로 장소에 대한 설명을 표시합니다
							      /*   var infowindow = new kakao.maps.InfoWindow({
							            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
							        });
							        infowindow.open(map, marker); */
							
							        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							        map${mapIndex}.setCenter(coords);
							    } 
							});    
							</script>
														</div>
													</div>
													<div class="col-lg-9 col-sm-6">
														<div class="right-content">
															<h4>
																<a
																	href="get?community_num=<c:out value="${obj.community_num}"/>"><b>${obj.community_title }</b></a>
															</h4>
															<span>${obj.community_place }</span>
															<%-- <div class="main-button">
																<a class='btn'
																	style="color: white; background-color: black; border: 0;"
																	href="get?community_num=<c:out value="${obj.community_num}"/>">상세
																	보기</a>
															</div> --%>
															<br>
															<ul class="info">
																<li style="text-align: left"><i class="fa fa-user"></i><b>${obj.user_info.user_nickname}</b></li>
																<li class="col-lg-2" style="text-align: left"><i>
																</i><b> </b></li>
																<li style="text-align: left"><i
																	class="fa fa-calendar"></i>${obj.community_date }</li>
															</ul>
															<ul class="info">
																<li style="text-align: left"><i class="fa fa-users"></i>${obj.community_schedule }</li>
																<li style="text-align: left"><i> </i><b> </b></li>
																<li style="text-align: left"><i class="fa fa-tags"></i>${obj.community_category }</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>

									</div>

								</div>
								<div class="d-flex justify-content-center">
									<div class="flex-column justify-content-center">
										<div class='page-list'>
											<ul class="pagination" style="margin-left: -33px">
												<c:if test="${pageMaker.prev}">
													<li class="page-item"><a
														href="${pageMaker.startPage -1}">Previous</a></li>
												</c:if>

												<c:forEach var="num" begin="${pageMaker.startPage}"
													end="${pageMaker.endPage}">
													<li class="page-item  ${pageMaker.cri.pageNum == num ? "active":""} ">
														<a class="page-link" href="${num}">${num}</a>
													</li>
												</c:forEach>
												<c:if test="${pageMaker.next}">
													<li class="page-item"><a
														href="${pageMaker.endPage +1 }">next</a></li>
												</c:if>
											</ul>
										</div>
										<c:if test="${not empty sessionScope.userInfo}">
											<div class="main-button" style="margin-left: -30px">
												<a class="btn" style="" id='regBtn'
													href='/community/selectAddress'>글쓰기</a>
											</div>
										</c:if>
										<form id='actionForm' action="/community/list" method='get'>
											<input type='hidden' name='pageNum'
												value='${pageMaker.cri.pageNum}'> <input
												type='hidden' name='amount' value='${pageMaker.cri.amount}'>
											<input type='hidden' name='type'
												value='<c:out value="${ pageMaker.cri.type }"/>'> <input
												type='hidden' name='keyword'
												value='<c:out value="${ pageMaker.cri.keyword }"/>'>
										</form>
										<br> <br>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>


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
	<script type="text/javascript">
		$(document).ready(function() {

			var result = '<c:out value="${result}"/>';
			var actionForm = $("#actionForm");
			$("#regBtn").on("click", function() {
				self.location = "/community/register";
			});
			var actionForm = $("#actionForm");

			$(".page-item a").on(
					"click",
					function(e) {

						e.preventDefault();

						console.log('click');

						actionForm.find("input[name='pageNum']")
								.val($(this).attr("href"));
						actionForm.submit();
					});

			$(".move")
					.on(
							"click",
							function(e) {

								e.preventDefault();
								actionForm
										.append("<input type='hidden' name='community_num' value='"
												+ $(this).attr(
														"href")
												+ "'>");
								actionForm.attr("action",
										"/community/get");
								actionForm.submit();

							});
			$("#searchForm button").on(
					"click",
					function(e) {

						if (!searchForm.find("option:selected")
								.val()) {
							alert("검색종류를 선택하세요");
							return false;
						}

						if (!searchForm.find(
								"input[name='keyword']").val()) {
							alert("키워드를 입력하세요");
							return false;
						}

						searchForm.find("input[name='pageNum']")
								.val("1");
						e.preventDefault();

						searchForm.submit();

					});
		});
	</script>
	<div id="footer">
		<c:import url="../footer.jsp" />
	</div>
</body>

</html>
