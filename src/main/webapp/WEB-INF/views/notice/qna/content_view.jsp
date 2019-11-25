<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="con" value="${content_viewmap.content_view }" />
<c:set var="modifyImage" value="${modifyviewmap.fileName }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${contextPath }/resources/qna/css/qna_style.css">
<title>Insert title here</title>
<style type="text/css">
th{
width: 200px;
}
#content { 
vertical-align: top
}
</style>
<script>
	function Submit(){
		var form = document.form;
		form.action = "${contextPath}/notice/qna/modify.do?q_index=${con.q_index}";
		form.method = "POST";
		form.submit();
	}
	
	function Delete() {
		var form = document.form;
		form.action = "${contextPath}/notice/qna/delete.do?q_index=${con.q_index}";
		form.method = "POST";
		form.submit();
	}
</script>
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
	<form name="form" method="post">
	<input type="hidden" name="q_group" value="${con.q_group }" />
	<input type="hidden" name="q_step" value="${con.q_step }" />
	<input type="hidden" name="q_indent" value="${con.q_indent }" />
	<input type="hidden" name="q_title" value="${con.q_title }" />
	<input type="hidden" name="q_content" value="${con.q_content }" />
	<input type="hidden" name="q_option" value="${con.q_option }" />
	<input type="hidden" name="q_file" value="${con.q_file }" />
	
	
	<br><br>
	
		<table class="qna_table">
			<%-- 		<input type="hidden" name="q_index" value="${replay_view.q_index }" /> --%>
			<tbody>
				<tr>
					<th class="left">히트</th>
					<td>${con.q_hit }</td>
				</tr>

				<tr>
					<th class="left">제목</th>
					<td>${con.q_title }</td>
				</tr>

				<tr>
					<th class="left">문의사항</th>
					<td>${con.q_option }</td>
				</tr>

				<tr>
					<th class="left">작성자</th>
					<td>${con.member_id }</td>
				</tr>

				<tr>
					<th class="left">내용</th>
					<td id="content" style="width: 1300px; height: 200px; "
					>${con.q_content }</td> 
				</tr>

				<tr>
					<th class="left">첨부파일</th>
					<td>
					<img width="25%" height="50%;" src="${contextPath}/notice/qna/thumbnails.do?q_index=${con.q_index}&fileName=${con.q_file}">
					</td>
				</tr>

				<tr>
				<td colspan="2"><a href="list.do" name="link">목록보기</a>
					<c:if test="${con.member_id eq memberInfo.member_id ||  nonmemberInfo.nonmember_id eq 'admin'
					|| memberInfo.member_id eq 'admin'}">
							&nbsp;&nbsp; 
<!-- 							<a name="link" -->
<%-- 							href="${contextPath}/notice/qna/modify.do?q_index=${con.q_index}">수정</a> --%>
							<a href="#" onclick="Submit()">수정</a>
							&nbsp;&nbsp;
<!-- 							<a name="link" -->
<%-- 							href="${contextPath}/notice/qna/delete.do?q_index=${con.q_index}">삭제</a> --%>
							<a href="#" onclick="Delete()">삭제</a>
							&nbsp;&nbsp;
							<a name="link"
							href="${contextPath}/notice/qna/replay_view.do?q_index=${con.q_index}">답변</a></td>
					</c:if>
				</tr>

			</tbody>
		</table>
	</form>
	</center>
</body>
</html>