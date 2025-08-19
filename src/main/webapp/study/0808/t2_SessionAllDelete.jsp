<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_SessionAllDelete.jsp -->
<%
	session.invalidate();
%>
<script>
	alert("세션이 모두 삭제되었습니다");
	location.href='t2_Session.jsp';
</script>