<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%
request.setCharacterEncoding("UTF-8");
%>

<script>

alert("가입이 완료되었습니다. 로그인 페이지로 이동합니다.");
location.href="/user_login/login";
</script>