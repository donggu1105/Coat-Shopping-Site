<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isELIgnored="false"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="memberMen" value="${viewMap.memberMen }" />
<c:set var="memberWomen" value="${viewMap.memberWomen }" />
<c:set var="totalMember" value="${viewMap.totalMember }" />
<c:set var="totalNonMember" value="${viewMap.totalNonMember }" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Line_Controls_Chart</title>
    <script src="https://code.jquery.com/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 <style>
  #backButton {
   border-radius: 4px;
   padding: 8px;
   border: none;
   font-size: 16px;
   background-color: #2eacd1;
   color: white;
   position: static;
   top: 10px;
   right: 10px;
   cursor: pointer;
  }
  .invisible {
    display: none;
  }
</style>
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
 
  
 <div class="container-fluid">
             
                <div class="row">
                    <!-- column -->
                    <div class="col-12">
                       
                       
                       
                        <div class="card">
                           
                           
                           
                            
                            <div class="comment-widgets scrollable">
                             <!--membersList  -->   
<center>
<br>
    <h1>사이트 방문자 성별 현황 그래프</h1>

    <div id="Line_Controls_Chart" style="right: 0px !important;">
      <!-- 라인 차트 생성할 영역 -->
          <div id="lineChartArea" style="padding:0px 0px 0px 50px; right: 0px !important; width : 80%;"></div>
      <!-- 컨트롤바를 생성할 영역 -->
          <div id="controlsArea" style="padding:0px 0px 0px 50px; right: 0px !important;"></div>
        </div>
          <div id="chartContainer" style="height: 370px; width: 60%;"></div>
<button class="btn invisible" id="backButton"> Back</button>
</center>


</div>
</div>
</div>
</div>
</div>

  </body>
 
 <script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
  <script>
 
  var chartDrowFun = {
 
    chartDrow : function(){
        var chartData = '';
 
        //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
        var chartDateformat     = 'yyyy년MM월dd일';
        //라인차트의 라인 수
        var chartLineCount    = 10;
        //컨트롤러 바 차트의 라인 수
        var controlLineCount    = 10;
 
 
        function drawDashboard() {
 
          var data = new google.visualization.DataTable();
          //그래프에 표시할 컬럼 추가
          data.addColumn('datetime' , '날짜');
          data.addColumn('number'   , '남성');
          data.addColumn('number'   , '여성');
          data.addColumn('number'   , '전체');
 
          //그래프에 표시할 데이터
          var dataRow = [];
 
          for(var i = 0; i <= 29; i++){ //랜덤 데이터 생성
            var total   = Math.floor(Math.random() * 300) + 1;
            var man     = Math.floor(Math.random() * total) + 1;
            var woman   = total - man;
 
            dataRow = [new Date('2019', '10', i , '11'), man, woman , total];
            data.addRow(dataRow);
          }
 
 
            var chart = new google.visualization.ChartWrapper({
              chartType   : 'LineChart',
              containerId : 'lineChartArea', //라인 차트 생성할 영역
              options     : {
                              isStacked   : 'percent',
                              focusTarget : 'category',
                              height          : 500,
                              width              : '100%',
                              legend          : { position: "top", textStyle: {fontSize: 13}},
                              pointSize        : 5,
                              tooltip          : {textStyle : {fontSize:12}, showColorCode : true,trigger: 'both'},
                              hAxis              : {format: chartDateformat, gridlines:{count:chartLineCount,units: {
                                                                  years : {format: ['yyyy년']},
                                                                  months: {format: ['MM월']},
                                                                  days  : {format: ['dd일']},
                                                                  hours : {format: ['HH시']}}
                                                                },textStyle: {fontSize:12}},
                vAxis              : {minValue: 100,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:12}},
                animation        : {startup: true,duration: 1000,easing: 'in' },
                annotations    : {pattern: chartDateformat,
                                textStyle: {
                                fontSize: 15,
                                bold: true,
                                italic: true,
                                color: '#871b47',
                                auraColor: '#d799ae',
                                opacity: 0.8,
                                pattern: chartDateformat
                              }
                            }
              }
            });
 
            var control = new google.visualization.ControlWrapper({
              controlType: 'ChartRangeFilter',
              containerId: 'controlsArea',  //control bar를 생성할 영역
              options: {
                  ui:{
                        chartType: 'LineChart',
                        chartOptions: {
                        chartArea: {'width': '60%','height' : 80},
                          hAxis: {'baselineColor': 'none', format: chartDateformat, textStyle: {fontSize:12},
                            gridlines:{count:controlLineCount,units: {
                                  years : {format: ['yyyy년']},
                                  months: {format: ['MM월']},
                                  days  : {format: ['dd일']},
                                  hours : {format: ['HH시']}}
                            }}
                        }
                  },
                    filterColumnIndex: 0
                }
            });
 
            var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});
            date_formatter.format(data, 0);
 
            var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
            window.addEventListener('resize', function() { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
            dashboard.bind([control], [chart]);
            dashboard.draw(data);
 
        }
          google.charts.setOnLoadCallback(drawDashboard);
 
      }
    }
 
