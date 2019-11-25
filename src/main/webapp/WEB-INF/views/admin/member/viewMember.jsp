<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="member" value="${viewMap.member }" />
<c:set var="totalCoupons" value="${viewMap.totalCoupons }" />
<c:set var="averageOrder" value="${viewMap.averageOrder }" />
<c:set var="onDelivery" value="${viewMap.onDelivery }" />
<c:set var="onCart" value="${viewMap.onCart }" />
<c:set var="onRefund" value="${viewMap.onRefund }" />
<c:set var="cartList" value="${viewMap.cartList }" />
<c:set var="orderList" value="${viewMap.orderList }" />
<c:set var="refundList" value="${viewMap.refundList }" />
<style>
@media (min-width: 767.98px) {
  .card {
  	margin-left: 300px;
  	margin-right: 50px;
  }
</style>
<style>
.infotable { 
    border-top: 1px solid #ccc; 
    border-collapse: collapse; 
    border-spacing : 1px; 
    line-height : 1.5; 
    padding : 0 0 0 50px; 
} 
.infotable td { 
    width: 150px; 
    padding : 5px; 
    font-weight: bold; 
    vertical-align: top; 
    border-bottom: 1px solid #ccc; 
    border-top : 1px solid #ccc; 
    border-left : 1px solid #ccc;
    border-right : 1px solid #ccc;
    text-align: center; 
} 

#chartContainer { 
/*     padding : 0 0 0 30px;  */
}

a#linkline { 
    text-decoration: none; 
    color: #FE2E2E; 
}
a:hover {
   color : #FE2E2E;
}
</style>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 정보 수정</title>
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

window.onload = function () {

var options = {
   exportEnabled: true,
   animationEnabled: true,
   title:{
      text: "${member.member_name} 님 사이트 이용현황"
   },
   subtitles: [{
      text: ""
   }],
   
   axisY: {
      title: "방문수",
      titleFontColor: "#4F81BC",
      lineColor: "#4F81BC",
      labelFontColor: "#4F81BC",
      tickColor: "#4F81BC",
      includeZero: false
   },
   axisY2: {
      title: "평균 주문가격",
      titleFontColor: "#C0504E",
      lineColor: "#C0504E",
      labelFontColor: "#C0504E",
      tickColor: "#C0504E",
      includeZero: false
   },
   toolTip: {
      shared: true
   },
   legend: {
      cursor: "pointer",
      itemclick: toggleDataSeries
   },
   data: [{
      type: "spline",
      name: "방문수",
      showInLegend: true,
      xValueFormatString: "MMM YYYY",
      yValueFormatString: "#,##0 회",
      dataPoints: [
         { x: new Date(2019, 0, 1),  y: 5 },
         { x: new Date(2019, 1, 1), y: 8 },
         { x: new Date(2019, 2, 1), y: 3 },
         { x: new Date(2019, 3, 1),  y: 1 },
         { x: new Date(2019, 4, 1),  y: 5 },
         { x: new Date(2019, 5, 1),  y: 7 },
         { x: new Date(2019, 6, 1), y: 2 },
         { x: new Date(2019, 7, 1), y: 8 },
         { x: new Date(2019, 8, 1),  y: 14 },
         { x: new Date(2019, 9, 1),  y: 2 },
         { x: new Date(2019, 10, 1),  y: ${member.member_total_login} },
         { x: new Date(2019, 11, 1), y:  0 }
      ]
   },
   {
      type: "spline",
      name: "평균 주문가격",
      axisYType: "secondary",
      showInLegend: true,
      xValueFormatString: "MMM YYYY",
      yValueFormatString: "#,##0.#원",
      dataPoints: [
         { x: new Date(2019, 0, 1),  y: 390340.5 },
         { x: new Date(2019, 1, 1), y: 200150 },
         { x: new Date(2019, 2, 1), y: 473420 },
         { x: new Date(2019, 3, 1),  y: 50000 },
         { x: new Date(2019, 4, 1),  y: 302340 },
         { x: new Date(2019, 5, 1),  y: 290340 },
         { x: new Date(2019, 6, 1), y: 604870 },
         { x: new Date(2019, 7, 1), y: 825230 },
         { x: new Date(2019, 8, 1),  y: 1000000 },
         { x: new Date(2019, 9, 1),  y: 2000000 },
         { x: new Date(2019, 10, 1),  y: ${averageOrder} },
         { x: new Date(2019, 11, 1), y: 0 }
      ]
   }]
};
$("#chartContainer").CanvasJSChart(options);

function toggleDataSeries(e) {
   if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
      e.dataSeries.visible = false;
   } else {
      e.dataSeries.visible = true;
   }
   e.chart.render();
}

}
</script>
<script>


