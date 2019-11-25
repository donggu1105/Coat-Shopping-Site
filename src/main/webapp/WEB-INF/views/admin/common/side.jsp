<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 <style>
   .no-underline{
      text-decoration:none;
   }
 </style>
</head>
<body>
	<c:if test="${side_menu !=null }">
	<c:choose>
	
		<c:when test="${side_menu=='side_member' }">
		<h1><a href="${contextPath}/admin/member/listMembers.do"  class="no-underline">회원 목록</a></h1>
		<h1><a href="${contextPath}/admin/member/viewMember.do"  class="no-underline">회원 활동 정보</a></h1>
		<h1><a href="${contextPath}/admin/member/memberStatics.do"  class="no-underline">회원 활동 통계</a></h1>
		
		</c:when>
		
		<c:when test="${side_menu=='side_product' }">
		<h1><a href="${contextPath }/admin/product/listProducts.do"  class="no-underline">상품 목록</a></h1>
		<h1><a href="${contextPath }/admin/product/addNewProductForm.do" class="no-underline">상품 등록</a></h1>
		<h1><a href="${contextPath }/admin/product/listOutOfStock.do" class="no-underline">재고 관리</a></h1>
		</c:when>
		
			<c:when test="${side_menu=='side_order' }">
		<h1><a href="${contextPath }/admin/order/listOrders.do"  class="no-underline">주문/배송 목록</a></h1>
		<h1><a href="${contextPath}/admin/order/orderStatics.do" class="no-underline">주문 통계</a></h1>
		</c:when>
		
		
			<c:when test="${side_menu=='side_notice' }">
		<h1><a href="#"  class="no-underline">게시판 질문 확인 및 답변</a></h1>
		<h1><a href="#"  class="no-underline">고객 질문</a></h1>
		</c:when>
		
		
	</c:choose>
	</c:if>
</body>
</html> --%>