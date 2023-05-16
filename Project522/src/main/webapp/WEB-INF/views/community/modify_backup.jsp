<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"
	integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
	integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"
	integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js"
	referrerpolicy="origin"></script>

<script>
	tinymce.init({
		selector : '#mytextarea'
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#community_schedule').datepicker({
			language : "ko",
			autoclose : true
		})
	})
</script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>
<body>
	<div class="container">
		<h1>소모임 수정</h1>
		<form role="form" action="/community/modify" method="post">
			<input type='hidden' class="form-control" name='community_num'
				value='${community.community_num }'>
			<label>Title</label> <input class="form-control"
				name='community_title' value='${community.community_title}'>
			<label>address</label> <input class="form-control"
				name='community_place' value='${community.community_place}'>
			<label>map</label> <input class="form-control" name='community_map'
				value='${community.community_map}'> <label>category</label>
			<input class="form-control" name='community_category'
				value='${community.community_category}'> <label>writter</label>
			<input class="form-control" name='user_id'
				value='${community.user_id}' readonly="readonly"> <label>schedule</label>
			<input class="form-control" id="community_schedule" type="text"
				name='community_schedule'
				class="form-control bg-white border-0 small"
				value='${community.community_schedule}'> <br>
			<br>
			<textarea id="mytextarea" name="community_context"
				value='${community.community_context}'></textarea>
			<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
			<button type="reset" class="btn btn-default">Reset</button>
		</form>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
			crossorigin="anonymous">
			
		</script>
	</div>
</body>
</html>