<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <jsp:include page="/include/bs5.jsp"></jsp:include>
	<title>boardContent.jsp</title>
	<style type="text/css">
		th{
			background: #eee !important;
			text-align: center;
		}
	</style>
	<script>
		'use strict'
		// 좋아요 중복 허용
		function goodCheck() {
			$.ajax({
				url : 'BoardGoodCheck.bo',
				type : 'post',
				data : {idx : ${vo.idx}},
				success : function(res) {
					if(res != '0') lacation.reload();
				},
				error : function() {
					alert('전송오류');
				}
				
			});
		};
		
		// 좋아요(따봉)
		function goodCheckPlus() {
			$.ajax({
				url : 'BoardGoodCheckPlueMinus.bo',
				type : 'post',
				data : {
					idx : ${vo.idx}, 
					goodCnt: 1
				},
				success : function(res) {
					if(res != '0') lacation.reload();
				},
				error : function() {
					alert('전송오류');
				}
				
			});
		};
		
		// 싫어요 처리
		function goodCheckMinus() {
			$.ajax({
				url : 'BoardGoodCheckPlueMinus.bo',
				type : 'post',
				data : {
					idx : ${vo.idx}, 
					goodCnt: -1
				},
				success : function(res) {
					if(res != '0') lacation.reload();
				},
				error : function() {
					alert('전송오류');
				}
				
			});
		};
	</script>
</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<jsp:include page="/include/nav.jsp" />
	<div class="container">
		<h2 class="text-center">내용보기</h2>
		<table class="table table-bordered">
			<colgroup>
				<col width="15%">
				<col>
				<col width="15%">
				<col>
			</colgroup>
			<tr>
				<th>글쓴이</th>
				<td>${vo.nickName}</td>
				<th>작성날짜</th>
				<td>${vo.wDate}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${vo.readNum}</td>
				<th>접속IP</th>
				<td>${vo.hostIp}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="" style="height:230px">${vo.title}</td>
				<th>좋아요</th>
				<td>
					<a href="javascript:goodCheck()" class="text-decoration-none" title="좋아요"> ❤️</a> : ${vo.good}
					/ 
					<a href="javascript:goodCheckPlus()" class="text-decoration-none" title="좋아요"> 👍 좋아요 </a>
					<a href="javascript:goodCheckMinus()" class="text-decoration-none" title="삻옹ㅅ"> 👎 싫어요 </a>
					
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">${fn:replace(vo.content, newLine, "<br>")}</td>
			</tr>
			<tr>
				<td colspan="4" class="text-center">
					<input type="button" class="btn btn-success" value="돌아가기" onclick="location.href='BoardList.bo'">
					
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>