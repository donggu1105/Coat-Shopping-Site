<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    <%-- <c:set var="con" value="${content_viewmap.cotent_view }" /> --%>
    <c:set var="replay_view" value="${replay_viewmap.replayView}" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${contextPath }/resources/qna/css/qna_style.css">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
.left{
width: 70px;

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
<table width="500" cellpadding="0" cellspacing="0" border="1" class="qna_table">
	<form action="${contextPath }/notice/qna/replay.do" method="post">
		<input type="hidden" name="q_index" value="${replay_view.q_index }" />
		<input type="hidden" name="q_group" value="${replay_view.q_group }" />
		<input type="hidden" name="q_step" value="${replay_view.q_step }" />
		<input type="hidden" name="q_indent" value="${replay_view.q_indent }" />
		<input type="hidden" name="q_option" value="${replay_view.q_option }" />
		<input type="hidden" name="member_id" value="${memberInfo.member_id }" />
		
		
		<tr>
			<td class="left">제목</td>
			<td><input type="text" name="q_title" size="50" /></td>
		</tr>
		
		<tr>
			<td class="left">문의사항</td>
			<td>${replay_view.q_option }</td>
		</tr> 
		
		<tr>
			<td class="left">작성자</td>
			<td>${memberInfo.member_id }</td>
		</tr>
		
		<tr>
			<td class="left">내용</td>
			<td>
				<textarea type="text" name="q_content" rows="10" cols="200"style="vertical-align : top" ></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="reply" /></td>
		</tr>
		
	</form>
</table>
</center>
</body>
</html>