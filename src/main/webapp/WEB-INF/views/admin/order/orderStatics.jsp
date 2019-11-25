<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isELIgnored="false"%>
    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="totalAvenue" value="${viewMap.totalAvenue }" />
<c:set var="totalOrderCount" value="${viewMap.totalOrderCount }" />

		
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta http-equiv="x-ua-compatible" content="ie=edge">
		
		<title>Annual Sales - 2015</title>
		
	
		
	<!-- 	<style>
			body {
				background-color: #fafafa;
				font-size: 16px;
				line-height: 1.5;
			}
			
			h1,h2,h3,h4,h5,h6 {
				font-weight: 400;	
			}
			
			#header {
				border-bottom: 5px solid #37474F;
				color: #37474F;
				margin-bottom: 1.5rem;
				padding: 1rem 0;
			}
			
			#revenue-tag {
				font-weight: inherit !important;
				border-radius: 0px !important;
			}
			
			.card {
				border: 0rem;
				border-radius: 0rem;
			}
			
			.card-header {
				background-color: #37474F;
				border-radius: 0 !important;
				color:	white;
				margin-bottom: 0;
				padding:	1rem;
			}
			
			.card-block {
				border: 1px solid #cccccc;	
			}
			
			.shadow {
				box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.14),
										0 1px 18px 0 rgba(0, 0, 0, 0.12),
										0 3px 5px -1px rgba(0, 0, 0, 0.2);
			}
			
			#revenue-column-chart, #products-revenue-pie-chart, #orders-spline-chart {
				height: 300px;
				width: 100%;
			}			
		</style> -->
		
		<!-- Scripts -->
		<script src="${contextPath}/resources/admin/order/css/jquery/jquery-3.1.0.min.js"></script>
		<script src="${contextPath}/resources/admin/order/css/tether/tether.min.js"></script>
		<script src="${contextPath}/resources/admin/order/css/bootstrap/bootstrap4-alpha3.min.js"></script>
		<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<script>

   $(document).ready(function(){
      
   
    $("#select_order").change(function(){
         if($(this).val() =="member_code"){//유저코드일 경우
            location.href="${contextPath}/admin/member/listMembers.do?action=member_code";
         } 
         else if($(this).val()=="member_name"){//이름일경우
            location.href="${contextPath}/admin/member/listMembers.do?action=member_name";
         }
         else if($(this).val()=="member_point"){//포인트일경우
            location.href="${contextPath}/admin/member/listMembers.do?action=member_point";
         }
         else if($(this).val()=="member_rank"){//등급일경우
            location.href="${contextPath}/admin/member/listMembers.do?action=member_rank";
         }
         else{
            location.href="${contextPath}/admin/member/listMembers.do";
         }
         
      });
   });
   
