<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>Community</title>

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

TemplateMo 580 Woox Travel

https://templatemo.com/tm-580-woox-travel

-->

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var formObj = $("form[name='readForm']");

						// 수정 
						$(".update_btn").on("click", function() {
							formObj.attr("action", "/community/modify");
							formObj.attr("method", "get");
							formObj.submit();
						})

						// 삭제
						$(".delete_btn").on("click", function() {

							var deleteYN = confirm("삭제하시겠습니까?");
							if (deleteYN == true) {

								formObj.attr("action", "/community/remove");
								formObj.attr("method", "post");
								formObj.submit();

							}
						})

						// 목록
						$(".list_btn").on("click", function() {

							location.href = "/community/list";
						})

						$(".replyWriteBtn").on(
								"click",
								function() {
									var formObj1 = $("form[name='replyForm']");
									formObj1.attr("action",
											"/community/replyRegister");
									formObj1.submit();
								});

						//댓글 수정 View
						$(".replyUpdateBtn")
								.on(
										"click",
										function() {
											/* location.href = "/board/replyUpdateView?bno=${read.bno}"
												+ "&page=${scri.page}"
												+ "&perPageNum=${scri.perPageNum}"
												+ "&searchType=${scri.searchType}"
												+ "&keyword=${scri.keyword}"
												+ "&rno="
												+ $(this).attr("data-rno"); */
											/* formObj.attr("action", "/community/modifyReply");
											formObj.attr("method", "get");
											formObj.submit(); */
											location.href = "/community/modifyReply?comment_num="
													+ $(this).attr(
															"data-comment_num");
										});

						//댓글 삭제 View
						$(".replyDeleteBtn")
								.on(
										"click",
										function() {
											location.href = "/community/removeReply?comment_num="
													+ $(this).attr(
															"data-comment_num");
										});
					})
</script>
</head>

