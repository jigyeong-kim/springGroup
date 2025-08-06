<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>test06.jsp</title>
</head>
<body>
	<p><br></p>
	<div class="container">
		<h2>전송방식(Get/Post)</h2>
		<p>Get방식1 : <a href="/springGroup/j0805/Test06_1?flag=1" class="btn btn-success">Test06_1서블릿 호출</a> </p>
		<p>Get방식2 : <a href="<%=request.getContextPath() %>/j0805/Test06_2?flag=2" class="btn btn-primary">Test06_2서블릿 호출</a> </p>
		<hr>
		<div>
		<form action="test06Ok.jsp" name="myform" method="post">
			<input type="submit" value="JSP전송(Post)" class="btn btn-info">
		</form>
		<hr>
		<form action="<%=request.getContextPath() %>/j0805/test06Ok" name="yourform" method="post">
			<!-- <input type="text" name="flag" value="3"> -->
			<input type="submit" value="Servlet전송(Post)" class="btn btn-secondary">
			<input type="hidden" name="flag" value="3">
		</form>
		</div>
	</div>
	<p><br></p>
</body>
</html>