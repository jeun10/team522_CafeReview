$(document).ready(function () {		
    var category_group_code = "CE7"; // CE7은 카페, 커피전문점 카테고리 코드입니다.
    var pageSize = 15; // 한 페이지에 보여줄 검색결과 개수
    var currentPage = 1; // 현재 페이지
    var category_name = "카페, 커피전문점"
    function searchKeyword() {
      $.ajax({
        method: "GET",
        url: "https://dapi.kakao.com/v2/local/search/keyword",
        data: {
          query: $("#CafeName").val(),
          category_group_code: category_group_code,
          page: currentPage,
          size: pageSize
        },
        headers: { Authorization: "KakaoAK 14f0ec8498623bf43485b341276362d0" },
      })
        .done(function (msg) {
          var totalCnt = msg.meta.total_count;
          var totalPage = Math.ceil(totalCnt / pageSize);
          var documents = msg.documents;
          var resultHtml = "";

          resultHtml += "<table class='table manage-candidates-top mb-0'>";


for (var i = 0; i < documents.length; i++) {
var document = documents[i];
if (document.category_name.includes("음식점 > 카페")) {
  resultHtml += "<tbody>";
  resultHtml += "<tr class='candidates-list'>";
  resultHtml += "<td class=''>";
  resultHtml += "<div class='thumb'>";
  resultHtml += "</div>";
  resultHtml += "<div class='candidate-list-details'>";
  resultHtml += "<div class='candidate-list-info'>";
  resultHtml += "<div class='candidate-list-title' id='results'>";
  resultHtml += "<h5 style='font-size: clamp(15px, 2vw, 20px)' class='mb-0'><a href='#'>"+document.place_name+"</a></h5>";
  resultHtml +="</div>";
  resultHtml += "<div class='candidate-list-option'>";
  resultHtml += "<ul class='list-unstyled'>";
  resultHtml += "<li  style='font-size: clamp(10px, 2vw, 13px)'><i class='fas fa-map-marker-alt pr-1'></i>"+document.address_name+"</li>";
  resultHtml += "</ul>";
  resultHtml += "</div>";
  resultHtml += "</div>";
  resultHtml += "</div>";
  resultHtml += "</td>";

  resultHtml += "<td class='candidate-list-favourite-time text-center'>"
  resultHtml += "<form action='insertReview' method='GET' id='review-form'>";
  resultHtml += "<input type='hidden' name='place_name' value='" + document.place_name + "'/>";
  resultHtml += "<input type='hidden' name='category_name' value='" + document.category_name + "'/>";
  resultHtml += "<input type='hidden' name='address_name' value='" + document.address_name + "'/>";
  resultHtml += "<input type='hidden' name='road_address_name' value='" + document.road_address_name + "'/>";
  resultHtml += "<button type='submit' class='btn btn-danger' data-toggle='tooltip' title='' data-original-title='Edit' style='font-size: clamp(15px, 2vw, 20px); border: 1.3px solid #774c2a; color: #56361d;'>리뷰 작성</button>";
  resultHtml += "</form>";
  resultHtml += "<td class='candidate-list-favourite-time text-center'>"
  resultHtml += "</td>";
}
}
resultHtml += "</table>";
$("#results").html(resultHtml);

//선택 버튼 데이터 처리 함수
function selectAllDocuments() {
$(".document-checkbox").prop("checked", true);
}

$("#select-all").on("click", function () {
selectAllDocuments();
});


//선택 버튼 데이터 처리 함수
function getSelectedDocuments() {
var selectedDocuments = [];

$(".document-checkbox:checked").each(function () {
  var index = $(this).parent().index();
  selectedDocuments.push(documents[index]);
});

return selectedDocuments;
}


//페이지네이션 버튼 생성 함수
function makePaginationHtml() {
	var paginationHtml = "";
	var totalPage = Math.ceil(totalCnt / pageSize);
	var maxPageNum = totalPage < 3 ? totalPage : 3;
	//add hover style for active page
	paginationHtml += '<ul class="pagination justify-content-center mb-0">';
	paginationHtml += '<li class="page-item " id="pagination"></li>';
	for (var i = 1; i <= maxPageNum; i++) {
	  if (i == currentPage) {
	  	paginationHtml += '<li class="page-item active" aria-current="page"><span class="page-link" style="color: #ffffff; background-color: #442f1e; border: 1px solid #442f1e; cursor: default;">' + i + '</span></li>';
	  } else {
	  	paginationHtml += '<li class="page-item"><a class="page-link paginationBtn" href="#" data-page="' + i + '" style="color: #774c2a; background-color: transparent;" onmouseover="this.style.color=\'#ffffff\'; this.style.backgroundColor=\'#442f1e\'" onmouseout="this.style.color=\'#774c2a\'; this.style.backgroundColor=\'transparent\'">' + i + '</a></li>';
	
	  }
	}
	paginationHtml += "</ul>";
	$("#pagination").html(paginationHtml);
	var paginationHtml = "";
	var totalPage = Math.ceil(totalCnt / pageSize);
	var maxPageNum = totalPage < 3 ? totalPage : 3;
	
	paginationHtml += '<div class="page-list">';
	paginationHtml += '<ul class="pagination  mt-3">';
	for (var i = 1; i <= maxPageNum; i++) {
	  if (i == currentPage) {
	  	paginationHtml += '<li class="page-item active" aria-current="page"><span class="page-link" style="color: #ffffff; background-color: #442f1e; border: 1px solid #774c2a; cursor: default;">' + i + '</span></li>';
	
	  } else {
	  	paginationHtml += '<li class="page-item"><a class="page-link paginationBtn" href="#" data-page="' + i + '" style="color: #774c2a; background-color: transparent;" onmouseover="this.style.color=\'#ffffff\'; this.style.backgroundColor=\'#442f1e\'" onmouseout="this.style.color=\'#774c2a\'; this.style.backgroundColor=\'transparent\'">' + i + '</a></li>';
	  }
	}
	paginationHtml += '</ul>';
	paginationHtml += '</div>';
	
	$("#pagination").html(paginationHtml);
	}
          
//페이지 버튼 클릭 시 이벤트
$(document).on("click", ".btn-page", function () { // class명을 "btn-page"로 변경
	 alert("btn-page alert 테스트");
currentPage = $(this).data("page"); // 현재 페이지 변경
searchKeyword(); // 검색 함수 호출
});

makePaginationHtml(); // 페이지네이션 버튼 생성 함수 호출
})
.fail(function (msg) {
console.log(msg);
});
	}
    $("#search").click(function () {
      currentPage = 1; // 검색 버튼을 누를 때마다 currentPage를 1로 초기화
      searchKeyword(); // 검색 함수 호출
    });

    // 페이지 버튼 클릭 시 이벤트
    $(document).on("click", ".paginationBtn", function () {
      currentPage = $(this).data("page"); // 현재 페이지 변경
      searchKeyword(); // 검색 함수 호출
    });

 // 엔터 키 입력 이벤트 핸들러
    $(document).on("keypress", "#CafeName", function (e) {
    	  if (e.keyCode == 13) { // Enter key
    	    currentPage = 1;
    	    searchKeyword();
    	  }
    	});


  });