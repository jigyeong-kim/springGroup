<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
    <ul class="navbar-nav">
      <li class="nav-item">
          <a class="nav-link active" href="http://192.168.50.62:9090/springGroup">Home</a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="#">Guest</a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="#">Board</a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="#">PDS</a>
      </li>
      <li class="nav-item">
	      <div class="dropdown">
			  		<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">
						Study
			  		</button>
		  			<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="${ctp}/study2/ajax/friend/FriendMain">AJAX연습 </a></li>
						<li><a class="dropdown-item" href="${ctp}/study2/mapping/Directory">디렉토리매핑연습</a></li>
						<li><a class="dropdown-item" href="${ctp}/study2/mapping/Extension.do">확장자</a></li>
						<li><a class="dropdown-item" href="${ctp}/study2/mapping/Extension2.test">확장자2</a></li>
					</ul>
				</div>
			</li>
		</ul>
	</div>
</nav>