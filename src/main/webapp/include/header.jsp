<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!-- Carousel -->
<div class="header">
	<div id="demo" class="carousel slide" data-bs-ride="carousel">
	
	  <!-- Indicators/dots -->
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
	    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
	    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
	  </div>
	
	  <!-- The slideshow/carousel -->
	  <div class="carousel-inner"  style="height: 300px">
	    <div class="carousel-item active">
	      <img src="${ctp}/images/la.jpg" alt="Los Angeles" class="d-block w-100">
	    </div>
	    <div class="carousel-item">
	      <img src="${ctp}/images/chicago.jpg" alt="Chicago" class="d-block w-100">
	    </div>
	    <div class="carousel-item">
	      <img src="${ctp}/images/ny.jpg" alt="New York" class="d-block w-100">
	    </div>
	  </div>
	
	  <!-- Left and right controls/icons -->
	  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </button>
  </div>
</div>