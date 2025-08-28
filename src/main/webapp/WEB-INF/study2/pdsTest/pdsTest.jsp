<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <jsp:include page="/include/bs5.jsp"></jsp:include>
	<title>fileUpload.jsp</title>
</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<jsp:include page="/include/nav.jsp" />
	<div class="container">
		<h2>파일 업로드 연습(COS라이브러리)</h2>
		<hr>
		<div class="row">
			<div class="col">
				<a href="FileUpload1.st" class="btn btn-success">파일업로드1</a>
			</div>
			<div class="col">
				<a href="FileUpload2.st" class="btn btn-primary">파일업로드2</a>
			</div>
			<div class="col">
				<a href="FileUpload3.st" class="btn btn-info">파일업로드3</a>
			</div>
		</div>
		<br>
		<br>
		<div class="row">
		  	<div class="col">
		  		<a href="FileList.st" class="btn btn-primary form-control">파일목록보기</a>
		  	</div>
		  </div>
	</div>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>