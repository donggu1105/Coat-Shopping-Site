<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    
    <c:set var="modify" value="${modifymap.modify_view }" />
    <c:set var="modifyImage" value="${modifyviewmap.fileName }" />
    <c:set var="con" value="${content_viewmap.content_view }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${contextPath }/resources/qna/css/qna_style.css">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
th{
width: 200px;

}
</style>
<script>
function modify(){
	var form = document.modifyform;
	
	if (!form.q_title.value) {
		alert("제목을 입력해주세요.");
		form.q_title.focus();
		return;
	}
	
	if (!form.q_content.value) {
		alert("내용을 입력해주세요.");
		form.q_content.focus();
		return;
	}
	
	if (!form.q_file.value) {
		alert("이미지파일을 첨부해주세요.");
		form.q_file.focus();
		return;
	}
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
	<form action="${contextPath}/notice/qna/modify_view.do" method="post" name="modifyform" enctype="multipart/form-data">
	<input type="hidden" name="q_index" value="${modify.q_index }" />
	<table class="qna_table">
		<tr>
			<th class="left">제목</th>
			<td colspan="2"><input type="text" name="q_title" value="${modify.q_title }"/></td>
		</tr>
		<tr>
			<th class="left">문의사항</th>
			<td colspan="2">
				<select name="q_option">
					<option value="상품문의">상품문의</option>
					<option value="배송문의">배송문의</option>
					<option value="입금확인문의">입금확인문의</option>
					<option value="주문/배송.취소/환불 문의"">주문/배송.취소 /환불 문의</option>
					<option value="기타문의">기타문의</option>
				</select>
		</td>
		</tr>
		<tr>
			<th class="left">작성자</th>
			<td colspan="2">${memberInfo.member_id }</td>
		</tr>
		<tr>
			<th class="left">내용</th>
			<td colspan="2"><textarea  name="q_content" rows="10" cols="100" style="vertical-align : top; width: 100%;"
			>${modify.q_content}</textarea>
			</td>
		</tr>
		<tr>
			<th class="left">첨부파일</th>
			<td><input type="file" name="q_file"></td>
			<td><input type="hidden" name="originalFileName" value="${modify.q_file}" /></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="button" value="목록보기" onclick="location='list.do'" />
			<input type="submit" value="수정" onclick="javascript:modify();"/>
			</td>
		</tr>
		</table>
	</form>
</center>
</body>
</html>