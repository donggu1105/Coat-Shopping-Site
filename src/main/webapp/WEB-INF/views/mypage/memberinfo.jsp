<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
img[name=img]:hover {
	cursor: pointer;
}
</style>
</head>
<body>
<div align="center">
<%-- 	<nav
		style="border-right: 2px solid gray; width: 200px; height: 200px; float: left;">
	<ul>
		<li class="head"><strong>쇼핑 정보</strong></li>
		<li><a href="${conttextPath}/mypage/memberinfo_orderList.do">주문관리</a></li>
		<li><a href="">반품 신청 / 조회</a></li>
		<li class="head"><strong>회원 정보</strong></li>
		<li><a href="${contextPath}/member/memberupdateform.do">회원정보 수정</a></li>
		<li><a href="${contextPaht}/member/memberseccesionform.do">회원 탈퇴</a></li>
	</ul>
	</nav> --%>
	<c:if test="${memberInfo != null && isLogOn == true}">
		<div style="width: 45%;">
		<br><br><br><br><br><br>
			<img style="border:1px solid darkgray;" name="img" src="${contextPath}/resources/banner/board.png"
				onclick="location.href='${contextPath}/mypage/myReviewList.do'">
			<img style="border:1px solid darkgray;" name="img" src="${contextPath}/resources/banner/edit.png"
				onclick="location.href='${contextPath}/member/memberupdateform.do'">
			<img style="border:1px solid darkgray;" name="img" src="${contextPath}/resources/banner/cart.png"
				onclick="location.href='${contextPath}/cart/cartlist.do'"> 
			<img style="border:1px solid darkgray;" name="img" src="${contextPath}/resources/banner/order.png"
				onclick="location.href='${contextPath}/mypage/memberInfo_orderList.do'">
				
			<img style="border:1px solid darkgray;" name="img" src="${contextPath}/resources/banner/return.png"
				onclick="location.href='${contextPath}/mypage/memberInfo_refundList.do'">
			<img style="border:1px solid darkgray;" name="img" src="${contextPath}/resources/banner/quit.png"
				onclick="location.href='${contextPath}/member/membersecessionform.do'">		
		</div>
	</c:if>
	<c:if test="${nonmemberInfo != null && NonisLogOn == true}">
		<div style="width: 45%;">
		<br><br><br><br><br><br>
			<img style="border:1px solid darkgray;" name="img" src="${contextPath}/resources/banner/board.png"
				onclick="location.href='#'">
			<img style="border:1px solid darkgray;" name="img" src="${contextPath}/resources/banner/edit.png"
				onclick="location.href='${contextPath}/nonmember/nonmemberupdateform.do'">
			<img style="border:1px solid darkgray;" name="img" src="${contextPath}/resources/banner/cart.png"
				onclick="location.href='${contextPath}/cart/cartlist.do'"> 
			<img style="border:1px solid darkgray;" name="img" src="${contextPath}/resources/banner/order.png"
				onclick="location.href='${contextPath}/mypage/memberInfo_orderList.do'">
				
			<img style="border:1px solid darkgray;" name="img" src="${contextPath}/resources/banner/return.png"
				onclick="location.href='${contextPath}/mypage/memberInfo_orderList.do'">
			<img style="border:1px solid darkgray;" name="img" src="${contextPath}/resources/banner/quit.png"
				onclick="location.href='${contextPath}/member/membersecessionform.do'">		
		</div>
	</c:if>
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