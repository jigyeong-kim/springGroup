<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <jsp:include page="/include/bs5.jsp"></jsp:include>
	<title>loginMain.jsp</title>
	<script>
		'use strict';
		
		function logout() {
			let ans = confirm("로그아웃 하시겠습니까?");
			if(ans) location.href = "${ctp}/study2/login/Logout";
		}
		
		function loginList() {
			
		}
		function loginSearch1() {
	    	$.ajax({
	    		url  : '${ctp}/study2/login/LoginSearch1',
	    		type : 'get',
	    		data : {mid : "admin"},
	    		success:function(res) {
	    			document.getElementById("demo").innerHTML = res;
	    		},
	    		error : function() { alert("전송오류!"); }
	    	});
	    }
		
		function loginSearch2() {
	    	let str = '<div class="input-group">';
	    	str += '<div class="input-group-text">검색할 아이디</div>';
	    	str += '<input type="text" name="mid" id="mid" value="admin" class="form-control"/>';
	    	str += '<input type="button" value="아이디검색" onclick="midSearch()" class="btn btn-secondary"/>';
	    	str += '</div>';
	    	str += '<hr/><div id="subDemo"></div>';
	    	demo.innerHTML = str;
	    }
	    
	    function midSearch() {
	    	let mid = document.getElementById("mid").value;
	    	
	    	$.ajax({
	    		url  : '${ctp}/study2/login/LoginSearch1',
	    		type : 'get',
	    		data : {mid : mid},
	    		success:function(res) {
	    			subDemo.innerHTML = res;
	    		},
	    		error : function() { alert("전송오류!"); }
	    	});
	    	
	    	subDemo = str;
	    }
	    
	    function updateCheck() {
	    	let mid = prompt("갱신할 아이디를 입력하세요!");
	    	if(mid.trim() == "") {
	    		alert("갱신할 아이디를 입력하셔야 합니다. 다시 시도해 주세요.");
	    		return false;
	    	}
	    	
	    	$.ajax({
	    		url  : '${ctp}/study2/login/LoginSearch2',
	    		type : 'get',
	    		data : {mid : mid},
	    		success:function(res) {
	    			//demo.innerHTML = res;
	    			
	    			if(res.indexOf("/") != -1){
	    				let temp = res.split("/");
	    				let str = '';
	    				str += '<form name="myfrom">';
	    				str += '<table class="table table-bordered">';
	    				str += '<tr>';
	    				str += '<th>아이디</th>';
	    				str += '<td>'+temp[1]+'</td>';
	    				str += '</tr>';
	    				str += '<tr>';
	    				str += '<th>닉네임</th>';
	    				str += '<td>'+temp[2]+'</td>';
	    				str += '</tr>';
	    				str += '<tr>';
	    				str += '<th>성명</th>';
	    				str += '<td><input type="text" name="name" value="'+temp[3]+'" class="form-control"/></td>';
	    				str += '</tr>';
	    				str += '<th>나이</th>';
	    				str += '<td><input type="number" name="age" value="'+temp[4]+'" class="form-control"/></td>';
	    				str += '</tr>';
	    				str += '<th>성별</th>';
	    				str += '<td><input type="radio" name="gender" value="남자" />남자 ';
	    				str += '    <input type="radio" name="gender" value="여자" />여자</td>';
	    				str += '</tr>';
	    				str += '<th>주소</th>';
	    				str += '<td><input type="text" name="address" value="'+temp[6]+'" class="form-control"/></td>';
	    				str += '</tr>';
	    				str += '<tr>';
	    				str += '<td colspan="2" class="text-center"><input type="submit" value="정보수정" class="btn btn-primary"/></td>';
	    				str += '</tr>';
	    				str += '</table>';
	    				str += '<input type="hidden" name="idx" value="'+ temp[0] +'">';
	    				str += '</form>';
	    				
	    				demo.innerHTML = str;
	    			}
	    		},
	    		error : function() { alert('전송오류!'); }
	    	});
	    }
	</script>
</head>
<body>
	<p><br></p>
	<div class="container">
		<h2>회원전용방</h2>
		<hr>
		<div class="row text-center">
			<div class="col"><a href="LoginList" class="btn btn-success btn-sm">회원리스트(비)</a></div>
		    <div class="col"><a href="javascript:loginList()" class="btn btn-success btn-sm">회원리스트(동)</a></div>
		    <div class="col"><a href="javascript:loginSearch1()" class="btn btn-primary btn-sm">회원검색(admin)</a></div>
		    <div class="col"><a href="javascript:loginSearch2()" class="btn btn-primary btn-sm">회원검색(form)</a></div>
		    <div class="col"><a href="javascript:updateCheck()" class="btn btn-info btn-sm">회원정보갱신</a></div>
		    <div class="col"><a href="javascript:location.reload()" class="btn btn-warning btn-sm">새로고침</a></div>
		</div>
		<hr>
		<div>이곳은 회원 전용서비스 구역입니다.</div>
		<div>회원 아이디 : ${sMid }</div>
		<div>회원 닉네임 : ${sNickName }</div>
		<hr>
		<div id="demo"></div>
		<hr>
		<div class="text-center">
			<button type="button" onclick="logout()" class="btn btn-success">로그아웃</button>
		</div>
	</div>
	<p><br></p>
</body>
</html>