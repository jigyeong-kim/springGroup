<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <jsp:include page="/include/bs5.jsp"></jsp:include>
	<title>boardList.jsp</title>
	<!-- <script>
		'use strict;
			function pageSizeCheck() {
	    	let pageSize = $("#pageSize").val();
	    	location.href = "BoardList.bo?pag=${pag}&pageSize="+pageSize;
	    }
	</script> -->
</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<jsp:include page="/include/nav.jsp" />
	<div class="container">
		<table class="table table-borderless">
			<tr>
				<td colspan="2"><h2 class="text-center">게시판 리스트</h2></td>
			</tr>
			<tr>
				<td><a href="BoardInput.bo" class="btn btn-success btn-sm">글쓰기</a></td>
				<td class="text-end">
					<!-- <select name="pageSize" id="pageSize" onchange="ageSizeCheck()"> -->
					<select name="pageSize">
						<option value="3" ${pageSize == 3 ? 'selected' : ''} selected>3</option>
						<option value="5" ${pageSize == 5 ? 'selected' : ''}>5</option>
						<option value="10" ${pageSize == 10 ? 'selected' : ''}>10</option>
						<option value="15" ${pageSize == 15 ? 'selected' : ''}>15</option>
						<option value="20" ${pageSize == 20 ? 'selected' : ''}>20</option>
						<option value="30" ${pageSize == 30 ? 'selected' : ''}>30</option>
					</select>
				</td>
			</tr>
		</table>
		
		<table class="table table-hover text-center">
		<tr>
			<th>번호</th>
			<th>글제목(댓글수)</th>
			<th>글쓴이</th>
			<th>올린날짜</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${vo.idx}</td>
			    <td class="text-start">
			    	<c:if test="${vo.openSw == 'NO'}">
			    		<c:if test="${sMid != vo.mid}">
		    				<a href="javascript:void(0)" onclick="alert('읽을수 있는 권한이 없습니다.')" class="text-decoration-none text-dark link-primary">
		    					${vo.title}
		    				</a>
	    					<c:if test="${vo.replyCnt != 0}">(${vo.replyCnt})</c:if>
		    			</c:if>
		    			<c:if test="${sMid == vo.mid || sAdmin == 'adminOK'}">
				    		<a href="BoardContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}" class="text-decoration-none text-dark link-primary">
				    			${vo.title}
				    		</a>
			    			<c:if test="${vo.replyCnt != 0}">(${vo.replyCnt})</c:if>
			    		</c:if>
			    		🔐
			    	</c:if>
			    	<c:if test="${vo.openSw == 'OK'}">
			    		<a href="BoardContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}" class="text-decoration-none text-dark link-primary">
			    			${vo.title}
			    		</a>
		    			<c:if test="${vo.replyCnt != 0}">(${vo.replyCnt})</c:if>	
		    		</c:if>
			    	<c:if test="${vo.hour_diff <= 24 }">
			    	<img alt="" src="${ctp}/images/new.gif">
			    	</c:if>
			    </td>
			    <td>${vo.nickName}</td>
			    <td>
				    <%-- <c:if test="${vo.hour_diff <= 24 }">
			    		${fn:substring(vo.wDate, 11, 19)}
			    	</c:if>
			    	<c:if test="${vo.hour_diff > 24 }">
			    		${fn:substring(vo.wDate, 0, 10)}
			    	</c:if> --%>
			    	
			    	${vo.date_diff == 0 ? fn:substring(vo.wDate, 11, 19) : vo.date_diff == 1 ? fn:substring(vo.wDate, 8, 19) : fn:substring(vo.wDate, 0, 10)}
			    </td>
			    <td>
			    	${vo.readNum}
			   	</td>
			</tr>
			<c:set var="curScrStartNo" value="${curScrStartNo - 1}"></c:set>
		</c:forEach>
		</table>
		<!-- 블록페이지 시작 -->
		  <div class="text-center">
		    <%-- <c:if test="${pag > 1}">[<a href="BoardList.bo?pag=1&pageSize=${pageSize}" class="text-decoration-none text-dark link-primary">첫페이지</a>]</c:if>
		    <c:if test="${curBlock > 0}">[<a href="BoardList.bo?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}" class="text-decoration-none text-dark link-primary">이전블록</a>]</c:if>
		    <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
		  	  <c:if test="${i <= totPage && i == pag}">[<a href="BoardList.bo?pag=${i}&pageSize=${pageSize}" class="text-decoration-none text-dark link-primary"><font color="red"><b>${i}</b></font></a>]</c:if>
		  	  <c:if test="${i <= totPage && i != pag}">[<a href="BoardList.bo?pag=${i}&pageSize=${pageSize}" class="text-decoration-none text-dark link-primary">${i}</a>]</c:if>
		    </c:forEach>
		    <c:if test="${curBlock < lastBlock}">[<a href="BoardList.bo?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}" class="text-decoration-none text-dark link-primary">다음블록</a>]</c:if>
		    <c:if test="${pag < totPage}">[<a href="BoardList.bo?pag=${totPage}&pageSize=${pageSize}" class="text-decoration-none text-dark link-primary">마지막페이지</a>]</c:if> --%>
			<ul class="pagination" style="justify-content:center;">
			  <c:if test="${curBlock > 0}">
				  <li class="page-item">
				  	<a href="BoardList.bo?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}" class="page-link">Previous</a>
				  </li>
			  </c:if>
			  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
		  	  <c:if test="${i <= totPage && i == pag}">
		  	  	<li class="page-item active">
		  	  		<a href="BoardList.bo?pag=${i}&pageSize=${pageSize}" class="page-link">${i}</a>
	  	  		</li>
		  	  </c:if>
		  	  <c:if test="${i <= totPage && i != pag}">
		  	  	<li class="page-item">
		  	  		<a href="BoardList.bo?pag=${i}&pageSize=${pageSize}" class="page-link">${i}</a>
	  	  		</li>
  	  	  	  </c:if>
		      </c:forEach>
		      <c:if test="${curBlock < lastBlock}">
		      	<li class="page-item">
		      	  <a href="BoardList.bo?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}" class="page-link">Next</a>
	      	    </li>
	      	  </c:if>
			  
			</ul>
		  </div>
		  <!-- 블록페이지 끝 -->
		  
		  <!-- 검색기 시작 -->
		  <div class="text-center">
		  	  <form action="BoardSearchList.bo" name="searchForm" method="post">
		  	  		<b>검색 : </b>
			  	  <select name="search" id="search">
					<option value="title" selected>글제목</option>
			        <option value="nickName">글쓴이</option>
			        <option value="content">글내용</option>
			  	  </select>
			  	  <input type="text" name="searchString" id="searchString" required />
			      <input type="submit" value="검색" class="btn btn-secondary btn-sm"/>
		  	</form>
		  </div>
		  <!-- 검색기 끝 -->
	</div>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>