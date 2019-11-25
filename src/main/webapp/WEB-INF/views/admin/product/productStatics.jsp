<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품 통계</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<c:set var="bestProducts"  value="${viewMap.bestProducts}"  />
<c:set var="newProducts"  value="${viewMap.newProducts}"  />
<c:set var="steadyProducts"  value="${viewMap.steadyProducts}"  />
<c:set var="offProducts"  value="${viewMap.offProducts}"  />
<c:set var="outProducts"  value="${viewMap.outProducts}"  />
<c:set var="totalCoat"  value="${viewMap.totalCoat}"  />
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>  
<script type="text/javascript" src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
<script type="text/javascript">

window.onload = function() {
	var chart2 = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		theme: "light2", // "light1", "light2", "dark1", "dark2"
		title: {
			text: "상품별 각 품목 별 개수 - 2019"
		},
		axisY: {
			title: "상품 개수 (개)",
			suffix: "개",
			includeZero: false
		},
		axisX: {
			title: "상품 목록"
		},
		data: [{
			type: "column",
			yValueFormatString: "#,###\"\"",
			dataPoints: [
				{ label: "코트", y: ${totalCoat} },	
				{ label: "상의", y: 221 },	
				{ label: "셔츠", y: 291 },
				{ label: "니트", y: 130 },	
				{ label: "하의", y: 250 },
				{ label: "아우터", y: 200 },
				{ label: "신발", y: 280 },
				{ label: "악세사리", y: 110 }
				
			]
		}]
	});
	chart2.render();
		
var options = {
	title: {
		text: "상품 현황"
	},
	data: [{
			type: "pie",
			startAngle: 45,
			showInLegend: "true",
			legendText: "{label}",
			indexLabel: "{label} ({y})",
			yValueFormatString:"#,##0.#"%"",
			dataPoints: [
				{ label: "신제품", y: ${newProducts } },
				{ label: "베스트셀러", y: ${bestProducts } },
				{ label: "스테디셀러", y: ${steadyProducts } },
				{ label: "할인중", y: ${offProducts } },
				{ label: "품절", y: ${outProducts } },
			]
	}]
};
$("#chartContainer2").CanvasJSChart(options);

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
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<br><br><br><br>
<div id="chartContainer2" style="height: 450px; width: 950px; margin: 0px auto;"></div> 
</body>
</html>