<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <jsp:include page="/include/bs5.jsp"></jsp:include>
	<title>jstl3.jsp</title>
</head>
<body>
	<p><br></p>
	<div class="container">
		<h2>JSTL Formatting</h2>
		<pre>
			&lt;fmt:명령어... value="EL표식" pattern="패턴" [type="화폐단위"]&gt; 
		</pre>
		<c:set var="won1" value="7654321"></c:set>
		<c:set var="won2" value="7654.567"></c:set>
		<div>
			won1 : ${won1} / won2 : ${won2} <br>
			<hr>
			1.천단위 쉼표 <br>
			<fmt:formatNumber value="${won1 }"></fmt:formatNumber> / 
			<fmt:formatNumber value="${won2 }"></fmt:formatNumber> <br>
			
			<fmt:formatNumber value="${won1 }" pattern="0,000"></fmt:formatNumber> / 
			<fmt:formatNumber value="${won2 }" pattern="0,000"></fmt:formatNumber> <br>
			
			<fmt:formatNumber value="${won1 }" pattern="0,000.0"></fmt:formatNumber> / 
			<fmt:formatNumber value="${won2 }" pattern="0,000.0"></fmt:formatNumber> <br>
			
			<fmt:formatNumber value="123" pattern="0,000.0"></fmt:formatNumber> / 
			<fmt:formatNumber value="123" pattern="0,000.0"></fmt:formatNumber> <br>
			
			<fmt:formatNumber value="123" pattern="#,##0.0"></fmt:formatNumber> / 
			<fmt:formatNumber value="123" pattern="#,##0.0"></fmt:formatNumber> <br>
			<hr>
			2.화폐단위 <br>
			원화 : <fmt:formatNumber value="${won1}" type="currency"></fmt:formatNumber>
			US달러1 : <fmt:formatNumber value="${won1}" type="currency" currencyCode="USD"></fmt:formatNumber>
			US달러2 : <fmt:formatNumber value="${won2}" pattern="#,##0.00" type="currency" currencyCode="USD"></fmt:formatNumber>
			<hr>
			3.백분율 <br>
			<c:set var="per" value="0.954567"></c:set>
			원본 : ${per} <br>
			백분율 : <fmt:formatNumber value="${per}" type="percent"></fmt:formatNumber> <br>
			백분율 : <fmt:formatNumber value="${per}" type="percent" pattern="0.0%"></fmt:formatNumber> <br>
			<hr>
			4.날짜 <br>
			오늘날짜 : <%=new Date() %> <br>
			<c:set var="today" value="<%=new Date() %>"></c:set> <br>
			오늘날짜2 : ${today} : <fmt:formatDate value="${today }" pattern="yyyy-MM-dd"/> <br>
			오늘날짜3 : ${today} : <fmt:formatDate value="${today }" pattern="yyyy-MMM-dd"/> <br>
			오늘날짜4 : ${today} : <fmt:formatDate value="${today }" pattern="yyyy년 MMM dd일"/> <br>
			오늘날짜5 : ${today} : <fmt:formatDate value="${today }" pattern="hh : mm : ss"/> <br>
			<hr>
			5.국가별설성(로케일) <br>
			톰캣서버의 기본 로케일 : <%=response.getLocale() %> : <fmt:formatNumber value="${won1}" type="currency"></fmt:formatNumber> <br>
			톰캣서버의 기본 로케일을 미국식으로 변경 : <fmt:setLocale value="en_US"/> <fmt:formatNumber value="${won1}" type="currency"></fmt:formatNumber> <br>
			<hr>
			
		</div>
	</div>
	<p><br></p>
</body>
</html>