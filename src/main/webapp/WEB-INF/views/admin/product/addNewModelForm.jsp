<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table{
border-spacing: 20px;
}


</style>

<script>
function exit(){
	
	self.close();
}

function Submit(){
	document.modelform.submit();
	alert('모델 등록 완료');
	self.close();
	opener.parent.location.reload();
}
</script>
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
</head>
<body>
	<h1>상품 모델 추가하기</h1>
			
			
	<form method="post" name="modelform" action="${contextPath }/admin/product/addNewModel.do">
	<table>
	<tr>
		<td>상품번호 :</td>
		<td><input type="text" value="${pro_code }" name="pro_code" disabled /></td>		
		<td><input type="hidden" value="${pro_code }" name="pro_code"  /></td>		
	</tr>
	
	<tr>
		<td>상품 카테고리 :</td>
		<td><input type="text" value="${pro_category }" name="pro_category" disabled /></td>
		<td><input type="hidden" value="${pro_category }" name="pro_category"  /></td>
	</tr>
	
	<tr>
		<td>상품 세부 카테고리 :</td>
		
		<td>
		<c:choose>
			
			<c:when test="${pro_category =='코트'}">
			<select name="pro_category_detail">
			<option value="트렌치코트" selected>트렌치코트</option>
			<option value="자켓" >자켓</option>
			<option value="무스탕" >무스탕</option>
			<option value="코트" >코트</option>
			<option value="핸드메이드" >핸드메이드</option>
			</select>
			</c:when>
		
			<c:when test="${pro_category =='아우터'}">
			<select name="pro_category_detail">
			<option value="자켓" selected>자켓</option>
			<option value="코트" >코트</option>
			<option value="패딩" >패딩</option>
			<option value="가죽" >가죽</option>
			<option value="집업/조끼" >집업/조끼</option>
			<option value="무스탕" >무스탕</option>
			<option value="수트" >수트</option>
			</select>
			</c:when>
			
			<c:when test="${pro_category =='상의'}">
			<select name="pro_category_detail">
			<option value="반소매" selected>반소매</option>
			<option value="긴소매" >긴소매</option>
			<option value="후드" >후드</option>
			<option value="민소매" >민소매</option>
			<option value="네오프렌" >네오프렌</option>
			</select>
			</c:when>
			
			<c:when test="${pro_category =='셔츠'}">
			<select name="pro_category_detail">
			<option value="체크/줄무늬" selected>체크/줄무늬</option>
			<option value="헨리/차이나" >헨리/차이나</option>
			<option value="패턴" >패턴</option>
			<option value="데님" >데님</option>
			<option value="베이직" >베이직</option>
			<option value="반팔셔츠" >반팔셔츠</option>
			</select>
			</c:when>
			
			<c:when test="${pro_category =='니트'}">
			<select name="pro_category_detail">
			<option value="터틀넥" selected>터틀넥</option>
			<option value="라운드" >라운드</option>
			<option value="가디건" >가디건</option>
			<option value="조끼" >조끼</option>
			</select>
			</c:when>
			
			<c:when test="${pro_category =='하의'}">
			<select name="pro_category_detail">
			<option value="슬랙스" selected>슬랙스</option>
			<option value="청바지" >청바지</option>
			<option value="코튼" >코튼</option>
			<option value="반바지" >반바지</option>
			<option value="트레이닝" >트레이닝</option>
			</select>
			</c:when>
			
					<c:when test="${pro_category =='신발'}">
			<select name="pro_category_detail">
			<option value="스니커즈" selected>스니커즈</option>
			<option value="슬립온" >슬립온</option>
			<option value="로퍼" >로퍼</option>
			<option value="옥스포드" >옥스포드</option>
			<option value="부츠/하이" >부츠/하이</option>
			<option value="샌들" >샌들</option>
			</select>
			</c:when>
			
			<c:when test="${pro_category =='악세사리'}">
			<select name="pro_category_detail">
			<option value="양말" selected>양말</option>
			<option value="모자" >모자</option>
			<option value="벨트" >벨트</option>
			<option value="반지" >반지</option>
			<option value="팔찌" >팔찌</option>
			<option value="가방" >가방</option>
			<option value="목걸이" >목걸이</option>
			<option value="안경" >안경</option>
			<option value="시계" >시계</option>
			<option value="머플러/스카프" >머플러/스카프</option>
			<option value="넥타이" >넥타이</option>
			</select>
			</c:when>
		</c:choose>
		</td>	
		
		
	</tr>
	<tr>
		<td>상품 사이즈 : </td>
		<td>
		<select name="pro_size">
			<option value="Free" selected>Free</option>
			<option value="XS" >XS</option>
			<option value="S" >S</option>
			<option value="M" >M</option>
			<option value="L" >L</option>
			<option value="XL" >XL</option>
			<option value="XXL" >XXL</option>
		
		</select>
		</td>
	</tr>
	
	<tr>
		<td>상품 색상 :</td>
		<td>
		<select name="pro_color">
			<!-- 색상추가 일치시키기 -->
			<option value="블랙" selected>블랙</option>
			<option value="화이트">화이트</option>
			<option value="베이지">베이지</option>
			<option value="레드">레드</option>
			<option value="그린">그린</option>
			<option value="브라운">브라운</option>
			<option value="크림">크림</option>
			<option value="블루">블루</option>
			<option value="차콜">차콜</option>
		</select>
		</td>
	</tr>
	
	<tr>
		<td>판매 재고 :</td>
		<td><!--지금 애 스트링으로 받아옴  -->
			<input type="text" name="pro_quantity" />개		
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><input type="button" value="등록" onclick="Submit()" />
		<input type="button" onClick="exit()" value="취소" /></td>
	</tr>
		
	</table>	
	</form>
	
</body>
</html>