<body style="background-color: white;">

	<!-- ***** Preloader Start ***** -->
	<!-- <div id="js-preloader" class="js-preloader" style="background-color:white;">
		<div class="preloader-inner" style="background-color:white;">
			<span class="dot" style="background-color:white;"></span>
			<div class="dots" style="background-color:white;">
				<span></span> <span></span> <span></span>
			</div>
		</div>
	</div> -->
	<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
	<symbol id="bootstrap" viewBox="0 0 118 94">
	  <title>나만의 작은 공간 카페 리뷰 사이트 마이카페</title>
	  <path fill-rule="evenodd" clip-rule="evenodd"
			d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"></path>
	</symbol>
   </svg>



	<!-- 맨위 로그인창 -->
	<div id="nav">
		<c:import url="../nav.jsp" />
	</div>

	<div class="reservation-form" style="background-color: white;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<form id="reservation-form" name="readForm" method="post"
						role="form" style="background-color: rgb(248, 249, 250);">
						<div class="row">
							<div class="col-lg-12">
								<h4>소모임 조회</h4>
							</div>
							<fieldset>
								<input type="hidden" id="community_num" name="community_num"
									value="${community.community_num}">
							</fieldset>
							<div class="col-lg-6">
								<fieldset>
									<label for="Name" class="form-label">작성자</label> <input
										type="text" name='user_id' class="form-control"
										value="${community.user_info.user_nickname}"
										readonly="readonly">
								</fieldset>
							</div>
							<div class="col-lg-6">
								<fieldset>
									<label for="Title" class="form-label">소모임 제목</label> <input
										type="text" class="form-control" name='community_title'
										value="${community.community_title}" readonly="readonly">
								</fieldset>
							</div>
							<div class="col-lg-6">
								<fieldset>
									<label for="Title" class="form-label">카테고리</label> <input
										type="text" class="form-control" name='community_category'
										value="${community.community_category}" readonly="readonly">
								</fieldset>
							</div>
							<div class="col-lg-6">
								<fieldset>
									<label for="Number" class="form-label">소모임 일정</label> <input
										type="date" name="community_schedule" class="form-control"
										value="${community.community_schedule}" readonly="readonly">
								</fieldset>
							</div>
							<div class="col-lg-6">
								<fieldset>
									<label for="address" class="form-label">소모임 장소</label> <input
										type="text" name="community_place" class="form-control"
										value="${community.community_place}" readonly="readonly">
								</fieldset>
							</div>
							<div class="col-lg-6">
								<fieldset>
									<label for="address" class="form-label">좌표</label> <input
										type="text" name="community_map" class="form-control"
										value="${community.community_map}" readonly="readonly">
								</fieldset>
							</div>
							<div class="col-lg-12">
								<fieldset>
									<label for="chooseDestination" class="form-label">소모임
										내용</label>
									<div class="input-group">
										<span class="input-group-text"></span>
										<textarea class="form-control h-25" rows="15"
											aria-label="With textarea" readonly="readonly"><c:out
												value="${community.community_context}" /></textarea>
									</div>
								</fieldset>
								<br> <br>
							</div>

							<div class="col-lg-4">
								<c:if
									test="${community.user_id == sessionScope.userInfo.user_id}">
									<button type="button" class="update_btn">수정</button>
									<button type="button" class="delete_btn btn btn-primary">삭제</button>

								</c:if>
									<button type="button" class="list_btn btn btn-primary">목록</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="visit-country">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<c:forEach items="${commentList}" var="obj" varStatus="status">
						<div class="items">
							<div class="row">
								<div class="col-lg-12">
									<div class="item">
										<div class="row">
											<div class="col-lg-8 col-sm-7">
												<div class="right-content">
													<span>${obj.ori_Reply.user_info.user_nickname}/${obj.ori_Reply.comment_date}</span>

													<div class="main-button">
														<c:set var="replyIndex" value="${status.index + 1}" />
														<c:if
															test="${obj.ori_Reply.user_id == sessionScope.userInfo.user_id}">
															<a class="replyUpdateBtn" style="color: black;"
																data-comment_num="${obj.ori_Reply.comment_num}">수정</a>
															<a class="replyDeleteBtn" style="color: black;"
																data-comment_num="${obj.ori_Reply.comment_num}">삭제</a>
														</c:if>
														<c:if test="${not empty sessionScope.userInfo}">
															<a class="reReplyRegisterBtn${replyIndex}"
																style="color: black;"
																data-comment_num="${obj.ori_Reply.comment_num}">답글</a>
														</c:if>
													</div>
													<h5>${obj.ori_Reply.comment_contents}</h5>
													<div class="reReply-form${replyIndex}"
														style="display: none;">
														<div class="container">
															<div class="row">
																<div class="col-lg-12">
																	<form id="reReply-form" name="gs" method="post"
																		action="/community/replyRegister">
																		<div class="row">
																			<input type="hidden" name="community_num"
																				value="${community.community_num}"> <input
																				type="hidden" name="comment_ori_number"
																				value="${obj.ori_Reply.comment_num}"> <input
																				type="hidden" name="user_id"
																				value="${sessionScope.userInfo.user_id}">
																			<div class="col-lg-12">
																				<fieldset>
																					<br>
																					<div class="input-group mb-3">
																						<span class="input-group-text">${sessionScope.userInfo.user_id}</span>
																						<input type="text" name="comment_contents"
																							class="form-control" aria-label="댓글 내용">
																						<button class="btn btn-outline-secondary"
																							type="submit" id="button-addon1">등록</button>
																					</div>
																				</fieldset>
																			</div>
																		</div>
																	</form>
																</div>
															</div>
														</div>
													</div>
													<script>
														document
																.querySelector(
																		'.reReplyRegisterBtn${replyIndex}')
																.addEventListener(
																		'click',
																		function() {
																			// Show reservation-form and hide main-button
																			document
																					.querySelector('.reReply-form${replyIndex}').style.display = 'block';
																			/* document
																					.querySelector('.main-button').style.display = 'none'; */
																		});
													</script>
												</div>
											</div>
										</div>
									</div>
								</div>
								<c:forEach items="${obj.list}" var="reobj">
									<div class="col-lg-12">
										<div class="item">
											<div class="row">
												<div class="col-lg-8 col-sm-7">
													<div class="right-content" style="margin-left: 30px;">
														<span>${reobj.user_info.user_nickname}/${reobj.comment_date}</span>
														<c:if
															test="${reobj.user_id == sessionScope.userInfo.user_id}">
															<div class="main-button">
																<a class="replyUpdateBtn"
																	data-comment_num="${reobj.comment_num}">수정</a> <a
																	class="replyDeleteBtn"
																	data-comment_num="${reobj.comment_num}">삭제</a>
															</div>
														</c:if>
														<h5>${reobj.comment_contents}</h5>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${not empty sessionScope.userInfo}">
		<div class="reservation-form">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<form id="reservation-form" name="gs" method="post"
							action="/community/replyRegister">
							<div class="row">
								<p>
									<input type="hidden" name="community_num"
										value="${community.community_num}">
								</p>
								<div class="col-lg-6">
									<fieldset>
										<label for="Name" class="form-label">작성자</label> <input
											type="text" name="user_id"
											value="${sessionScope.userInfo.user_id}" readonly="readonly">
									</fieldset>
								</div>
								<div class="col-lg-12">
									<fieldset>
										<label for="Name" class="form-label">내용</label> <input
											type="text" name="comment_contents">
									</fieldset>
									<br>
								</div>
								<div class="col-lg-2">
									<fieldset>
										<button type="submit">등록</button>
									</fieldset>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</c:if>



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

	<!--   <script>
    $(".option").click(function(){
      $(".option").removeClass("active");
      $(this).addClass("active"); 
    });
  </script>
 -->

	<div id="footer">
		<c:import url="../footer.jsp" />
	</div>
</body>

</html>
