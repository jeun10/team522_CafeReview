<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>
</head>
<style>

</style>

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
						$(".replyWriteBtn").on("click", function() {
							var formObj = $("form[name='replyForm']");
							formObj.attr("action", "/community/replyRegister");
							formObj.submit();
						});
						//댓글 수정 View
						$(".replyUpdateBtn")
								.on(
										"click",
										function() {
											location.href = "/board/replyUpdateView?bno=${read.bno}"
													+ "&page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}"
													+ "&keyword=${scri.keyword}"
													+ "&rno="
													+ $(this).attr("data-rno");
										});
						//댓글 삭제 View
						$(".replyDeleteBtn")
								.on(
										"click",
										function() {
											location.href = "/board/replyDeleteView?bno=${read.bno}"
													+ "&page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}"
													+ "&keyword=${scri.keyword}"
													+ "&rno="
													+ $(this).attr("data-rno");
										});
					})
</script>

<body>
	<div class="container">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />

		<section id="container">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="community_num" name="community_num"
					value="${community.community_num}" />
			</form>

			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">제목</label> <input
					type="text" id="title" name="title" class="form-control"
					value="${community.community_title}" readonly="readonly" />
			</div>
			<div class="form-group">
				<label for="content" class="col-sm-2 control-label">내용</label>
				<textarea id="content" name="content" class="form-control"
					readonly="readonly">${community.community_context}"</textarea>
			</div>
			<div class="form-group">
				<label for="writer" class="col-sm-2 control-label">작성자</label> <input
					type="text" id="writer" name="writer" class="form-control"
					value="${community.user_id}" readonly="readonly" />
			</div>
			<div class="form-group">
				<label for="date" class="col-sm-2 control-label">작성날짜</label> <input
					type="text" id="date" name="date" class="form-control"
					value="${community.community_date}" readonly="readonly" />
			</div>
			<div class="form-group">
				<label for="date" class="col-sm-2 control-label">모임 날짜</label> <input
					type="text" id="schedule" name="schedule" class="form-control"
					value="${community.community_schedule}" readonly="readonly" />
			</div>
			<div class="form-group">
				<label for="address" class="col-sm-2 control-label">모임 장소</label> <input
					type="text" id="place" name="place" class="form-control"
					value="${community.community_place}" readonly="readonly" />
			</div>
			<div class="form-group">
				<label for="map" class="col-sm-2 control-label">좌표</label> <input
					type="text" id="map" name="map" class="form-control"
					value="${community.community_map}" readonly="readonly" />
			</div>

			<div>
				<button type="button" class="update_btn btn btn-primary">수정</button>
				<button type="button" class="delete_btn btn btn-primary">삭제</button>
				<button type="button" class="list_btn btn btn-primary">목록</button>
			</div>
			<br> <br>

			<!-- 댓글 -->
			<c:forEach items="${commentList}" var="obj">
				<div>
					<p>
						작성자 : ${obj.ori_Reply.user_id}<br /> 작성 날짜 :
						${obj.ori_Reply.comment_date}<br>
					</p>

					<p>${obj.ori_Reply.comment_contents}</p>
					<div>
						<button type="button" class="replyUpdateBtn btn btn-warning"
							data-rno="${obj.ori_Reply.comment_num}">수정</button>
						<button type="button" class="replyDeleteBtn btn btn-danger"
							data-rno="${obj.ori_Reply.comment_num}">삭제</button>
					</div>
				</div>
				<c:forEach items="${obj.list}" var="reobj">
					<div>
						<p>
							작성자 : ${reobj.user_id}<br /> 작성 날짜 : ${reobj.comment_date}<br>
						</p>

						<p>${reobj.comment_contents}</p>
						<div>
							<button type="button" class="replyUpdateBtn btn btn-warning"
								data-rno="${reobj.comment_num}">수정</button>
							<button type="button" class="replyDeleteBtn btn btn-danger"
								data-rno="${reobj.comment_num}">삭제</button>
						</div>
					</div>
				</c:forEach>
				<br>
				<br>
			</c:forEach>


			<form method="post" action="/community/replyRegister">
				<p>
					<label>댓글 작성자</label> <input type="text" name="user_id">
				</p>
				<p>
					<textarea rows="5" cols="50" name="comment_contents"></textarea>
				</p>
				<p>
					<input type="hidden" name="community_num" value="${community.community_num}">
					<button type="submit">댓글 작성</button>
				</p>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>