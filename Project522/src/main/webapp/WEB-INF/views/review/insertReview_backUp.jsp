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
<title>리뷰 작성</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
   rel="stylesheet" />

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<link href="../../resources/css/styles.css" rel="stylesheet" />
<link href="../../resources/css/make.css" rel="stylesheet" />

<link rel="stylesheet" type="text/css"
   href="../../resources/css/make.css">
<!-- API -->


</head>
<%
String place_name = request.getParameter("place_name");
String category_name = request.getParameter("category_name");
String address_name = request.getParameter("address_name");
String road_address_name = request.getParameter("road_address_name");

%>
<body>
<%-- <div> <%=place_name %></div>
<div> <%=category_name %></div>
<div> <%=address_name %></div>
<div> <%=road_address_name %></div> --%>
	
	<!-- 맨위 헤더 -->
	<div class=" bg-light">
		<header class="container">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">
					<a class="navbar-brand" href="/">마이카페</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="user_login/login">로그인</a></li>
							<li class="nav-item"><a class="nav-link"
								href="user_login/register">회원가입</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
									커뮤니티 </a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
									<li><a class="dropdown-item" href="#">나눔 카페</a></li>
									<li><a class="dropdown-item" href="#">봉사 카페</a></li>
									<li><a class="dropdown-item" href="#">카페 투어</a></li>
									<li><a class="dropdown-item" href="#">자유 게시판</a></li>
								</ul></li>
	
						</ul>
						<form class="d-flex">
							<input class="form-control me-1" type="search"
								placeholder="Search" aria-label="조회할 카페 검색">
							<button class="btn btn-outline-dark" type="submit">Search</button>
						</form>
					</div>
				</div>
			</nav>
		</header>
	</div>
   <!-- Review section-->
   <form action="reviewinsert" method="post" enctype="multipart/form-data">
      <section class="py-5">
         <div class="container px-4 px-lg-5 my-5">
            <div class="row gx-4 gx-lg-5 align-items-center">

               <div class="bigImg col-md-6">
                  <script
                     src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

						<!-- 지도 설정 -->
						<p style="margin-top: -12px">
							<em class="link"> <a href="javascript:void(0);"
								onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
									혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요. </a>
							</em>
						</p>
						<div id="map" class="rounded-3" style="width:100%;height:350px;"></div>

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
						
						// 주소로 좌표를 검색합니다
						geocoder.addressSearch(('<%=address_name%>'), function(result, status) {
						
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
                     <div class="mb-3 mt-3">

                        <!-- 카페이름 -->
                        <div class="case">
                           <div class="input_wrap">
                           <input type="hidden" name="review_Cafename" value="<%=place_name %>"></input>
                              <span class="fs-5">카페 이름 </span>&nbsp;<%=place_name %>
                           </div>   

                           <div class="suggestions suggestions_pannel"></div>
                           <br>
                           <div>
                              <div class="input_wrap">
                              <input type="hidden" name="review_Cafeaddr"value="<%=address_name %>"></input>
                                 <span class="fs-5">카페 위치 <i class="fas fa-map-marker-alt"
                                 class="case_search_btn" id="search_btn"></i></span>&nbsp;<%=address_name %>
                              </div>
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
         <div class="container px-4 px-lg-5 mt-5"   >
         	<hr>
	         <div class="ec-base-tab gFlex row" style="margin-left: 25px;">

					<div class="row">
						<div id="visit" class="col-md-6 py-md-2 py-3">
							<!-- 방문 목적 -->
							<div class="p-4 text-start border border-secondary rounded-3">
								<h5 class="mt-1">방문목적</h5>
								<p class="mb-0">
									<c:forEach items="${getTagList1}" var="tag1">
										<input type="checkbox" name="review_SelectTag1"
											id="review_SelectTag1" value="${tag1.tag_Content}" /> ${tag1.tag_Content} 
		                        	</c:forEach>
								</p>
							</div>
						</div>
						<!-- 분위기 -->
						<div id="mood" class="col-md-6 py-md-2 py-3">

							<div class="p-4 text-start border border-secondary rounded-3">
								<h5 class="mt-1">분위기</h5>
								<p class="mb-0">
									<c:forEach items="${getTagList2}" var="tag2">
										<input type="checkbox" name="review_SelectTag2"
											id="review_SelectTag2" value="${tag2.tag_Content}" />${tag2.tag_Content}
		                    			</c:forEach>
								</p>
							</div>

						</div>
					</div>

					<div class="row">
						<!-- 사용자 편의시설 -->
						<div id="amenities" class="col-md-6 py-md-2 py-3">
							<div class="p-4 text-start border border-secondary rounded-3">
								<h5 class="mt-1">편의시설</h5>
								<p class="mb-0">
									 <c:forEach items="${getTagList3}" var="tag3">
				                        <input type="checkbox" name="review_SelectTag3" id="review_SelectTag3"  value="${tag3.tag_Content}" />
				                        ${tag3.tag_Content}
			                     	</c:forEach>
								</p>
							</div>
						</div>

						<!-- 사용자 해쉬태그 review_HashTag -->
			            <div  id="userhashtag" class="col-md-6 py-md-2 py-3">
							<div class="p-4 text-start border border-secondary rounded-3">
								
								<div class="form-group">
			                    	<input type="hidden" value="" name="review_HashTag" id="review_HashTag" />
			                  	</div>
								<div class="form-group">
			                     <input type="text" id="tag" size="7"
			                        placeholder="해시태그를 등록해주세요." style="width: 300px;" />
			                  </div>
			                  <p class="mb-0"><ul id="tag-list" ></ul></p>
 
			               </div>
			            </div>
			            
			            <!-- 체크박스 선택 안됐을때 값 처리 -->
			            <script>
			            $(document).ready(function() {
			
			            });
			            </script>
		           
						
		<!--             <div id="userhashtag" class="ec-base-tab gFlex  row">
		               <div class="board">
		                  <h3>해쉬태그</h3>
		                  <input type="text" name="review_HashTag"
		                     placeholder=" 해쉬태그를 입력하세요" style="width: 450px;">
		                  
		
		               </div>
		            </div> -->
			            <script>
			                $(document).ready(function () {       
			                   
			                    var tag = {};
			                    var counter = 0;
			                    var tagList= [];
			            
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
			                        $(this).parent().remove();
			                    });
			               })
			            </script>
	            </div>
	            
	            
	            <!-- 리뷰 내용 -->
	            <div id="reviewcontents" class="ec-base-tab gFlex row mt-3 ms-1">
	               <div class="col-md-5 board" style="width:100%;">
	                  <form>
	                     <label>제목</label><br>
	                     <input type="text" style="width:85%;" name="review_Title" placeholder=" 제목을 입력하세요!"> <br>
	                     <label>내용</label><br>
	                     <textarea style="width:85%;" rows="12"  name="review_Content"
	                        placeholder=" 내용을 입력하세요"></textarea>
	                  </form>
	
	
	               </div>
	               	            
		            <script type="text/javascript">
		               var sel_files=[];//이미지 정보들을 담는 배열
		               
		               function readURL(input) {
		                  var file = input.files[0];
		                  console.log(file)
		                  if (file != '') {
		                     var reader = new FileReader();
		                     reader.readAsDataURL(file);
		                     reader.onload = function(e) {
		                        console.log(e.target)
		                        console.log(e.target.result)
		                        $('#preview').attr('src', e.target.result);
		                     }
		                  }
		               }
		            </script>
		            <!-- 사진 선택 -->
		            <div id="reviewimgselect" class="ec-base-tab gFlex  row">
		               <div class="board">
		                  <h5>사진선택</h5>
		                  <div class="uploadDiv" style="height: 200px; width: 350px;">	
		                     <input type="file" id="input_img" onchange="readURL(this);" name="review_Image1" multiple  />
		                     <br>
		                     <img id="preview" src="#" width=200 height=150 alt="선택된 이미지가 없습니다" style="align-content: flex-end; ">
		                  </div>
		
		
		               </div>
		            </div>
		
		            <!-- 등록버튼 -->
		            <div class="ec-base-tab gFlex  row" style="padding:10px;">
		               <div class="board">
		                  <button type="submit" class="insert_btn btn btn-dark">등록</button>	
		               </div>
		            </div>
	               
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

