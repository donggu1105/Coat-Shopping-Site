<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="contextPath" value="${pageContext.request.contextPath }" />
    <c:set var="replyView" value="${replyViewMap.replyView }" />
    <c:set var="con" value="${contentViewMap.contentView }" />
 <c:set var="totReCount"  value="${replyViewMap.totReCount}"  />
<c:set var="replyView"  value="${replyViewMap.reviewReply}" />
<c:set var="section"  value="${replyViewMap.section}"  />
<c:set var="pageNum"  value="${replyViewMap.pageNum}"  />
<c:set var="action"  value="${replyViewMap.action}"  />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${contextPath }/resources/review/css/review_style.css">
<title>Insert title here</title>
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
<script type="text/javascript">
function reply()
{
 alert( "댓글을 올렸습니다." );
}

</script>
<body>
<br><br><br>
<center>
<c:if test="${memberInfo==null }">
<table class="review_table">
		<tr>
			<td>로그인 후 댓글 작성이 가능합니다.</td>
		</tr>
		</table>
	</c:if>	

<c:if test="${memberInfo!=null }">
	<table class="review_table">
	<form action="${contextPath}/notice/review/reply.do" method="post">
	<input type="hidden" name="review_num" value="${con.review_num }" />
		<tr>
		<td>이 리뷰는 어떠셨나요?</td>
		</tr>
		<tr>
		<td>댓글 작성자 : <input name="member_id" value="${memberInfo.member_id }" readonly></td>
		</tr>
		<tr>
		<td><textarea type="text" name="review_replyContent" style="width:100%; height: 100px; resize: none;"></textarea>
		</td>
		</tr>
		<tr>
		<td><input type="submit" value="댓글 등록" OnClick="javascript:reply();"/></td>
		</tr>
		</form>
		
	</table>
</c:if>

<br>
	<br>
	<br>
	
<%-- 이 게시글의 총 댓글 수 : ${totReCount} --%> 
<c:if test="${totReCount > 0}">
<table class="review_table">
	<tr>
	<td><h4>댓글</h4></td>
	</tr>
<c:forEach items="${replyView }" var="reply">

			<tr><%-- ?review_reply_code=${reply.review_reply_code} --%>
				<td>${reply.member_id }&nbsp;&nbsp;${reply.review_replyDate }
				
				<c:if test="${reply.member_id eq memberInfo.member_id }">
				&nbsp;&nbsp;<a href="${contextPath }/notice/review/deleteReviewReply.do?review_reply_code=${reply.review_reply_code}
				&review_num=${con.review_num}" onclick="return confirm('정말 댓글을 삭제하시겠습니까?');">삭제</a>
				</c:if>
				</td>
			</tr>
			<tr>
			<td>${reply.review_replyContent }</td>
			</tr>
</c:forEach>
</table>

</center>

<!-- paging -->
	
	<c:if test="${totReCount !=null}">
		<c:choose>
			<c:when test="${totReCount >50 }">
			
		<c:forEach var="page" begin="1" end="10" step="1">
			<c:if test="${section >1 && page==1 }"> <!--페이지번호가 1일때 pre나오게 하기 -->
				<a href="${contextPath }/notice/review/contentView.do?review_num=${con.review_num }&section=${section-1}&pageNum=${(section-1)*5+1}&action=${action}">%nbsp; pre </a>
			</c:if>
				<a href="${contextPath }/notice/review/contentView.do?review_num=${con.review_num }&section=${section}&pageNum=${page}&action=${action}">${(section-1)*5+page }</a>
			<c:if test="${page==10} }"><!--페이지수가 10일때 다음으로 next나오게 하기  -->
				<a href="${contextPath }/notice/review/contentView.do?review_num=${con.review_num }&section=${section+1}&pageNum=${section*5+1}&action=${action}">&nbsp; next</a>
			</c:if>	
			
		</c:forEach>
		</c:when>
		<c:when test="${totReCount==50 }">
			<c:forEach var="page" begin="1" end="10" step="1">
				<a href="#">${page }</a>
			</c:forEach>
		</c:when>
		
		<c:when test="${totReCount <50 }">
			<c:forEach var="page" begin="1" end="${totReCount/5+1 }" step="1">
				<c:choose>
					<c:when test="${page==pageNum }">
						<a class="sel-page" href="${contextPath }/notice/review/contentView.do?review_num=${con.review_num }&section=${section}&pageNum=${page}&action=${action}">${page }</a>
					</c:when>
					<c:otherwise>
						<a class="no-uline" href="${contextPath }/notice/review/contentView.do?review_num=${con.review_num }&section=${section}&pageNum=${page}&action=${action}">${page }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:when>
	</c:choose>
	</c:if>
	</c:if>
	<br><br>
	
</body>
</html>