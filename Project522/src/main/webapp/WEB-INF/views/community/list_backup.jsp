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

<title>Hello, world!</title>
</head>
<body>
	<br>
	<h1 class="text-center">Prototype Community!</h1>
	<br>
	<div class="container">
		<table class="table align-middle table-hover table-striped text-center table-bordered table-sm">
			<thead>
				<tr>
					<td rowspan="2">map</td>
					<td colspan="2">title</td>
					<td>date</td>
				</tr>
				<tr>
					<td>writter</td>
					<td>schedule</td>
					<td>address</td>
				</tr>
			</thead>
			<c:forEach var='obj' items="${list}">
				<tbody>
					<tr>
						<td rowspan="2">${obj.community_map }</td>
						<td colspan="2"><a class='move'
							href='get?community_num=<c:out value="${obj.community_num}"/>'>
								${obj.community_title } </a></td>
						<td>${obj.community_date }</td>
					</tr>
					<tr>
						<td>${obj.user_id }</td>
						<td>${obj.community_schedule }</td>
						<td>${obj.community_place }</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		<div class="media-middle">
			<ul class="pagination center-block">
				<li><a href="#" style="margin-right: 5px;"
					class="text-secondary">◀</a></li>
				<li><a href="#" style="margin-right: 5px;"
					class="text-secondary">1</a></li>
				<li><a href="#" style="margin-right: 5px;"
					class="text-secondary">2</a></li>
				<li><a href="#" style="margin-right: 5px;"
					class="text-secondary">3</a></li>
				<li><a href="#" style="margin-right: 5px;"
					class="text-secondary">4</a></li>
				<li><a href="#" style="margin-right: 5px;"
					class="text-secondary">5</a></li>
				<li><a href="#" style="margin-right: 5px;"
					class="text-secondary">▶</a></li>
			</ul>
			<a class="btn btn-outline-info pull-right" id='regBtn' href='register'>글쓰기</a>
		</div>
	</div>
	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<!-- <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script> -->

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
</body>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var result = '<c:out value="${result}"/>';
						var actionForm = $("#actionForm");
						$("#regBtn").on("click", function() {
							self.location = "/community/register";
						});

						/* $(".move").on("click", function(e) { e.preventDefault();
							actionForm.append("<input type='hidden' name='community_num' value='"+ $(this).attr("href") + "'>");
							actionForm.attr("action","/community/get");
							actionForm.submit();
						}); */
			});
</script>
</html>