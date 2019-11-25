<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${contextPath }/resources/qna/css/qna_style.css">
<title>Insert title here</title>
<style type="text/css">

tr,td,th{ 
text-align: center;
}
td#link{
text-align: left;
}
tr#admin_write {
background-color: #ffd3d3d3;
}
tr#admin_write:hover {
background-color: #f8c9ef;
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
<br><br><br>
<center>
<h4>Q & A</h4>
<br>
<table class="qna_table">

		<colgroup>
		<col width="10px" />
		<col width="10px" />
		<col width="10px" />
		<col width="30px" />
		<col width="15px" />
		<col width="10px" />
		</colgroup>

		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>문의사항</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		
<c:forEach items="${list }" var="list">
<c:choose>
	<c:when test="${list.member_id eq 'admin' }">
	<tr id="admin_write">
		<td>공지</td>
		<td>${list.member_id}</td>
		<td>공지사항</td>
		<td><a href="${contextPath }/notice/qna/content_view.do?q_index=${list.q_index }">${list.q_title }</a></td>
		<td>${list.q_date }</td>
		<td>${list.q_hit }</td>
	</tr>
	</c:when>
	<c:otherwise>
	<tr>
		<td>${list.q_index }</td>
		<td>${list.member_id }</td>
		<td>${list.q_option }</td>
		
		<td>
			<c:set value="${list.q_indent }" var="endIndent" />
			<c:forEach begin="1" end="${list.q_indent }" var="cnt">
				<c:if test="${cnt eq endIndent }">
					<img alt="" src="${contextPath }/resources/img/reply.gif">[re]
				</c:if>
				&nbsp;
			</c:forEach>
			
			<a href="${contextPath }/notice/qna/content_view.do?q_index=${list.q_index }">${list.q_title }</a>
		</td>
		<td>${list.q_date }</td>
		<td>${list.q_hit }</td>
	</tr>
	</c:otherwise>
</c:choose>
</c:forEach>

<%-- list : ${list.size() } --%>

	<tr>
	<c:if test="${memberInfo.member_id != null}">
		<td colspan="6" id="link">
			<a name="link" href="${contextPath }/notice/qna/write_view.do">글작성</a>
		</td>
	<tr>
	<tr>
		<td colspan="6" id="link">
			<a name="linkwrite" href="${contextPath }/mypage/myReviewList.do?member_id=${memberInfo.member_id }">내가 쓴글 보러가기</a>
		</td>
	</tr>
	</c:if>
</tr>
</table>

<!-- paging -->
<%-- TotRow:${pageVO.totRow }&nbsp; --%>
<%--  page/totPage:${pageVO.page }/${pageVO.totPage } --%>
<form action="list.do" method="post" id="form1" name="form1" >
<input type="hidden" name="page" value=""  />
<script type="text/javascript">
	function fnSubmitForm(page) {
  		document.form1.page.value=page;
   		document.form1.submit();
   	}
</script>
<div>
<c:if test="${pageVO.totPage>1 }">
	<c:if test="${pageVO.page>1 }">
		<a href="list?page=1">&laquo;</a>
		<a href="list?page=${pageVO.page-1 }"> &lt;</a>
	</c:if>

	<c:forEach begin="${pageVO.pageStart }" 
 		end="${pageVO.pageEnd }" var="i" step="1">
 		<c:choose>
 			<c:when test="${i eq pageVO.page }">
 				<c:out value="${i }"></c:out>
 			</c:when>
 			<c:otherwise>
 				<a href="javascript:fnSubmitForm(${i })"><c:out value="${i }"></c:out> </a>
 			</c:otherwise>
 		</c:choose>
 	</c:forEach>
 	<c:if test="${pageVO.totPage>pageVO.page }">
 		<a href="list?page=${pageVO.page+1 }">&gt;</a>
 		<a href="list?page=${pageVO.totPage }"> &raquo;</a> 
 	</c:if>
 </c:if>
</div>
</form>
</center>
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