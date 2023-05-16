<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	
<meta name="description" content="" />
<meta name="author" content="" />
<title>리뷰 수정</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />

<link href="../../resources/css/styles.css" rel="stylesheet" />
<link href="../../resources/css/make.css" rel="stylesheet" />

<link rel="stylesheet" type="text/css"
	href="../../resources/css/make.css">
<!-- API -->
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=t8jd1zo1li"></script>

</head>

<body>

	<!-- Review section-->
	<form action="reviewmodify" method="post" enctype="multipart/form-data">
		<section class="py-5">
			<div class="container px-4 px-lg-5 my-5">
				<div class="row gx-4 gx-lg-5 align-items-center">

					<div class="bigImg col-md-6">
						<script
							src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

						<link rel="stylesheet"
							href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
							integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
							crossorigin="anonymous">
							
							<!-- 지도 설정 -->
						<p style="margin-top:-12px">

</p>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cbeb53fc639beafda1dfcf096df608fc&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 1 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
var address_name='${review.review_Cafeaddr}';
// 주소로 좌표를 검색합니다
geocoder.addressSearch((address_name), function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
      /*   var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        });
        infowindow.open(map, marker); */

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
						
					</div>

					<div class="row col-md-6">
						<div class="row-md-6">
							<div class="fs-5 mb-5">

								<!-- 카페이름 -->
								<div class="case">
									<div class="input_wrap">
										<input type="hidden" name="review_Cafename" value='<c:out value="${review.review_Cafename }" />'></input>
										<span>카페 이름 </span>&nbsp;<c:out value="${review.review_Cafename }" /><span>
										</span> <span> <i class="fas fa-map-marker-alt"
											class="case_search_btn" id="search_btn"></i>
										</span>
									</div>
									<div class="suggestions suggestions_pannel"></div>
									<br>
									<div>
										<div class="input_wrap">
											<input type="hidden" name="review_Cafeaddr"value='<c:out value="${review.review_Cafeaddr }" />'></input>
											<span>카페 위치 </span>&nbsp;<c:out value="${review.review_Cafeaddr }" />										</div>
									</div>
									<div class="suggestions suggestions_pannel"></div>
									<i class="fa-solid fa-magnifying-glass"></i>
								</div>

							</div>

							<!--js파일 호출 index.js -->
							<script type="text/javascript" src="../../resources/js/make.js"></script>
						</div>

					</div>

				</div>
			</div>

		</section>

		<section>
			<div></div>
			<div class="container px-4 px-lg-5 mt-5">
				<!-- 방문 목적 -->
				<div id="visit" class="ec-base-tab gFlex row">
					<input type="hidden" id="review_Num" name="review_Num" value='<c:out value="${review.review_Num}"/>'>
					
					<div class="cont">
						<h3>방문목적</h3>

						<div>
							<fieldset>
								<c:set var="orgTag" value="${review.review_SelectTag1 }"/>
								<c:forEach items="${getTagList1}" var="tag1">
									<c:set var='listTag' value="${tag1.tag_Content}"/>
									<%
										String orTag=(String)pageContext.getAttribute("orgTag");
										String liTag=(String)pageContext.getAttribute("listTag");
										
										if(orTag.contains(liTag)){
									%>
										<input type="checkbox" name="review_SelectTag1"
										value="${tag1.tag_Content}" checked />
										${tag1.tag_Content}
									<%} else{ %>
										<input type="checkbox" name="review_SelectTag1"
										value="${tag1.tag_Content}" />
										${tag1.tag_Content}
									<%} %>
									
								</c:forEach>
							</fieldset>
						</div>
						<div style="text-align: center;"></div>
						<div style="text-align: center;"></div>
						<div style="text-align: center;"></div>
						<div style="text-align: center;">
							<br>
						</div>
					</div>
				</div>
				<!-- 분위기 -->
				<div id="mood" class="ec-base-tab gFlex row">
					<div class="cont">
						<h3>분위기</h3>
						<fieldset>
								<c:set var="orgTag" value="${review.review_SelectTag2 }"/>
								<c:forEach items="${getTagList2}" var="tag2">
									<c:set var='listTag' value="${tag2.tag_Content}"/>
									<%
										String orTag=(String)pageContext.getAttribute("orgTag");
										String liTag=(String)pageContext.getAttribute("listTag");
										
										if(orTag.contains(liTag)){
									%>
										<input type="checkbox" name="review_SelectTag2"
										value="${tag2.tag_Content}" checked />
										${tag2.tag_Content}
									<%} else{ %>
										<input type="checkbox" name="review_SelectTag2"
										value="${tag2.tag_Content}" />
										${tag2.tag_Content}
									<%} %>
									
								</c:forEach>						
						</fieldset>
						<br>
					</div>
					<div class="cont"></div>
					<div class="cont"></div>

				</div>
				<!-- 편의시설 -->
				<div id="amenities" class="ec-base-tab gFlex  row">
					<div class="board">
						<h3>편의시설</h3>
						<fieldset>
								<c:set var="orgTag" value="${review.review_SelectTag3 }"/>
								<c:forEach items="${getTagList3}" var="tag3">
									<c:set var='listTag' value="${tag3.tag_Content}"/>
									<%
										String orTag=(String)pageContext.getAttribute("orgTag");
										String liTag=(String)pageContext.getAttribute("listTag");
										
										if(orTag.contains(liTag)){
									%>
										<input type="checkbox" name="review_SelectTag3"
										value="${tag3.tag_Content}" checked />
										${tag3.tag_Content}
									<%} else{ %>
										<input type="checkbox" name="review_SelectTag3"
										value="${tag3.tag_Content}" />
										${tag3.tag_Content}
									<%} %>
									
								</c:forEach>	

						</fieldset>
						<br>

					</div>
				</div>

				<!-- 사용자 해쉬태그 -->

				<div id="userhashtag" class="ec-base-tab gFlex  row">
					<div class="board">
						<h3>해쉬태그구현</h3>
						<div class="form-group">
							<input  value="" name="review_HashTag"
								id="review_HashTag" />
						</div>
						<div class="form-group">
							<input type="text" id="tag" size="7" placeholder="해시태그를 등록해주세요."
								style="width: 300px;" />
						</div>
						<ul id="tag-list">
							<c:if test="${not empty hashtagarray}">
								
								<ul id="tag-list">
									<c:forEach items="${hashtagarray}" var="hasharr">
										<li class='tag-item'><c:out value='${hasharr}' /><span class='del-btn' idx='${hashtagarray}'>x</span></li>
										
									</c:forEach>
								</ul>
							</c:if>
						</ul>


					</div>
				</div>
				<script>
				    $(document).ready(function () {
				        var tag = {};
				        var counter = 0;
				        var tagList= [] ;
				        var tagll='${hashtagarray}';
				        tagList.push(tagll);
				        $("#review_HashTag").val(tagList);
				        var taglen = tagll.length;
				        console.log(taglen);
				        console.log(tagll);

				        
				        
				        // 입력한 값을 태그로 생성한다.
				        function addTag (value) {
				            tag[counter] = value;
				            counter++; // del-btn 의 고유 id 가 된다.
				        }
				
				        // tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
				        function marginTag () {
				            return Object.values(tag).filter(function (word) {
				                return word !== "";
				            });
				        }
				
				        $("#tag").on("keypress", function (e) {
				            var self = $(this);
				
				            //엔터나 스페이스바 눌렀을때 실행
				            if (e.key === "Enter" || e.keyCode == 32) {
				
				                var tagValue = self.val(); // 값 가져오기
				
				                // 해시태그 값 없으면 실행X
				                if (tagValue !== "") {
				
				                    // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
				                    var result = Object.values(tag).filter(function (word) {
				                        return word === tagValue;
				                    })
				                
				                    // 해시태그가 중복되었는지 확인
				                    if (result.length == 0) { 
				                        $("#tag-list").append("<li class='tag-item'>"+tagValue+"<span class='del-btn' idx='"+counter+"'>x</span></li>");
				                        addTag(tagValue);
				                        self.val("");
				                        tagList.push(tagValue);
				                        
				                        $("#review_HashTag").val(tagList);
				                    } else {
				                        alert("태그값이 중복됩니다.");
				                    }
				                }
				                e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
				            }
				        });
				
				        // 삭제 버튼 
				        // 인덱스 검사 후 삭제
				        $(document).on("click", ".del-btn", function (e) {
				            var index = $(this).attr("idx");
				            tag[index] = "";
				            tagList[index] = "";
				            $("#review_HashTag").val(tagList);
				            $(this).parent().remove();
				        });
					})
				</script>
				
				<!-- 리뷰 내용 -->
				<div id="reviewcontents" class="ec-base-tab gFlex  row">
					<div class="board">
						<h3>리뷰 제목, 내용</h3>
						<form>
							<input type="text" name="review_Title" value='<c:out value="${review.review_Title }"/>'
								style="width: 450px;"> <br> <br>
							<textarea rows="10" cols="70" name="review_Content"><c:out
								value="${review.review_Content}" /></textarea>
						</form>


					</div>
				</div>
							
				<input type="hidden" id="review_Num" name="review_Num" value='<c:out value="${review.review_Num}"/>'>
				
				<!-- 사진 선택 -->
<!-- 				<div id="reviewimgselect" class="ec-base-tab gFlex  row">
					<div class="board">
						<h3>사진선택</h3>
						<div class="uploadDiv">
							<input type="file" id="input_img" name="review_Image1" multiple />
						</div>


					</div>
				</div> -->

				<!-- 등록버튼 -->
				<div class="ec-base-tab gFlex  row">
					<div class="board">
						<h3>등록버튼</h3>
						<button type="submit" id="modibutton">수정</button>

					</div>
				</div>
			</div>
		</section>
	</form>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2023</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../../resources/js/scripts.js"></script>
</body>

</html>


