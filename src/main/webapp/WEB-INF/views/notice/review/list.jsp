<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${contextPath }/resources/review/css/review_style.css">

<title>Insert title here</title>

<c:set var="reviewList"  value="${listMap.reviewList}" />
<c:set var="section"  value="${listMap.section}"  />
<c:set var="pageNum"  value="${listMap.pageNum}"  />
<c:set var="action"  value="${listMap.action}"  />

<style type="text/css">

td{
text-align: center;
}
.listleft{
text-align: left;
	white-space:nowrap;
	text-overflow:ellipsis;
	overflow: hidden;
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
<h4>REVIEW</h4>
<br>
	<table class="review_table_list">
	
	<c:if test="${memberInfo!=null }">
		<tr>
			<td colspan="7" style="text-align: right"> 리뷰를 작성하시겠어요? -> <a href="${contextPath }/mypage/memberInfo_orderList.do" >내 구매목록 바로가기</a></td>
		</tr>
	</c:if>	
	<c:if test="${memberInfo==null }">
		<tr>
			<td colspan="7" style="text-align: right"><a href="${contextPath }/member/memberloginform.do" >로그인</a>  후 리뷰 작성이 가능합니다.</td>
		</tr>
	</c:if>	
	
	<colgroup>
	<col width="65px"/>
	<col width="90px"/>
	<col width="20%"/>
	<col width="40%"/>
	<col width="15%"/>
	<col width="15%"/>
	<col width="65px"/>
	<%-- <col width="8%"/>
	<col width="10%"/>
	<col width="20%"/>
	<col width="30%"/>
	<col width="13%"/>
	<col width="13%"/>
	<col width="8%"/> --%>
	</colgroup>
		
		<tr>
			<th>글번호</th>
			<th>작성자</th>
			<th>상품이름</th>
			<th>제목</th>
			<th>날짜</th>
			<th>별점</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${reviewList }" var="list">
			<tr>
				<td>${list.review_num }</td>
				<td>${list.member_id }</td>
				<td class="listleft">${list.pro_name }</td>
				<td class="listleft">
			<a href="${contextPath }/notice/review/contentView.do?review_num=${list.review_num }">
			${list.review_title }</a>
			<img src="../../resources/review/img/comments.png">&nbsp;${list.review_replyCount }</td>
			
			
				<td><fmt:formatDate value="${list.review_date }" pattern="yy-MM-dd"/></td>
				
				<td>
                    <c:forEach begin="1" end="${list.review_star }">
						<i class="fa fa-star" aria-hidden="true" style="color: #FE9A2E;"></i>
					</c:forEach>
					<c:choose>
						<c:when test="${list.review_star<=4 }">
							<c:forEach begin="${list.review_star+1 }" end="5">
								<i class="fa fa-star-o" aria-hidden="true" style="color: #FE9A2E"></i>
					</c:forEach>
						</c:when>
					</c:choose>
				</td>
				
				<td class="num">${list.review_hit }</td>
			</tr>
			
		</c:forEach>
		<c:if test="${memberInfo.member_id != null}">
			<tr>
		<td colspan="7">
			<a href="${contextPath }/mypage/myReviewList.do?member_id=${memberInfo.member_id }" style="text-align: right">내가 쓴글 보러가기</a>
			</td>
			</tr>
			</c:if>

	</table>
	
	
	<!-- paging -->
	<div style="text-align: center;">
	
	<c:if test="${totalCount !=null}">
		<c:choose>
			<c:when test="${totalCount >200 }">
			
		<c:forEach var="page" begin="1" end="10" step="1">
			<c:if test="${section >1 && page==1 }"> <!--페이지번호가 1일때 pre나오게 하기 -->
				<a href="${contextPath }/notice/review/list.do?section=${section-1}&pageNum=1">pre</a>&nbsp;
			</c:if>
			<c:if test="${(section-1)*200+(page*20)+1 < totalCount }">
				<a href="${contextPath }/notice/review/list.do?section=${section}&pageNum=${page}">${(section-1)*10+page }</a>
			</c:if>
		</c:forEach>
			<c:if test="${(section+1)*200+(pageNum*20) >totalCount }">
				&nbsp;<a href="${contextPath }/notice/review/list.do?section=${section+1}&pageNum=1">next</a>
			</c:if>
		</c:when>
		<c:when test="${totalCount==200 }">
			<c:forEach var="page" begin="1" end="10" step="1">
				<a href="#">${page }</a>
			</c:forEach>
		</c:when>
		
		<c:when test="${totalCount <200 }">
			<c:forEach var="page" begin="1" end="${totalCount/10+1 }" step="1">
				<c:choose>
					<c:when test="${page==pageNum }">
						<a class="sel-page" href="${contextPath }/notice/review/list.do?section=${section}&pageNum=${page}">${page }</a>
					</c:when>
					<c:otherwise>
						<a class="no-uline" href="${contextPath }/notice/review/list.do?section=${section}&pageNum=${page}">${page }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:when>
	</c:choose>
	</c:if>
	
	</div>
	
	</form>
	</center>
	
	<br><br><br><br>
</body>
</html>