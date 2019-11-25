<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리자 메인</title>
</head>
<body>
   <h1>관리자 메인 페이지입니다</h1>
</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>회원정보 리스트</title>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> <!--membersMap으로 가져와서 변수명 간단하게 새로 지정  -->
<c:set var="membersList"  value="${membersMap.membersList}"  />
<c:set var="totMembers"  value="${membersMap.totMembers}"  />
<c:set var="section"  value="${membersMap.section}"  />
<c:set var="pageNum"  value="${membersMap.pageNum}"  />
<c:set var="action"  value="${membersMap.action}"  />
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

<style>
@media (min-width: 767.98px) {
  .card {
  	margin-left: 300px;
  	margin-right: 50px;
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
                            
                               
                                <div class="chat-box scrollable" style="height:770px;">
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
                                                <div class="box bg-light-inverse">이번달 일정 보여줘.</div>
                                                <br>
                                            </div>
                                            <div class="chat-time">10:59 am</div>
                                        </li>
                                        
                                                    <li class="chat-item">
                                            <div class="chat-img"><img src="${contextPath}/resources/banner/banner01.png" alt="user"></div>
                                            <div class="chat-content">
                                                <h6 class="font-medium">GOLDEN kiwi</h6>
                                               
                                                <div class="box bg-light-info">이번달 일정 보기</div>
                                            <div class="chat-time">10:57 am</div>
                                        </li>
                                        
                                        
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

      
  </div>
 
       
</body>

<%--   <script src="${contextPath}/resources/admin/assets/libs/jquery/dist/jquery.min.js"></script>
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
    <script src="${contextPath}/resources/admin/dist/js/pages/calendar/cal-init.js"></script> --%>
</html>
<!--이거 꼭 넣으주세여여여어  -->
<%-- <script src="${contextPath}/resources/admin/assets/libs/jquery/dist/jquery.min.js"></script>
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
    <script src="${contextPath}/resources/admin/dist/js/pages/chart/chart-page-init.js"></script> --%>