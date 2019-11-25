<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<c:set var="orderList" value="${viewMap.orderList }" />
<c:set var="totOrders" value="${viewMap.totOrders }" />
<c:set var="totOnDelivery" value="${viewMap.totOnDelivery }" />
<c:set var="totDoneDelivery" value="${viewMap.totDoneDelivery }" />
<c:set var="totWaitingRefundDelivery" value="${viewMap.totWaitingRefundDelivery }" />
<c:set var="totDoneRefundDelivery" value="${viewMap.totDoneRefundDelivery }" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문정보 리스트</title>

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
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
<script>

	$(document).ready(function(){
		
		$('#select3').change(function(){
			
			var card=["모든카드","신한카드","BC카드","국민카드","제일카드","삼성카드","우리카드","하나카드"];
			var bank=["모든은행","기업은행","국민은행","신한은행"];
			
			
			var changeItem;
			if($(this).val()=='카드결제'){
				changeItem=card;
			}else {
				changeItem=bank;
			}
			$("#select4").empty();
			for(var i=0; i<changeItem.length; i++){
				
				var option=$("<option value='"+changeItem[i]+"'>"+changeItem[i]+"</option>");
				$("#select4").append(option);
				
			}
		});
	});
	
	function select_delivery_status(order_detail_code){
		var delivery_status=document.getElementById(order_detail_code+"select_delivery_status").value;
		$.ajax({
			type:"post",
			url:"${contextPath}/admin/order/listOrders.do",
			data:{"change_delivery_status" : delivery_status, "change_detail_code" : order_detail_code },
			success:function(data){
				alert("배송상태 수정을 완료했습니다.");
				location.href='${contextPath}/admin/order/listOrders.do';
			},
			error:function(data){
				alert("error");
			}
		});
	
	}


</script>
<style>
@media (min-width: 767.98px) {
  .card {
  	margin-left: 300px;
  	margin-right: 50px;
  }
</style>
<style>

	 table{
		border-spacing: 30px;
	}
	tr{
		text-align: center;
	}
	th{
	padding : 5px 10px 5px 10px;
	background-color: #1f262d;
	}
	td{
	padding : 5px 10px 5px 10px;
	word-break:normal;
	}
	ul{
		margin: 0px;
		padding: 0px 10px 0px 15px;
	}
	li{
		margin: 0;
		padding-right:10px;
		border: 0;
		float: left;
	}
	a{
		text-decoration:none ; 
		color:#000000;
	}
	#chartContainer{
		display: block; 
		padding: 0px;
	}
	.pleft{
	text-align: left;
	}
	.smallul{
	list-style: none;
	}

</style>
</head>
<body> 
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
	<br><br>
	<center>
