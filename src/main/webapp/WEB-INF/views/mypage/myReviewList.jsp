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
<link type="text/css" rel="stylesheet" href="${contextPath }/resources/qna/css/qna_style.css">

<title>Insert title here</title>


<c:set var="reviewList" value="${viewMap.reviewList }" />
<c:set var="qnaList" value="${viewMap.qnaList }" />
<c:set var="totalQna" value="${viewMap.totalQna }" />
<c:set var="totalReview" value="${viewMap.totalReview }" />


<%-- <c:set var="reviewList"  value="${listMap.myReviewList}" />
<c:set var="section"  value="${listMap.section}"  />
<c:set var="pageNum"  value="${listMap.pageNum}"  />
<c:set var="action"  value="${listMap.action}"  />

<c:set var="list" value="${listmap.myqnamap }" /> --%>

<style type="text/css">

td{
text-align: center;
}
.listleft{
text-align: left;
}

</style>

</head>

<body>
<br><br><br>
<center>
<c:if test="${memberInfo.member_id == null }">
로그인이 필요한 페이지입니다.
</c:if>
<br><br><br>
<h4>MY REVIEW</h4>

<br>

	
	<table class="review_table_list">
	<colgroup>
	<col width="50px"/>
	<col width="50px"/>
	<col width="20%"/>
	<col width="40%"/>
	<col width="15%"/>
	<col width="15%"/>
	<col width="50px"/>
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
		<c:forEach items="${reviewList }" var="review">
		
			<tr>
				<td>${review.review_num }</td>
				<td>${review.member_id }</td>
				<td class="listleft">${review.pro_name }</td>
				<td class="listleft">
			<a href="${contextPath }/notice/review/contentView.do?review_num=${review.review_num }">
			${review.review_title }</a>
			<img src="${contextPath}/resources/review/img/comments.png">&nbsp;${review.review_replyCount }</td>
			
			
				<td><fmt:formatDate value="${review.review_date }" pattern="yy-MM-dd"/></td>
				
				<td>
                    <c:forEach begin="1" end="${review.review_star }">
						<i class="fa fa-star" aria-hidden="true" style="color: #FE9A2E;"></i>
					</c:forEach>
					<c:choose>
						<c:when test="${review.review_star<=4 }">
							<c:forEach begin="${review.review_star+1 }" end="5">
								<i class="fa fa-star-o" aria-hidden="true" style="color: #FE9A2E"></i>
							</c:forEach>
						</c:when>
					</c:choose>
				</td>
				
				<td class="num">${review.review_hit }</td>
			</tr>
		</c:forEach>

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
	
	<br><br><br>
	
	</center>
	
	<hr>
	<br><br><br>
	
	<center>
	<h4>MY Q&A</h4>
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
		<c:forEach items="${qnaList }" var="qna">
		
			<tr>
				<td>${qna.q_index }</td>
				<td>${qna.member_id }</td>
				<td>${qna.q_option }</td>
				<td class="listleft">
			<a href="${contextPath }/notice/qna/content_view.do?q_index=${qna.q_index }">
			${qna.q_title }</a></td>
			
			
				<td><fmt:formatDate value="${qna.q_date }" pattern="yy-MM-dd"/></td>
				
				<td class="num">${qna.q_hit }</td>
			</tr>
		</c:forEach>

	</table>
	</center>
	
<!-- 	<br><br> -->
<!-- 	<hr> -->
	
	<%-- <jsp:include page="../notice/qna/myQnAList.jsp" flush="true" /> --%>
	
	<br><br><br><br>
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