<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html >

  <head>
	
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>리뷰 작성</title>

    <!-- Bootstrap core CSS -->
    <link href="../../resources/review/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="../../resources/review/assets/css/fontawesome.css">
    <link rel="stylesheet" href="../../resources/review/assets/css/templatemo-woox-travel.css">
    <link rel="stylesheet" href="../../resources/review/assets/css/owl.css">
    <link rel="stylesheet" href="../../resources/assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="../../resources/css/make.css" rel="stylesheet" />

	<link rel="stylesheet" type="text/css" href="../../resources/css/make.css">
<!--

TemplateMo 580 Woox Travel

https://templatemo.com/tm-580-woox-travel

-->
	<style>
		input[type=file]::file-selector-button {
		  width: 150px;
		  height: 30px;
		  background: #fff;
		  border: 1px solid rgb(77,77,77);
		  border-radius: 10px;
		  cursor: pointer;
		  }
		  input[type=file]::file-selector-button:hover {
		    background: rgb(68,47,30);
		    color: #fff;
		  }
		
	</style>

  </head>
<%
String place_name = request.getParameter("place_name");
String category_name = request.getParameter("category_name");
String address_name = request.getParameter("address_name");
String road_address_name = request.getParameter("road_address_name");

%>
<body>

  <!-- ***** Header Area Start ***** -->
 <div class=" bg-light">
		<header class="container ">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
	    		<a class="navbar-brand" href="/"><img src="/resources/img/logo2.png" class="img-fluid" alt="logo" style="height:24px; width:120px;"></a>
	    		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      			<span class="navbar-toggler-icon"></span>
	   			</button>
	   			<div class="collapse navbar-collapse " id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				    <c:choose>
				     <c:when test="${not empty sessionScope.userInfo}">
				        <li class="nav-item">
				          <a class="nav-link" href="/MyPage/MyPageReivew">마이페이지</a>
				        </li>
			          	<li class="nav-item">
				          <a class="nav-link active" aria-current="page" href="/user_login/logout">로그아웃</a>
				        </li>
				    </c:when>
				    <c:otherwise>
				    <li class="nav-item">
				    	<a class="nav-link active" aria-current="page" href="/user_login/login">로그인</a>
			    	</li>
			        <li class="nav-item">
			          <a class="nav-link" href="/user_login/join">회원가입</a>
			        </li>
				    </c:otherwise>
				    </c:choose>
				    <li class="nav-item dropdown">
				    	<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
	          		<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			            <li><a class="dropdown-item" href="/community/list?pageNum=1&amount=5&type=G&keyword=1-DAY-CLASS">1-DAY-CLASS</a></li>
			            <li><a class="dropdown-item" href="/community/list?pageNum=1&amount=5&type=G&keyword=카페 탐방">카페 탐방</a></li>
			            <li><a class="dropdown-item" href="/community/list?pageNum=1&amount=5&type=G&keyword=봉사 활동">봉사 활동</a></li>
			            <li><a class="dropdown-item" href="/community/list?pageNum=1&amount=5&type=G&keyword=나눔 카페">나눔 카페</a></li>
			            </ul>
			       </li>
	      		</ul>

		    </div>
		  </div>
		</nav>
		</header>
	</div>
  <!-- ***** Header Area End ***** -->


	<form action="reviewinsert" method="post" enctype="multipart/form-data" onsubmit="return selectTagchk(this);">
  <div class="reservation-form">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
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
        
        <div class="col-lg-12">
        	
			
          <div id="reservation-form">
          	
          	<div class="row">
          		<div class="more-info row">
					<div class="col-lg-6 col-sm-6">
					  
				    	<div class="info-item">
				            <i class="fas fa-coffee"></i>
				            <h5>카페 이름</h5>
				            <input type="hidden" name="review_Cafename" value='<c:out value="<%=place_name %>" />'></input>
				            <p><%=place_name %></p>
				         </div>
				     </div>
				     
				     <div class="col-lg-6 col-sm-6">
				    	<div class="info-item">
				            <i class="fa fa-map-marker"></i>
				            <h5>카페 위치</h5>
				            <input type="hidden" name="review_Cafeaddr" value='<c:out value="<%=address_name %>" />'></input>
							<p><%=address_name %></p>
				         </div>
				     </div>
				</div>

          	</div>
          	
            <div class="row  mt-5">
              
              <div class="col-lg-6 mb-3">
                  <fieldset>
                      <h5 class="mt-2">방문목적</h5>
                      
                      	<p class="mt-3 me-3">
							<c:forEach items="${getTagList1}" var="tag1">
										<input type="checkbox" name="review_SelectTag1"
											id="review_SelectTag1" value="${tag1.tag_Content}" /><span>${tag1.tag_Content} </span> 
		                     </c:forEach>
		                 </p>
						
                  </fieldset>
              </div>
              <div class="col-lg-6 mb-3">
                <fieldset>
 					<h5 class="mt-2">분위기</h5>
                      	<p class="mt-3 me-3">
							<c:forEach items="${getTagList2}" var="tag2">
										<input type="checkbox" name="review_SelectTag2"
											id="review_SelectTag2" value="${tag2.tag_Content}" /><span>${tag2.tag_Content} </span> 
		                     </c:forEach>
		                 </p>
                </fieldset>
              </div>
              <div class="col-lg-6">
                  <fieldset>
                      	<h5 class="mt-2 mb-3">편의시설</h5>
                      	<p class="mt-3 me-3">
							<c:forEach items="${getTagList3}" var="tag3">
										<input type="checkbox" name="review_SelectTag3"
											id="review_SelectTag3" value="${tag3.tag_Content}" /><span>${tag3.tag_Content} </span> 
		                     </c:forEach>
		                 </p>
                  </fieldset>
              </div>
              <div class="col-lg-6 mb-3 hashtaglist">
                <fieldset>
						<h5 class="mt-2 ">해쉬태그</h5>
						
							<div class="form-group mt-1">
			                    <input type="hidden" value="" name="review_HashTag" id="review_HashTag" />
			                </div>
							<div class="form-group">
			                     <input type="text" id="tag" size="7"
			                        placeholder="태그 작성 후 스페이스를 눌러주세요" style="width: 330px;" />
			                </div>
			                <p class="mb-0"><ul id="tag-list" ></ul></p>
						
                </fieldset>
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
						            tagList[index] = "NULL";

						            $("#review_HashTag").val(tagList);

			                        $(this).parent().remove();
			                    });
			               })
			            </script>                
              </div>

              <div class="col-lg-12 mt-2">
       
                  <fieldset>
                    <input type="hidden" id="user_Id" name="user_Id" value='<c:out value="${sessionScope.userInfo.user_id}"/>'>
                  
                  	<label for="chooseDestination" class="form-label">제목</label>
                  	<input type="text" name="review_Title" placeholder=" 제목을 입력하세요!">
                  	
                      <label for="chooseDestination" class="form-label">내용</label>
                      <textarea  rows="12" name="review_Content"></textarea>
                  </fieldset>
              </div>
              <div>
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
		                  <div class="uploadDiv" style="height: 250px; width: 350px;">	
		                     <input type="file" id="input_img" onchange="readURL(this);" name="review_Image1" multiple  />
		                     <br>
		                    
		                     	<img id="preview" src="#" style="height: 200px; width: 250px;" alt="선택된 이미지가 없습니다" onerror="this.src='/resources/img/imgaddalt.png';" >
		                  	 
		                  </div>
		
		
		               </div>
		            </div>
		
		            <!-- 등록버튼 -->
		            <div class="ec-base-tab gFlex  row" style="padding:10px;">
		               <div class="board">
		                  <button type="submit" class="insert_btn btn ">등록</button>	
		               </div>
		            </div>

				
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </form>
	<footer class="py-5 bg-light">
		<div class="container">
		<p class="m-0 text-center" style="color: #442f1e;"> <strong>Copyright &copy;Project Team522</strong></p>
		</div>
	</footer>


  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
  <script src="../../resources/review/vendor/jquery/jquery.min.js"></script>
  <script src="../../resources/review/vendor/bootstrap/js/bootstrap.min.js"></script>

  <script src="../../resources/review/assets/js/isotope.min.js"></script>
  <script src="../../resources/review/assets/js/owl-carousel.js"></script>
  <script src="../../resources/review/assets/js/wow.js"></script>
  <script src="../../resources/review/assets/js/tabs.js"></script>
  <script src="../../resources/review/assets/js/popup.js"></script>
  <script src="../../resources/review/assets/js/custom.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../../resources/js/scripts.js"></script>
  <script>
    $(".option").click(function(){
      $(".option").removeClass("active");
      $(this).addClass("active"); 
    });
  </script>
  <script>
  function selectTagchk(form){
  	var check_form1=document.getElementsByName('review_SelectTag1');
  	var check_form2=document.getElementsByName('review_SelectTag2');
  	var check_form3=document.getElementsByName('review_SelectTag3');

  	var checknum1=0;
  	var checknum2=0;
  	var checknum3=0;

  	for(var i=0;i<check_form1.length;i++){
  		if(check_form1[i].checked){
  			checknum1++;
  			
  		}
  	}
  	for(var i=0;i<check_form2.length;i++){
  		if(check_form2[i].checked){
  			checknum2++;
  			
  		}
  	}
  	for(var i=0;i<check_form3.length;i++){
  		if(check_form3[i].checked){
  			checknum3++;
  			
  		}
  	}

  	if(!checknum1){
  		alert('방문목적을 하나이상 선택해주시기 바랍니다');
  		return false;
  	}
  	if(!checknum2){
  		alert('분위기를 하나이상 선택해주시기 바랍니다');
  		return false;
  	}
  	if(!checknum3){
  		alert('편의시설을 하나이상 선택해주시기 바랍니다');
  		return false;
  	}

  }
  </script>

  </body>

</html>
