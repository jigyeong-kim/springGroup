<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <jsp:include page="/include/bs5.jsp"></jsp:include>
	<title>guest4.jsp</title>
</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<jsp:include page="/include/nav.jsp" />
	<div class="container">
		<br>
		<br>
		<h2>이곳은 guest4.jsp</h2>
		<h2>${msg}</h2>
		<hr>
		<div><a href="extension4.test4" class="btn btn-success">돌아가기</a></div>
	</div>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>