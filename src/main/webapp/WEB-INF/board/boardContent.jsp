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
					else alert("이미 좋아요를 하셨습니다")
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
					else alert("이미 좋아요를 하셨습니다")
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
					else alert("이미 싫어요를 하셨습니다")
				},
				error : function() {
					alert('전송오류');
				}
				
			});
		};
		
		//게시글 삭제
		function deleteCheck() {
			let ans = confirm("현재 게시글을 삭제하시겠습니까?")
			if(ans) location.href = "BoardDelete.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}";
			
		}
		
		//댓글 저장하기
		function replyCheck() {
	    	let content = $("#content").val();
	    	if(content.trim() == "") {
	    		alert('댓글을 입력하세요');
	    		return false;
	    	}
	    	
	    	let query = {
	    		boardIdx : ${vo.idx},
	    		mid : '${sMid}',
	    		nickName : '${sNickName}',
	    		hostIp : '${pageContext.request.remoteAddr}',
	    		content : content
	    	}
	    	
	    	$.ajax({
	    		url  : 'BoardReplyInput.bo',
	    		type : 'post',
	    		data : query,
	    		success:function(res) {
	    			if(res != '0') {
	    				alert('댓글이 입력되었습니다.');
	    				location.reload();
	    			}
	    			else alert("댓글 입력 실패~~");
	    		},
	    		error : function() { alert("전송오류!!"); }
	    	});
	    }
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
				<td>
					${vo.readNum}
				
			    	<c:if test="${vo.good > 0}">(좋아요 : ${vo.good})</c:if>		
				</td>
				<th>접속IP</th>
				<td>${vo.hostIp}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="">${vo.title}</td>
				<th>좋아요</th>
				<td>
					<a href="javascript:goodCheck()" class="text-decoration-none" title="좋아요"> ❤️</a> : ${vo.good}
					/ 
					<a href="javascript:goodCheckPlus()" class="text-decoration-none" title="좋아요"> 👍 좋아요 </a>
					<a href="javascript:goodCheckMinus()" class="text-decoration-none" title="삻옹ㅅ"> 👎 싫어요 </a>
					
				</td>
			</tr>
			<tr>
				<th style="height:230px">내용</th>
				<td colspan="3">${fn:replace(vo.content, newLine, "<br>")}</td>
			</tr>
		</table>
		<table class="table table-borderless">
			<tr>
				<td class="text-start">
				<c:if test="${boardFlag == 'search' }">
					<input type="button" class="btn btn-success" value="돌아가기" onclick="location.href='BoardSearchList.bo?search=${search}&searchString=${searchString}'">
				</c:if>
				
				<c:if test="${boardFlag != 'search' }">
					<input type="button" class="btn btn-success" value="돌아가기" onclick="location.href='BoardList.bo?pag=${pag}&pageSize=${pageSize}'">
				</c:if>
				
				</td>
				<td class="text-end">
					<c:if test="${sMid == vo.mid || sAdmin == 'adminOK'}">
						<c:if test="${sMid == vo.mid}">
							<input type="button" class="btn btn-warning" value="수정" onclick="location.href='BoardUpdate.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}'">
						</c:if>
						<input type="button" class="btn btn-danger" value="삭제" onclick="deleteCheck()">
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="text-start">
					<c:if test="${!empty nextVo.title}">
				        <a href="BoardContent.bo?idx=${nextVo.idx}&pag=${pag}&pageSize=${pageSize}" class="text-decoration-none">👈 다음글</a>
			        </c:if>
				</td>
				<td class="text-end">
					<c:if test="${!empty preVo.title}">
			        	<a href="BoardContent.bo?idx=${preVo.idx}&pag=${pag}&pageSize=${pageSize}" class="text-decoration-none">이전글 👉</a>
			        </c:if>
				</td>
			</tr>
		</table>
		<hr>
		<!-- 이전글/다음글 -->
		
		<!-- 댓글처리(리스트/입력) 시작 -->
		<!-- 댓글 리스트 -->
		<table class="table table-hover text-center">
			<tr>
				<th>작성자</th>
				<th>댓글내용</th>
				<th>댓글일자</th>
				<th>댓글IP</th>
			</tr>
			<c:forEach var="replyVo" items="${replyVos}" varStatus="st">
				<tr>
					<td class="text-start">
			          ${replyVo.nickName}
			          <c:if test="${sMid == replyVo.mid}"><a href="javascript:replyDelete(${replyVo.idx})" title="삭제" class="text-decoration-none">x</a></c:if>
			        </td>
			        <td>${replyVo.content}</td>
			        <td>${replyVo.wDate}</td>
			        <td>${replyVo.hostIp}</td>
				</tr>
			</c:forEach>
		</table>
		<!-- 댓글 리스트 -->
		
		<!-- 댓글 입력폼 -->
		<form action="" name="replyForm">
			<table class="table table-center">
			<colgroup>
			<col width="85%">
			<col>
			</colgroup>
				<tr>
					<td>
						글내용 : 
						<textarea rows="4" name="content" id="content" class="form-control"></textarea>
					</td>
					<td>
						<p>작성자 : ${sNickName }</p>
						<p> <input type="button" value="댓글달기" onclick="replyCheck()" class="btn btn-success btn-sm"> </p>
					</td>
				</tr>
			</table>
		</form>
		<!-- 댓글 입력폼 -->
		<!-- 댓글처리(리스트/입력) 끝 -->
	</div>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>