$(document).ready(function(){
  google.charts.load('current', {'packages':['line','controls']});
  chartDrowFun.chartDrow(); //chartDrow() 실행
});
  </script>

<script>
window.onload = function () {

var totalVisitors = 50;
var visitorsData = {
   "회원 vs 비회원": [{
      click: visitorsChartDrilldownHandler,
      cursor: "pointer",
      explodeOnClick: false,
      innerRadius: "75%",
      legendMarkerType: "square",
      name: "회원 vs 비회원",
      radius: "100%",
      showInLegend: true,
      startAngle: 90,
      type: "doughnut",
      dataPoints: [
         { y: 38, name: "회원", color: "#E7823A" },
         { y: 12, name: "비회원", color: "#546BC1" }
      ]
   }],
   "회원": [{
      color: "#E7823A",
      name: "회원",
      type: "column",
      dataPoints: [
         { x: new Date("1 Jan 2019"), y: 2 },
         { x: new Date("1 Feb 2019"), y: 5 },
         { x: new Date("1 Mar 2019"), y: 8 },
         { x: new Date("1 Apr 2019"), y: 12 },
         { x: new Date("1 May 2019"), y: 16 },
         { x: new Date("1 Jun 2019"), y: 18 },
         { x: new Date("1 Jul 2019"), y: 20 },
         { x: new Date("1 Aug 2019"), y: 25 },
         { x: new Date("1 Sep 2019"), y: 26 },
         { x: new Date("1 Oct 2019"), y: 26 },
         { x: new Date("1 Nov 2019"), y: ${totalMember} },
         { x: new Date("1 Dec 2019"), y: 0 }
      ]
   }],
   "비회원": [{
      color: "#546BC1",
      name: "비회원",
      type: "column",
      dataPoints: [
         { x: new Date("1 Jan 2019"), y: 1 },
         { x: new Date("1 Feb 2019"), y: 2 },
         { x: new Date("1 Mar 2019"), y: 4 },
         { x: new Date("1 Apr 2019"), y: 5 },
         { x: new Date("1 May 2019"), y: 6 },
         { x: new Date("1 Jun 2019"), y: 8 },
         { x: new Date("1 Jul 2019"), y: 10 },
         { x: new Date("1 Aug 2019"), y: 15 },
         { x: new Date("1 Sep 2019"), y: 17 },
         { x: new Date("1 Oct 2019"), y: 19 },
         { x: new Date("1 Nov 2019"), y: ${totalNonMember} },
         { x: new Date("1 Dec 2019"), y: 0 }
      ]
   }]
};

var newVSReturningVisitorsOptions = {
   animationEnabled: true,
   theme: "light2",
   title: {
      text: "회원 vs 비회원"
   },
   subtitles: [{
      text: "Click on Any Segment to Drilldown",
      backgroundColor: "#2eacd1",
      fontSize: 16,
      fontColor: "white",
      padding: 5
   }],
   legend: {
      fontFamily: "calibri",
      fontSize: 14,
      itemTextFormatter: function (e) {
         return e.dataPoint.name + ": " + Math.round(e.dataPoint.y / totalVisitors * 100) + "%";  
      }
   },
   data: []
};

var visitorsDrilldownedChartOptions = {
   animationEnabled: true,
   theme: "light2",
   axisX: {
      labelFontColor: "#717171",
      lineColor: "#a2a2a2",
      tickColor: "#a2a2a2"
   },
   axisY: {
      gridThickness: 0,
      includeZero: false,
      labelFontColor: "#717171",
      lineColor: "#a2a2a2",
      tickColor: "#a2a2a2",
      lineThickness: 1
   },
   data: []
};

var chart = new CanvasJS.Chart("chartContainer", newVSReturningVisitorsOptions);
chart.options.data = visitorsData["회원 vs 비회원"];
chart.render();

function visitorsChartDrilldownHandler(e) {
   chart = new CanvasJS.Chart("chartContainer", visitorsDrilldownedChartOptions);
   chart.options.data = visitorsData[e.dataPoint.name];
   chart.options.title = { text: e.dataPoint.name }
   chart.render();
   $("#backButton").toggleClass("invisible");
}

$("#backButton").click(function() { 
   $(this).toggleClass("invisible");
   chart = new CanvasJS.Chart("chartContainer", newVSReturningVisitorsOptions);
   chart.options.data = visitorsData["회원 vs 비회원"];
   chart.render();
});

}
</script>

</html>