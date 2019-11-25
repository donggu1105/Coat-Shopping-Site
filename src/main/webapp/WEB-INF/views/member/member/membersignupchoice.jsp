<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- <style>
a{	
	margin:20px;
	padding:10px;
	text-decoration: none;
	transition:all ease 0.35s;
	color:black;
}
a:visited {
	color: black;
}
a:hover {
	color: white;
	background-color: black;
}
</style> -->
<body>
	<%-- <a href="${contextPath}/member/membersignupform.do">회원가입</a>
	<a href="${contextPath}/nonmember/nonmembersignupform.do">비회원 가입</a>
	<a style="clear: both;" href="${contextPath}/main/main.do">취소</a>
	 --%>
	<%--  <div align="center">
		
	
			<img style="border:1px solid darkgray;" src="${contextPath}/resources/banner/taltee.png"
				value="취소" href="${contextPath}/member/membersignupform.do" />
				
			<img style="border:1px solid darkgray;" src="${contextPath}/resources/banner/tal.png" value="탈퇴" onclick="submit()"> 

			
		
		</div>  --%>
		<div align="center">
	<div style="width: 45%;">
		<br><br><br><br><br><br>	
		<img style="border:1px solid darkgray; cursor: pointer;" name="img" src="${contextPath}/resources/banner/sign.png"
				onclick="location.href='${contextPath}/member/membersignupform.do'">
		<img style="border:1px solid darkgray; cursor: pointer;" name="img" src="${contextPath}/resources/banner/nonsign.png"
				onclick="location.href='${contextPath}/nonmember/nonmembersignupform.do'">
				
		</div>
		</div>
	
</body>
<script src="${contextPath}/resources/s/js/jquery-ui.js"></script>
<script src="${contextPath}/resources/s/js/popper.min.js"></script>
<script src="${contextPath}/resources/s/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/s/js/owl.carousel.min.js"></script>
<script src="${contextPath}/resources/s/js/jquery.magnific-popup.min.js"></script>
<script src="${contextPath}/resources/s/js/aos.js"></script>

<script src="${contextPath}/resources/s/js/main.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<script src="${contextPath}/resources/k/js/jquery/jquery-2.2.4.min.js"></script>
<script src="${contextPath}/resources/k/js/popper.min.js"></script>
<script src="${contextPath}/resources/k/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/k/js/plugins.js"></script>
<script src="${contextPath}/resources/k/js/active.js"></script>
</html>