<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
<c:forEach items="${List}" var="review">
  <div>
 	<form action='getReview' method='GET'>
    <h4>카페 이름: ${review.review_Cafename}</h4>
    <h4>카페 주소: ${review.review_Cafeaddr}</h4>
    <h4>리뷰 제목: ${review.review_Title}</h4>
    <h4>리뷰 작성일: ${review.review_Date}</h4>
     <input type="hidden" name="Rnum" value="${review.review_Num}">
    <button type="submit">작성 리뷰 보기</button>
    </form>
  </div>
</c:forEach>
</body>
</html>