</script>
		<script>
			$(function () {
				var totalRevenue = 15341110;
				
				// CanvasJS column chart to show revenue from Jan 2015 - Dec 2015
				var revenueColumnChart = new CanvasJS.Chart("revenue-column-chart", {
					animationEnabled: true,
					backgroundColor: "transparent",
					theme: "theme2",
					axisX: {
						labelFontSize: 14,
						valueFormatString: "MMM YYYY"
					},
					axisY: {
						labelFontSize: 14,
						suffix: "원"
					},
					toolTip: {
						borderThickness: 0,
						cornerRadius: 0
					},
					data: [
						{
							type: "column",
							yValueFormatString: "###,###.##원",
							dataPoints: [
								{ x: new Date("1 Jan 2019"), y: 868800 },
								{ x: new Date("1 Feb 2019"), y: 1071550 },
								{ x: new Date("1 Mar 2019"), y: 1286200 },
								{ x: new Date("1 Apr 2019"), y: 1106900 },
								{ x: new Date("1 May 2019"), y: 1033800 },
								{ x: new Date("1 Jun 2019"), y: 1017160 },
								{ x: new Date("1 Jul 2019"), y: 1458000 },
								{ x: new Date("1 Aug 2019"), y: 1165850 },
								{ x: new Date("1 Sep 2019"), y: 1594150 },
								{ x: new Date("1 Oct 2019"), y: 1501700 },
								{ x: new Date("1 Nov 2019"), y: ${totalAvenue} },
								{ x: new Date("1 Dec 2019"), y: 0 }
							]
						}
					]
				});
				
				revenueColumnChart.render();
				
				//CanvasJS pie chart to show product wise annual revenue for 2015
				var productsRevenuePieChart = new CanvasJS.Chart("products-revenue-pie-chart", {
					animationEnabled: true,
					theme: "theme2",
					legend: {
						fontSize: 14
					},
					toolTip: {
						borderThickness: 0,
						content: "<span style='\"'color: {color};'\"'>{name}</span>: ${y} (#percent%)",
						cornerRadius: 0
					},
					data: [
						{       
							indexLabelFontColor: "#676464",
							indexLabelFontSize: 14,
							legendMarkerType: "square",
							legendText: "{indexLabel}",
							showInLegend: true,
							startAngle:  90,
							type: "pie",
							dataPoints: [
								{  y: 6289855, name:"코트", indexLabel: "코트 - 34%", legendText: "코트", exploded: true },
								{  y: 2761400, name:"상의", indexLabel: "상의 - 8%", legendText: "상의" },
								{  y: 3681866, name:"셔츠", indexLabel: "셔츠 - 10%", legendText: "셔츠", color: "#8064a1" },
								{  y: 2607989, name:"니트", indexLabel: "니트 - 6%", legendText: "니트" },
								{  y: 2607989, name:"하의", indexLabel: "하의 - 10%", legendText: "하의" },
								{  y: 2607989, name:"아우터", indexLabel: "아우터 - 5%", legendText: "아우터" },
								{  y: 2607989, name:"신발", indexLabel: "신발 - 16%", legendText: "신발" },
								{  y: 2607989, name:"악세사리", indexLabel: "악세사리 - 11%", legendText: "악세사리" }
							]
						}
					]
				});
				
				productsRevenuePieChart.render();
				
				//CanvasJS spline chart to show orders from Jan 2015 to Dec 2015
				var ordersSplineChart = new CanvasJS.Chart("orders-spline-chart", {
					animationEnabled: true,
					backgroundColor: "transparent",
					theme: "theme2",
					toolTip: {
						borderThickness: 0,
						cornerRadius: 0
					},
					axisX: {
						labelFontSize: 14,
						maximum: new Date("31 Dec 2019"),
						valueFormatString: "MMM YYYY"
					},
					axisY: {
						gridThickness: 0,
						labelFontSize: 14,
						lineThickness: 2
					},
					data: [
						{
							type: "spline",
							dataPoints: [
								{ x: new Date("1 Jan 2019"), y: 17376 },
								{ x: new Date("1 Feb 2019"), y: 21431 },
								{ x: new Date("1 Mar 2019"), y: 25724 },
								{ x: new Date("1 Apr 2019"), y: 22138 },
								{ x: new Date("1 May 2019"), y: 20676 },
								{ x: new Date("1 Jun 2019"), y: 25429 },
								{ x: new Date("1 Jul 2019"), y: 29160 },
								{ x: new Date("1 Aug 2019"), y: 23317 },
								{ x: new Date("1 Sep 2019"), y: 31883 },
								{ x: new Date("1 Oct 2019"), y: 30034 },
								{ x: new Date("1 Nov 2019"), y: ${totalOrderCount} },
								{ x: new Date("1 Dec 2019"), y: 0 }
							]
						}
					]
				});

				ordersSplineChart.render();
				
			});
		</script>
		
	</head>
	<body>
