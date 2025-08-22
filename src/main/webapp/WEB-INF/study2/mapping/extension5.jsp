<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <jsp:include page="/include/bs5.jsp"></jsp:include>
	<title>extension5.jsp</title>
</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<jsp:include page="/include/nav.jsp" />
	<br>
	<br>
	<div class="container">
		<h2>확장자 패턴 연습</h2>
		<hr>
		<div class="col"><a href="${ctp}/study2/mapping/Home5.test5" class="btn btn-success">Home5</a></div>
		<div class="col"><a href="${ctp}/study2/mapping/Guest5.test5" class="btn btn-primary">Guest5</a></div>
		<div class="col"><a href="${ctp}/study2/mapping/Board5.test5" class="btn btn-secondary">Board5</a></div>
		<div class="col"><a href="${ctp}/study2/mapping/Pds5.test5" class="btn btn-warning">PDS5</a></div>
		<hr>
		<div id="msg">${msg}</div>
	</div>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>