</script>

</head>
<body>

 <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                           
                           
                           
                            
                            <div class="comment-widgets scrollable">
                            <br><br>
                            <center>
                            <h2>회원 목록</h2>
                            <hr>
   <form id="frm_search" action="${contextPath }/admin/member/searchMember.do" method="post">
      <table>
         <tr id="search">
            <td>회원</td>
            <td colspan="5"><input type="text" placeholder="이름,아이디" width="150" name="memberSearch"/></td>
            <td><input type="button" onClick="document.getElementById('frm_search').submit();" value="검색" /></td>
         </tr>
      </table>
   
   </form>
   </center>
   <br><br>
   
   <center>
   <table border="1" class="infotable">
   
   <tr>
      <td colspan="6">활동 정보</td>
   </tr>
   <tr>
      <td>이름</td>
      <td>${member.member_name }</td>
      <td>아이디</td>
      <td>${member.member_id }</td>
      <td>적립금</td>
      <td><a href="#"><fmt:formatNumber value="${member.member_saving}" pattern="#,###" /></a>원</td>
      
   </tr>
   
   <tr>
   <td>포인트</td>
      <td><a href="#"><fmt:formatNumber value="${member.member_point}" pattern="#,###" /></a>P</td>
      <td>최근 로그인</td>
      <td>${member.member_lately_date}</td>
      <td>쿠폰</td>
      <td><a href="#">${totalCoupons}</a>개</td>
      
   </tr>
   
   <tr>
      <td>방문수</td>
      <td><fmt:formatNumber value="${member.member_total_login}" pattern="#,###" />회</td>
      <td>누적 구매액</td>
      <td><fmt:formatNumber value="${member.member_total_buy}" pattern="#,###" />원</td>
      <td>누적 주문수</td>
      <td><a href="#"><fmt:formatNumber value="${member.member_total_order}" pattern="#,###" /></a>회 
      (평균:<fmt:formatNumber value="${averageOrder}" pattern="#,###" />원)</td>
   </tr>
   </table>
   </center>
   <br><br>
   
   <center>
   <div id="chartContainer" style="height: 370px; width: 50%;"></div>
   </center>
   
   <br>
   <hr>
   <center>
   <table>   <caption><Strong>고객 데이터</Strong></caption>
      
      <tr>
         <td colspan="2">배송중인 상품</td>
         <td>
         <a href="${contextPath }/admin/order/listOrders.do">${onDelivery}
         <c:if test="${onDelivery ==null }">0</c:if>
         </a>건</td>
      </tr>
      <tr>
         <td colspan="2">반품대기중인 상품</td>
         <td>
         <a href="${contextPath }/admin/member/viewMember.do?member_code=${member.member_code}">${onRefund}
         <c:if test="${onRefund ==null }">0</c:if>
         </a>건</td>
      </tr>
      <tr>
         <td colspan="2">장바구니에 담은 상품</td>
         <td><a href="${contextPath }/admin/member/viewMember.do?member_code=${member.member_code}">${onCart}
         <c:if test="${onCart ==null }">0</c:if>
         </a>건</td>
      </tr>
      <tr>
         <td colspan="2">재입고알림을 요청한 상품</td>
         <td><a href="#">0</a> 건</td>
      </tr>
   </table>
   <br><br><br>
      <!--배송 중인 상품  -->
      <c:choose>
         <c:when test="${orderList !=null }">
            <table>
               <tr>
                  <td colspan="8"><strong>배송중인 상품</strong></td>
               </tr>
               <tr style="text-align: center;">
                  <td width="100px">이미지</td>
                  <td width="100px">상품명</td>
                  <td width="100px">상품 정보</td>
                  <td width="100px">주문자</td>
                  <td width="100px">주문 가격</td>
                  <td width="100px">결제 수단</td>
                  <td width="100px">결제 일자</td>         
                  <td width="100px">배송 상태</td>
               </tr>
               
               <c:forEach var="order" items="${orderList }">
                  <tr style="text-align: center;">
                  <td width="100px;"><a href="${contextPath}/product/productdetail.do?pro_code=${order.pro_code}">
               <img width="70px" height="105px" 
               src="${contextPath}/thumbnails.do?pro_code=${order.pro_code}&fileName=${order.pro_imagefilename}"></a></td>
                  <td>${order.pro_name }</td>
                  <td>${order.pro_color} /  ${order.pro_size }</td>
                  <td>${order.order_member_name }</td>
                  <td><fmt:formatNumber value="${order.order_price}" pattern="#,###"/>원</td>
                  <td>${order.how_pay }</td>
                  <td>${order.date_pay }</td>
                  <td>${order.delivery_status}</td>
                  </tr>
               <c:set var="final_total_price" value="${final_total_price+order.order_price }" />
               </c:forEach>
                  <tr>
                     <td colspan="8" align="right"><strong>배송중인 상품 총 주문 가격 : 
                     <fmt:formatNumber  value="${final_total_price}" pattern="#,###" /></strong> </td>
                  </tr>
            </table>
         </c:when>
         <c:otherwise>
         <h3>배송중인 상품이 없습니다.</h3>
         </c:otherwise>
         </c:choose>
            <!-- 반품대기중인 상품  -->
      <c:choose>
         <c:when test="${refundList !=null }">
            <table>
               <tr>
                  <td colspan="8"><strong>반품대기중인 상품</strong></td>
               </tr>
               <tr style="text-align: center;">
                  <td width="100px">이미지</td>
                  <td width="100px">상품명</td>
                  <td width="100px">상품 정보</td>
                  <td width="100px">주문자</td>
                  <td width="100px">주문 가격</td>
                  <td width="100px">결제 수단</td>
                  <td width="100px">결제 일자</td>         
                  <td width="100px">배송 상태</td>
               </tr>
               
               <c:forEach var="refund" items="${refundList }">
                  <tr style="text-align: center;">
                  <td width="100px;"><a href="${contextPath}/product/productdetail.do?pro_code=${refund.pro_code}">
               <img width="70px" height="105px" 
               src="${contextPath}/thumbnails.do?pro_code=${refund.pro_code}&fileName=${refund.pro_imagefilename}"></a></td>
                  <td>${refund.pro_name }</td>
                  <td>${refund.pro_color} /  ${refund.pro_size }</td>
                  <td>${refund.order_member_name }</td>
                  <td><fmt:formatNumber value="${refund.order_price}" pattern="#,###"/>원</td>
                  <td>${refund.how_pay }</td>
                  <td>${refund.date_pay }</td>
                  <td>${refund.delivery_status}</td>
                  </tr>
               <c:set var="final_total_refund_price" value="${final_total_refund_price+refund.order_price }" />
               </c:forEach>
                  <tr>
                     <td colspan="8" align="right"><strong>반품대기중인 상품 총 주문 가격 : 
                     <fmt:formatNumber  value="${final_total_refund_price}" pattern="#,###" /></strong> </td>
                  </tr>
            </table>
         </c:when>
         <c:otherwise>
         <h3>반품 대기 중인 상품이 없습니다.</h3>
         </c:otherwise>
      </c:choose>
      
      <!--장바구니에 담은 상품 -->
      <c:choose>
         <c:when test="${cartList !=null }">
            <table>
               <tr>
                  <td colspan="6"><strong>장바구니에 담은 상품</strong></td>
               </tr>
            <tr style="text-align:center;">
               <th width="100px;">이미지</th>
               <th width="100px;">상품명 </th>
               <th width="100px;">상품 정보</th>
               <th width="100px;">판매가</th>
               <th width="100px;">수량</th>
               <th width="100px;">합계</th>
            </tr>
            <c:forEach var="cart" items="${cartList }">
               <tr style="text-align: center;">
                  <td width="100px;"><a href="${contextPath}/product/productdetail.do?pro_code=${cart.cart_pro_code}">
               <img width="70px" height="105px" 
               src="${contextPath}/thumbnails.do?pro_code=${cart.cart_pro_code}&fileName=${cart.pro_imagefilename}"></a></td>
               <td width="100px;" >${cart.pro_name }</td>
               <td width="100px">${cart.cart_pro_size } / ${cart.cart_pro_color } </td>
               <td width="100px"><fmt:formatNumber value="${cart.cart_pro_price}" pattern="#,###" />원</td>
               <td width="100px;">${cart.cart_pro_quantity}</td>
               <td width="100px;"><fmt:formatNumber value="${cart.cart_pro_price *cart.cart_pro_quantity}" pattern="#,###" />원</td>
               </tr>
            
            </c:forEach>
            </table>
         </c:when>
         <c:otherwise>
         <h3>장바구니에 담긴 상품이없습니다.</h3>
         </c:otherwise>
      
      
      </c:choose>
      
      
   </center>

</div>
</div>
</div>
</div>
</div>


</body>
</html>