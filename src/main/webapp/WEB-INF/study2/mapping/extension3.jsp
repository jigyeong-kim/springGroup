<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <jsp:include page="/include/bs5.jsp"></jsp:include>
	<title>extension3.jsp</title>
</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<jsp:include page="/include/nav.jsp" />
	<br>
	<br>
	<div class="container">
		<h2>확장자 패턴 연습</h2>
		<hr>
		<div class="col"><a href="${ctp}/study2/mapping/home3.test3" class="btn btn-success">Home3</a></div>
		<div class="col"><a href="${ctp}/study2/mapping/guest3.test3" class="btn btn-primary">Guest3</a></div>
		<div class="col"><a href="${ctp}/study2/mapping/board3.test3" class="btn btn-secondary">Board3</a></div>
		<div class="col"><a href="${ctp}/study2/mapping/pds3.test3" class="btn btn-warning">PDS3</a></div>
		<hr>
		<div id="msg">${msg}</div>
	</div>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>