<h2>주문 목록</h2>
</center>
	<hr>
	
	<div id="listOrdersByStatus">
	<ul class="smallul">
	<li>전체&nbsp;<a href="${contextPath }/admin/order/listOrders.do?total=total">${totOrders }</a>건 |</li>
	<li>배송중&nbsp;<a href="${contextPath }/admin/order/listOrders.do?direct_delivery_status=배송중">${totOnDelivery }</a> 건|</li>
	<li>배송완료&nbsp;<a href="${contextPath }/admin/order/listOrders.do?direct_delivery_status=배송완료">${totDoneDelivery }</a>건 |</li>
	<li>반품대기중&nbsp;<a href="${contextPath }/admin/order/listOrders.do?direct_delivery_status=반품대기중">${totWaitingRefundDelivery }</a>건 |</li>
	<li>반품완료&nbsp;<a href="${contextPath }/admin/order/listOrders.do?direct_delivery_status=반품완료">${totDoneRefundDelivery }</a>건 |</li>
	</ul>
	</div>

	
	<br><br><br>
	<form action="${contextPath }/admin/order/listOrders.do" method="post" id="frm_search">
		<table>
			<tr>
				<td colspan="2">주문검색 &nbsp;&nbsp;</td>
				<td colspan="5"  class="pleft">
					주문자 : <input type="text" name="order_member_name" placeholder="주문자 이름을 입력하세요" id="order_member_name" />				
				 </td>
			</tr>
			
			<tr>
				<td colspan="2">배송상태 구분 &nbsp;&nbsp;</td>
				<td colspan="5" class="pleft">
					<input type="radio" value="all" name="delivery_status" checked >전체
					<input type="radio" value="배송중" name="delivery_status" >배송중
					<input type="radio" value="배송완료" name="delivery_status" >배송완료
					<input type="radio" value="반품대기중" name="delivery_status" >반품대기중
					<input type="radio" value="반품완료" name="delivery_status" >반품완료
				 </td>
			</tr>
			
			<tr>
				<td colspan="2">주문 분류 &nbsp;&nbsp;</td>
				<td colspan="5" class="pleft">
					
					<select id="select1" name="order_price">
						<option value="" selected>--가격분류 선택--</option>
						<option value="price_desc">주문가격 높은순</option>
						<option value="price_asc">주문가격 낮은순</option>
					</select>
					
					<select id="select2" name="delivery_how">
						<option value="" selected>--배송방법 분류 선택--</option>
						<option value="일반배송">일반 배송</option>
						<option value="편의점픽업">편의점 픽업</option>
						<option value="매장픽업">매장 픽업</option>
					</select>
					
					<select  id="select3"  name="how_pay">
						<option value="" selected>--지불방법 분류 선택--</option>	
						<option value="카드결제">카드 결제</option>				
						<option value="무통장입금">무통장 입금</option>				
					</select>
					
					<select  id="select4" name="how_pay2">
						<option value="" >--지불방법 소분류 선택--</option>					
					</select>
				
				 </td>
			</tr>
			<tr>
				<td colspan="7">
					<input type="submit" value="검색" id="search_option" /> &nbsp;&nbsp;<input type="reset" value="초기화" />
				</td>
			</tr>
			
		</table>
	
	</form>
	<hr>
	
	<form>
		<table border="1" style="border-color: #ddd #ddd #848484 #ddd;" width="100%">
			<tr style="color: white;">
				<th>이미지</th>
				<th >상품명</th>
				<th >상품 정보</th>
				<th >주문자</th>
				<th >주문가격</th>
				<th>결제수단</th>
				<th >결제일자</th>
				<th >배송방법</th>
				<th >배송상태</th>
			</tr>
	<c:choose>
		
		<c:when test="${ orderList !=null}">
		<c:forEach var="order" items="${orderList }">
						<tr style="text-align: center;">
						<td width="100px"><a href="${contextPath}/product/productdetail.do?pro_code=${order.pro_code}">
					<img width="70px" height="105px" 
					src="${contextPath}/thumbnails.do?pro_code=${order.pro_code}&fileName=${order.pro_imagefilename}"></a></td>
						<td width="100px">${order.pro_name }</td>
						<td width="100px">${order.pro_color} /  ${order.pro_size }</td>
						<td width="100px">${order.order_member_name }</td>
						<td width="100px"><fmt:formatNumber value="${order.order_price* order.order_pro_quantity }" pattern="#,###"/>원</td>
						<td width="100px">${order.how_pay }<br><br>${order.which_bank}${order.company_name_of_card } </td>
						<td width="100px">${order.date_pay }</td>
						<td width="100px">${order.delivery_how}</td>
						<td width="100px">
						<select id="${order.order_pro_detail_code }select_delivery_status">
							<option value="${order.delivery_status}">${order.delivery_status}</option>
							<c:choose>
								<c:when test="${order.delivery_status =='배송중'}">
						<option value="배송완료">배송완료</option>
								</c:when>
								<c:when test="${order.delivery_status =='반품대기중'}">
						<option value="반품완료">반품완료</option>
								</c:when>
								<c:otherwise>
					     <option value="배송중">배송중</option>	
								</c:otherwise>
							</c:choose>
					    </select>
						<input type="button" value="수정" onclick="select_delivery_status(${order.order_pro_detail_code})" />
						</td>
						</tr>
					<c:set var="final_total_price" value="${final_total_price+order.order_price* order.order_pro_quantity }" />
							</c:forEach>
						</c:when>
			<c:when test="${empty orderList }">
			<tr><td colspan="9"><h1>주문 건이 없습니다.</h1></td></tr>
			</c:when>
			</c:choose>
		</table>	
		
		 	<c:if test="${selectedTotal !=null}">
		<c:choose>
			<c:when test="${selectedTotal >100 }">
			
		<c:forEach var="page" begin="1" end="20" step="1">
			<c:if test="${section >1 && page==1 }"> <!--페이지번호가 1일때 pre나오게 하기 -->
				<a href="${contextPath }/admin/order/listOrders.do?section=${section-1}&pageNum=${(section-1)*20+1}">%nbsp; pre </a>
			</c:if>
				<a href="${contextPath }/admin/order/listOrders.do?section=${section}&pageNum=${page}">${(section-1)*20+page }</a>
			<c:if test="${page==10} }"><!--페이지수가 10일때 다음으로 next나오게 하기  -->
				<a href="${contextPath }/admin/order/listOrders.do?section=${section+1}&pageNum=${section*20+1}">&nbsp; next</a>
			</c:if>	
			
		</c:forEach>
		</c:when>
		<c:when test="${selectedTotal==100 }">
			<c:forEach var="page" begin="1" end="10" step="1">
				<a href="#">${page }</a>
			</c:forEach>
		</c:when>
		
		<c:when test="${selectedTotal <100 }">
			<c:forEach var="page" begin="1" end="${selectedTotal/10+1 }" step="1">
				<c:choose>
					<c:when test="${page==pageNum }">
						<a class="sel-page" href="${contextPath }/admin/order/listOrders.do?
						section=${section}
						&pageNum=${page}
						&order_member_name=${order_member_name}
						&delivery_status=${delivery_status}
						&order_price=${order_price}
						&delivery_how=${delivery_how}
						&how_pay=${how_pay}
						&how_pay2=${how_pay2}">${page}</a>
					</c:when>
					<c:otherwise>
						<a class="no-uline" href="${contextPath }/admin/order/listOrders.do?
						section=${section}
						&pageNum=${page}
						&order_member_name=${order_member_name}
						&delivery_status=${delivery_status}
						&order_price=${order_price}
						&delivery_how=${delivery_how}
						&how_pay=${how_pay}
						&how_pay2=${how_pay2}">${page}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:when>
	</c:choose>
	</c:if>
	 
	</form>
	</div>
	</div>
	</div>
	</div>

</body>
</html>