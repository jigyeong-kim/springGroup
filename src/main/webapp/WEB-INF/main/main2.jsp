<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
   <jsp:include page="/include/bs5.jsp"></jsp:include>
	<title>main2.jsp</title>
</head>
<body>
	<p><br></p>
	<div class="container text-center">
		<h2>Hellowwwwwwwwwwww</h2>
		<hr>
		<div>
			<img alt="" src="images/3.jpg" width="400px">
		</div>	
		<hr>
		<p>
			<a href="${ctp}/study2/TestMenu" class="btn btn-success">Test</a>
		</p>
	</div>
	<p><br></p>
</body>
</html>