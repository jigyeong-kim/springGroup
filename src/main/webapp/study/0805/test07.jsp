<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<title>Test07.jsp</title>
</head>
<body>
	<p><br></p>
	<div class="container">
		<h2>전송방식(Get/Post)</h2>
		<p>Get방식(1) : <a href="<%=request.getContextPath() %>/j0805/Test07?flag=1" class="btn btn-primary">Test07서블릿 호출</a> </p>
		<hr>
		<div>
			<form action="<%=request.getContextPath() %>/j0805/Test07" name="yourform" method="post">
				<!-- <input type="text" name="flag" value="3"> -->
				<input type="submit" value="Servlet전송(Post(1))" class="btn btn-secondary">
				<input type="hidden" name="flag" value="2">
			</form>
		</div>
	</div>
	<p><br></p>
</body>
</html>