<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	Cookie[] cookies = request.getCookies();

	out.println("저장된 쿠키는 <br>");
	for(int i=0;i<cookies.length;i++){
		if(cookies[i].getName().equals("cPwd")){
			out.println("<br><br>쿠키이름 : " + cookies[i].getName());
			out.println("<br>쿠키값 : " + cookies[i].getValue());
		}
	}
%>
<p>
	<a href="t1_Cookies.jsp" class="btn btn-success">돌아가기</a>
</p>