<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.a{
background: url("${contextPath}/resources/banner/taltee.png");
 border: none;
        width: 32px;
        height: 32px;
        cursor: pointer;
}
</style>
</head>

<body>
	<c:if test="${memberInfo != null }">
		<form action="${contextPath}/member/membersecession.do?member_code=${memberInfo.member_code}" method="POST">
	</c:if>
	<c:if test="${nonmemberInfo != null }">
		<form action="${contextPath}/member/membersecession.do?nonmember_code=${nonmemberInfo.nonmember_code}" method="POST">
	</c:if>
	
	<!-- 	<input type="button" value="취소" href="#none"  onclick="history.back();" />
		<input type="submit" value="탈퇴" />  -->
	<Br><Br><br>
		 <div align="center">
		
	
			<img style="border:1px solid darkgray;" src="${contextPath}/resources/banner/taltee.png"
				value="취소" href="#none"  onclick="history.back();" />
				
			<img style="border:1px solid darkgray;" src="${contextPath}/resources/banner/tal.png" value="탈퇴" onclick="submit()"> 

			
		
		</div> 
			
	</form>
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