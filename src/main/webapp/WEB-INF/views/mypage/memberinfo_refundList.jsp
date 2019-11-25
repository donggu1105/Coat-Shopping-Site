<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
 function getRefund(order_code,pro_detail_code,refund_name){
	 
	 $.ajax({
		type : "post",
		url : "${contextPath}/admin/order/requestRefund.do",
		data : {"order_code" : order_code , "pro_detail_code" : pro_detail_code, "refund_name" : refund_name},
		success : function(data){
			alert('해당상품 반품요청을 완료했습니다.');
			 location.href='${contextPath}/mypage/memberInfo_orderList.do'; 
		},
		error : function(data){
			alert('해당상품 반품요청에 실패했습니다. 다시 시도해주세요');
		}
		 
	 });
 }


</script>
</head>
<body>
	
	
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/mypage/cart/css/1.css" />
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/mypage/cart/css/2.css" />

	<div id="wrap2" >
	

		<div id="container2">
			<div id="contents2">

				<div class="xans-element- xans-order xans-order-basketpackage ">
					<div
						class="xans-element- xans-order xans-order-tabinfo df-base-tab typeLight " style="margin: 0 !important;">

					</div>
					
					<div class="orderListArea">
						<div class="xans-element- xans-order xans-order-normtitle title ">
							<h3>주문한 상품 (${orderlist.size()})</h3>
						</div>

						<table width="100%" border="1" summary=""
							class="xans-element- xans-order xans-order-normnormal boardList xans-record-">
							<colgroup>
								<col style="width: 34px;" />
								<col style="width: 92px;" />
								<col style="width: 100px;" />
								<col style="width: 85px;" />
								<col style="width: 85px;" />
								<col style="width: 50px;" />
							</colgroup>
							<thead>
								<tr style="text-align: center;">
									<th scope="col"><label>[주문 번호]</label></th>
									<th scope="col">이미지</th>
									<th scope="col">상품정보</th>
									<th scope="col">수량</th>
									<th scope="col">상품 구매금액</th>
									<th scope="col">비고</th>
								</tr>
							</thead>
							<tbody class="xans-element- xans-order xans-order-list">
							
							<c:forEach items="${orderlist}" var="orderlist">
							<c:if test="${orderlist.delivery_status eq '반품대기중' or  orderlist.delivery_status eq '반품완료'}"> 
								<tr class="xans-record-">
									<td><label>${orderlist.date_pay}</label><br><a href="${contextPath}/mypage/orderDetail.do?order_code=${orderlist.order_code}">${orderlist.order_code }</a></td>
									<td class="thumb"><a
										href="${contextPath}/product/productdetail.do?pro_code=${orderlist.pro_code}"><img
											src="${contextPath}/thumbnails.do?pro_code=${orderlist.pro_code}&fileName=${orderlist.pro_imagefilename}"
											/></a></td>
									<td class="product"><a
										href="${contextPath}/product/productdetail.do?pro_code=${orderlist.pro_code}"><strong
											class="name">${orderlist.pro_name}</strong><span class="icon"><img
												src="/web/upload/custom_4.gif" alt="" /></span></a>
										<ul
											class="xans-element- xans-order xans-order-optionall option">
											<li class="xans-record-">[옵션: ${orderlist.pro_color }/${orderlist.pro_size }]
											</li>
										</ul></td>
									<td><span class=""> <span class="df-base-qty"><label>${orderlist.order_pro_quantity} 개</label></span>
									</span></td>
									<td class="price">
										<div class="">
											<strong><fmt:formatNumber value="${orderlist.order_price}" type="number"/> 원</strong>
										</div>
									</td>
									<td class="button">${orderlist.delivery_status}</td>
								</tr>
								</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>



	</div>
	
	
	
	

</body>
</html>