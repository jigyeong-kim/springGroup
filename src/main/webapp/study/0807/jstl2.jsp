<%@page import="study.j0806.T12_VO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String str = "Welcome to My Homepage!!!";
pageContext.setAttribute("str", str);

String[] hobbys = {"등산","낚시","수영","독서","바둑","승마","바이크","수집","영화감상"};
pageContext.setAttribute("hobbys", hobbys);

ArrayList<T12_VO> vos = new ArrayList<T12_VO>();

T12_VO vo = null;

vo = new T12_VO();
vo.setName("홍길동");
vo.setAge(25);
vo.setGender("남자");
vo.setJob("학생");
vo.setAddress("서울");
vos.add(vo);

/* request.setAttribute("vo", vo); */
pageContext.setAttribute("vo", vo);

vo = new T12_VO();
vo.setName("김말숙");
vo.setAge(33);
vo.setGender("여자");
vo.setJob("회사원");
vo.setAddress("청주");
vos.add(vo);

vo = new T12_VO();
vo.setName("이기자");
vo.setAge(30);
vo.setGender("남자");
vo.setJob("공무원");
vo.setAddress("제주");
vos.add(vo);

vo = new T12_VO();
vo.setName("소나무");
vo.setAge(53);
vo.setGender("여자");
vo.setJob("군인");
vo.setAddress("인천");
vos.add(vo);

vo = new T12_VO();
vo.setName("고인돌");
vo.setAge(13);
vo.setGender("남자");
vo.setJob("학생");
vo.setAddress("청주");
vos.add(vo);

pageContext.setAttribute("vos", vos);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <jsp:include page="/include/bs5.jsp"></jsp:include>
	<title>jstl2.jsp</title>
</head>
<body>
	<p><br></p>
	<div class="container">
		<h2>JSTL Function</h2>
		<pre>
			function라이브러리 : $ {fn:함수명()}
		</pre>
		<div>
			str 변수값 ? ${str} <br>
			1.str길이? <%=str.length() %> / ${str.length()} / ${fn:length(str)} <br>
			2.vos길이? <%=vos.size() %> / ${vos.size()} / ${fn:length(vos)} <br>
			3.대문자? <%=str.toUpperCase()%> / ${fn:toUpperCase(str)} <br>
			4.소문자? <%=str.toLowerCase()%> / ${fn:toLowerCase(str)} <br>
			5-1.문자열추출? <%=str.substring(0,5) %> / ${fn:substring(str, 0, 5) } <br>
			5-2.문자열추출? <%=str.substring(5) %> / ${fn:substring(str, 5, -1) } <br>
			6-1.문자(열)검색? <%=str.indexOf("o") %> / ${fn:indexOf(str, "o") } <br>
			6-2.문자(열)검색? <%=str.lastIndexOf("o") %> / 없음<br>
			6-3.str변수의 값중에서 'o'문자가 들어가 있는 모든 위치? <br>
			<c:set var="cnt" value="0"></c:set>
			<c:set var="LastCnt" value="0"></c:set>
			<c:forEach var="i" begin="0" end="${fn:length(str)-1 }">
				<%-- ${i}번째 값 ? ${fn:substring(str,i,i+1)} <br> --%>
				<c:if test="${fn:substring(str,i,i+1)=='o'}">
					<c:set var="cnt" value="${cnt + 1}"></c:set>
					${i}번째 값 ? ${fn:substring(str,i,i+1)} <br>
					<c:set var="LastCnt" value="${i}"></c:set>
				</c:if>
			</c:forEach>
			'o'문자는 ${cnt}번 있습니다 <br>
			6-4.str변수의 값중에서 'o'는 뒤에서 몇번째? ${LastCnt} <br>
			6-5.str변수의 값중에서 'o'는 뒤에서 몇번째?(split/indexOf/substring/substringAfter/substringBefore()으로 검색처히)<br>
			${fn:substringBefore(str,'o')} / ${fn:substringAfter(str,'o')} <br>
			<c:set var="str2" value="abocdoefgohi"></c:set>
			<c:forEach var="i" begin="0" end="${fn:length(str2)-1}">
			</c:forEach>
			
			7.문자열분리(split())? 'o'를 기준으로 분리 <br>
			<c:set var="positions" value="${fn:split(str, 'o')}"></c:set>
			
			<c:forEach var="p" items="${positions}" varStatus="st">
				${st.count} : ${p} <br>
			</c:forEach>
			str변수안의 'o'문자의 갯수는? ${fn:length(positions)-1} <br>
			8.치환(replace()) : 'o'문자를 'e'로 변경? 
			<%=str.replace('o', 'O') %> / ${fn:replace(str, 'o', 'O')} <br>
			9-1.문자열포함 유무(contains())? str변수에 'My'포함유무? ${fn:contains(str, 'My')} <br>
			9-2.문자열포함 유무(contains())? str변수에 'my'포함유무? ${fn:contains(str, 'my')} <br>
		</div>
	</div>
	<p><br></p>
</body>
</html>