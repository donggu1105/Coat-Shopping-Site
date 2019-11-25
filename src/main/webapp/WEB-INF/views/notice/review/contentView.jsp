<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
    <c:set var="review_imageFileName" value="${contentViewMap.fileName }" />
    <c:set var="replyView" value="${replyViewMap.replyView }" />
	<c:set var="con" value="${contentViewMap.contentView }" />    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${contextPath }/resources/review/css/review_style.css">
<title>Insert title here</title>

<style type="text/css">

#content{
word-wrap:break-word;
}

th{
width: 200px;
}

</style>

</head>
<script src="${contextPath}/resources/admin/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="${contextPath}/resources/admin/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${contextPath}/resources/admin/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="${contextPath}/resources/admin/dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="${contextPath}/resources/admin/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${contextPath}/resources/admin/dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <!-- <script src="dist/js/pages/dashboards/dashboard1.js"></script> -->
    <!-- Charts js Files -->
    <script src="${contextPath}/resources/admin/assets/libs/flot/excanvas.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.pie.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.time.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.stack.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/flot/jquery.flot.crosshair.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
    <script src="${contextPath}/resources/admin/dist/js/pages/chart/chart-page-init.js"></script>

<body>
<center>
<br><br><br>
<table class="review_table">
	<form action="${contextPath}/notice/review/modify_view.do" method="post">
		 <%-- <input type="hidden" name="review_num" value="${con.review_num }" />  --%>
		<tr>
			<th class="left">글번호</th>
			<td>${con.review_num}</td>
		</tr>
		<tr>
			<th class="left">조회수</th>
			<td>${con.review_hit+1}</td>
		</tr>
		
		<tr>
			<th class="left">상품명</th>
			<td>${con.pro_name}</td>
		</tr>
		<tr>
			<th class="left">작성자</th>
			<td>${con.member_id}</td>
		</tr>
		<tr>
			<th class="left">제목</th>
			<td>${con.review_title}</td>
		</tr>
		<tr>
			<th class="left">별점</th>
			<td><c:forEach begin="1" end="${con.review_star }">
						<i class="fa fa-star" aria-hidden="true" style="color: #FE9A2E;"></i>
					</c:forEach>
					<c:choose>
						<c:when test="${con.review_star<=4 }">
							<c:forEach begin="${con.review_star+1 }" end="5">
								<i class="fa fa-star-o" aria-hidden="true" style="color: #FE9A2E"></i>
					</c:forEach>
						</c:when>
					</c:choose></td>
		</tr>
		<tr>
			<th class="left">내용</th>
			<td id="content" style="height: 50%; vertical-align: top;">${con.review_content}</td>
		</tr>
		
		<c:if test="${review_imageFileName!=null}"><tr>
		<th class="left">사진</th>
		<td><img src="${contextPath}/thumbnails.do?review_num=${con.review_num}&fileName=${review_imageFileName}" ></td>
		
		</tr>
		</c:if>
		
		<c:if test="${review_imageFileName==null}"></c:if>
		
		
		<tr>
		<c:if test="${con.member_id eq memberInfo.member_id}">
			<td colspan="2" style="text-align: center">
			<a href="${contextPath}/notice/review/modify_view.do?review_num=${con.review_num}">수정</a>&nbsp;&nbsp; | 
			&nbsp;&nbsp;<a href="${contextPath }/notice/review/deleteReview.do?review_num=${con.review_num}" 
				onclick="return confirm('정말 이 리뷰를 삭제하시겠습니까?');">삭제</a>
			</td>
			
		</c:if>
		
		</tr>
		<tr>
		<td colspan="2" style="text-align: center">&nbsp;&nbsp;<a href="list.do">목록보기 </a>&nbsp;&nbsp; | 
			&nbsp;&nbsp;<a href="${contextPath }/product/productdetail.do?pro_code=${con.pro_code}">해당 상품 구경하기</a></td>
		</tr>
		
	</form>
</table>

<br>

<jsp:include page="./reply_view.jsp" flush="true" />


</center>


</body>
</html>