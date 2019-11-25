<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
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
function Sub(){
	var form = document.fileform;
	
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
	
	form.submit();
	form.action="${contextPath }/notice/qna/list.do";
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
<table>
	<form action="${contextPath }/notice/qna/write.do" name="fileform" method="post" method="get" enctype="multipart/form-data">
		<tr>
			<th class="left">제목</th>
			<td><input type="text" name="q_title" size="50" /></td>
		</tr>
		
		<c:choose>
		<c:when test="${memberInfo.member_id eq 'admin' }">
			<th class="left" colspan="1">공지사항</th>
			<td>
				<select name="q_option">
					<option value="공지사항">공지사항</option>
					<option value="이벤트">이벤트</option>
					<option value="재입고">재입고</option>
				</select>
			</td>
		</c:when>
		<c:otherwise>
		<tr>
			<th class="left">문의사항</th>
			<td class="select_box">
				<select name="q_option" id="q_option">
					<option value="상품문의">상품문의</option>
					<option value="배송문의">배송문의</option>
					<option value="입금확인문의">입금확인문의</option>
					<option value="주문/배송.취소/환불 문의">주문/배송.취소/환불 문의</option>
					<option value="기타문의">기타문의</option>
				</select>
			</td>
		</tr>
		</c:otherwise>
		</c:choose>
		<tr>
			<th class="left">작성자</th>
			<c:if test="${memberInfo != null }">
				<td><input name="member_id" value="${memberInfo.member_id }" readonly /></td>
			</c:if>
			<c:if test="${memberInfo==null }">
				<td>로그인 해주시기 바랍니다.</td>
			</c:if>
		</tr>
		
		
		<tr>
			<th class="left">내용</th>
			<td><textarea type="text" name="q_content" rows="10" cols="100" style="width: 100%;" ></textarea>
			</td>
		</tr>
		<tr>
			<th class="left">첨부파일</th>
			<td><input type="file" name="q_file" /></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="button" value="목록보기" onclick="location='list.do'" />
			<input type="button" value="등록" onclick="javascript:Sub();" />
			</td>
		</tr>
		
	</form>
</table>
</center>
</body>
</html>