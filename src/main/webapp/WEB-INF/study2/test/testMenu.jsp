<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <jsp:include page="/include/bs5.jsp"></jsp:include>
	<title>testMenu.jsp</title>
</head>
<body>
	<p><br></p>
	<div class="container">
		<p>
			<a href="${ctp}/study2/Test1" class="btn btn-success">Test1</a>
		</p>
		<p>
			<a href="${ctp}/study2/Test2" class="btn btn-success">Test2</a>
		</p>
		<p>
			<a href="${ctp}/study2/T3" class="btn btn-success">Test3</a>
		</p>
		<p>
			<a href="${ctp}/study2/Test4" class="btn btn-success">Test4</a>
		</p>
		<p>
			<a href="${ctp}/study2/filter/T1_filter" class="btn btn-success">T1_filter</a>
		</p>
		<p>
			<a href="${ctp}/study2/init/login" class="btn btn-success">init login테스트</a>
		</p>
		<p>
			<a href="${ctp}/springGroup" class="btn btn-success">init login테스트</a>
		</p>
		<p>
			<a href="${ctp}/javaGroup" class="btn btn-success">init login테스트</a>
		</p>
	</div>
	<p><br></p>
</body>
</html>