<!-- 		<div class="container">
			
			
			<div class="row m-b-1">
				<div class="col-lg-12">
					<div class="card shadow">
						<h4 class="card-header">총 수익 현황 <span class="tag tag-success" id="revenue-tag">0원</span></h4>
						<div class="card-block">
							<div id="revenue-column-chart"></div>
						</div>
					</div>
				</div>
			</div> row

			<div class="row m-b-1">
				<div class="col-lg-6">
					<div class="card shadow">
						<h4 class="card-header">상품별 주문 수요</h4>
						<div class="card-block">
							<div id="products-revenue-pie-chart"></div>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="card shadow">
						<h4 class="card-header">주문수</h4>
						<div class="card-block">
							<div id="orders-spline-chart"></div>
						</div>
					</div>
				</div>
				
				
			</div> row
		</div> container -->
		
		<div class="page-wrapper">
            
            <div class="container-fluid">
                
                
                
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                            
                                <h3 class="card-title">총 수익 현황 &nbsp;<span class="tag tag-success" id="revenue-tag"><fmt:formatNumber value="${totalAvenue}" type="number" /> 원</span></h3>
                                <br>
                               <div class="card-block">
									<div id="revenue-column-chart" style="height:400px;" ></div>
								</div>
                                
                            </div>
                        </div>
                    </div>
                </div>
               
   
             
                   <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title">상품별 주문 수요</h3>
                     <br>
                                <div style="height: 400px;" id="products-revenue-pie-chart"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title">주문수</h3>
                                <br>
                                <div style="height: 400px;" id="orders-spline-chart"></div>
                            </div>
                        </div>
                    </div>
                </div>
             
             
                  <div class="row">
                    <div class="col-12">
                        <div class="card">
                            
                               
                                <div class="chat-box scrollable" style="height:600px;">
                                    <!--chat Row -->
                                    <ul class="chat-list">
                                        <!--chat Row -->
                                        <li class="chat-item">
                                            <div class="chat-img"><img src="${contextPath}/resources/banner/banner01.png" alt="user"></div>
                                            <div class="chat-content">
                                                <h6 class="font-medium">GOLDEN kiwi</h6>
                                                <c:choose>
                                              		<c:when test="${isLogOn == true && memberInfo !=null }">
                                                		<div class="box bg-light-info">환영합니다 <a href="#" style="color:red;">${memberInfo.member_name }</a>님!</div> 
                                                	</c:when> 
                                                </c:choose>
                                                
                                            </div>
                                            
                                            <div class="chat-time">10:56 am</div>
                                        </li>
                                        <!--chat Row -->
                                        <li class="chat-item">
                                            <div class="chat-img"><img src="${contextPath}/resources/banner/banner01.png" alt="user"></div>
                                            <div class="chat-content">
                                                <h6 class="font-medium">GOLDEN kiwi</h6>
                                                <c:choose>
                                                <c:when test="${isLogOn == true && memberInfo !=null }">
                                                <div class="box bg-light-info">로그아웃 하시겠어요?
                                                <br><a href="${contextPath }/member/memberlogout.do">로그아웃하기</a></div>
                                                
                                                
                                                </c:when>
                                                </c:choose>
                                            </div>
                                            <div class="chat-time">10:57 am</div>
                                        </li>
                                        <!--chat Row -->
                                     <!--    <li class="odd chat-item">
                                            <div class="chat-content">
                                                <div class="box bg-light-inverse">이번달 일정 보여줘.</div>
                                                <br>
                                            </div>
                                        </li> -->
                                       
                                        
                                                   
                                        
                                        
                                         <!--chat Row -->
                                        <li class="odd chat-item">
                                            <div class="chat-content">
                                                <div class="box bg-light-inverse">클라이언트 페이지로 보여줘.</div>
                                                <br>
                                            </div>
                                            <div class="chat-time">10:59 am</div>
                                        </li>
                                        
                                        <li class="chat-item">
                                            <div class="chat-img"><img src="${contextPath}/resources/banner/banner01.png" alt="user"></div>
                                            <div class="chat-content">
                                                <h6 class="font-medium">GOLDEN kiwi</h6>
                                               
                                                <div class="box bg-light-info"><a href="${contextPath }/main/main.do">클라이언트 페이지 바로가기</a></div>
                                            <div class="chat-time">10:57 am</div>
                                        </li>
                                        <!--chat Row -->
                                    <!--     <li class="chat-item">
                                            <div class="chat-img"><img src="assets/images/users/3.jpg" alt="user"></div>
                                            <div class="chat-content">
                                                <h6 class="font-medium">Angelina Rhodes</h6>
                                                <div class="box bg-light-info">Well we have good budget for the project</div>
                                            </div>
                                            <div class="chat-time">11:00 am</div>
                                        </li> -->
                                        <!--chat Row -->
                                    </ul>
                                </div>
                            </div>
                            
                        </div>
                    </div>
             
             
             
             
             
             
              
               
            </div>
        
        </div>
      



		
	</body>
	<script src="${contextPath}/resources/admin/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="${contextPath}/resources/admin/dist/js/jquery.ui.touch-punch-improved.js"></script>
    <script src="${contextPath}/resources/admin/dist/js/jquery-ui.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="${contextPath}/resources/admin/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="${contextPath}/resources/admin/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${contextPath}/resources/admin/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="${contextPath}/resources/admin/dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="${contextPath}/resources/admin/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${contextPath}/resources/admin/dist/js/custom.min.js"></script>
     <!-- this page js -->
    <script src="${contextPath}/resources/admin/assets/libs/moment/min/moment.min.js"></script>
    <script src="${contextPath}/resources/admin/assets/libs/fullcalendar/dist/fullcalendar.min.js"></script>
    <script src="${contextPath}/resources/admin/dist/js/pages/calendar/cal-init.js"></script>
</html>
