<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <jsp:include page="/include/bs5.jsp"></jsp:include>
	<title>test2.jsp</title>
</head>
<body>
	<p><br></p>
	<div class="container">
		<h2 class="text-center">이곳은 WEB-INF 폴더에 위치한 test2.jsp파일 입니다.</h2>
		<div>
			<img alt="" src="${ctp}/images/2.jpg" width="100%">
		</div>
		<hr>
		<div>
			<a href="${ctp}/study2/TestMenu" class="btn btn-success">메뉴로이동</a>
		</div>
	</div>
	<p><br></p>
</body>
</html>