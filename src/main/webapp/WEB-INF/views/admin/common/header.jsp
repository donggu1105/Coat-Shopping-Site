<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
        
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>





    <link href="${contextPath}/resources/admin/assets/libs/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet" />
    <link href="${contextPath}/resources/admin/assets/extra-libs/calendar/calendar.css" rel="stylesheet" />
    <link href="${contextPath}/resources/admin/dist/css/style.min.css" rel="stylesheet">



</head>
<body>
<%-- 
      <ul>
      <li><a href="${contextPath}/admin/member/listMembers.do"  class="no-underline">회원 관리</a></li>
      <li><a href="${contextPath }/admin/product/listProducts.do"  class="no-underline">상품 관리</a></li>
      <li><a href="#"  class="no-underline">주문 관리</a></li>
      <li><a href="#"  class="no-underline">반품 관리</a></li>
      <li><a href="#"  class="no-underline">게시판 관리</a></li>
      </ul>
      
   
   <c:choose>
      <c:when test="${isLogOn == true && memberInfo !=null }"><!--로그인상태일시  -->
         <h3>
         환영합니다. ${memberInfo.member_name }님!
         </h3>
       <a href="${contextPath }/member/memberlogout.do">로그아웃</a>
       
      </c:when>
      <c:otherwise><!--로그아웃 상태일시   -->
      <a href="${contextPath }/member/memberloginform.do">로그인</a>
      
      </c:otherwise>
   
   </c:choose> --%>
   
       <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
      <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar" data-navbarbg="skin5">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header" data-logobg="skin5">
                    <!-- This is for the sidebar toggle which is visible on mobile only -->
                    <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->
                    <a class="navbar-brand" href="${contextPath}/admin/order/orderStatics.do">
                        <!-- Logo icon -->
                        <b class="logo-icon p-l-10">
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            <!-- Dark Logo icon -->
                       
                            <img src="${contextPath}/resources/c/images/logo2.png" alt="homepage" style="margin-left: 18px;"class="light-logo" href="${contextPath}/resources/admin/order/orderStatics.do"/>
                          
                        </b>

                    <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i class="ti-more"></i></a>
                </div>

                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">

                    <ul class="navbar-nav float-left mr-auto">
                        <li class="nav-item d-none d-md-block"><a class="nav-link sidebartoggler waves-effect waves-light" href="javascript:void(0)" data-sidebartype="mini-sidebar"><i class="mdi mdi-menu font-24"></i></a></li>

                       
                    </ul>
                  
                    <ul class="navbar-nav float-right">

<%--                         <c:choose>
      <c:when test="${isLogOn == true && memberInfo !=null }"><!--로그인상태일시  -->
         <h3>
         환영합니다. ${memberInfo.member_name }님!
         </h3>
       <a href="${contextPath }/member/memberlogout.do">로그아웃</a>
       
      </c:when>
      <c:otherwise><!--로그아웃 상태일시   -->
      <a href="${contextPath }/member/memberloginform.do">로그인</a>
      
      </c:otherwise>
   
   </c:choose> 
                    --%>    
                     
                    </ul>
                </div>
            </nav>
        </header>
       
        <aside class="left-sidebar" data-sidebarbg="skin5">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav" class="p-t-30">

                
                            
                        </li>
                        
                        
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-face"></i><span class="hide-menu">회원 </span></a>
                            <ul aria-expanded="false" class="collapse  first-level">
                                <li class="sidebar-item"><a href="${contextPath}/admin/member/listMembers.do" class="sidebar-link"><i class="mdi mdi-emoticon-cool"></i><span class="hide-menu"> 회원 목록 </span></a></li>
                                <li class="sidebar-item"><a href="${contextPath}/admin/member/viewMember.do" class="sidebar-link"><i class="mdi mdi-emoticon-cool"></i><span class="hide-menu"> 회원 활동 정보 </span></a></li>
                                <li class="sidebar-item"><a href="${contextPath}/admin/member/memberStatics.do" class="sidebar-link"><i class="mdi mdi-emoticon-cool"></i><span class="hide-menu"> 회원 활동 통계 </span></a></li>
                            </ul>
                        </li>

          
                        
                        
                        
                        
                          <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="mdi mdi-face"></i><span class="hide-menu">상품 </span></a>
                            <ul aria-expanded="false" class="collapse  first-level">
                                <li class="sidebar-item"><a href="${contextPath }/admin/product/listProducts.do" class="sidebar-link"><i class="mdi mdi-emoticon-cool"></i><span class="hide-menu"> 상품 관리 </span></a></li>
                                <li class="sidebar-item"><a href="${contextPath }/admin/product/addNewProductForm.do" class="sidebar-link"><i class="mdi mdi-emoticon-cool"></i><span class="hide-menu"> 상품 등록 </span></a></li>
                        <li class="sidebar-item"><a href="${contextPath }/admin/order/listOrders.do" class="sidebar-link"><i class="mdi mdi-emoticon-cool"></i><span class="hide-menu"> 주문/배송 관리 </span></a></li>                           
                            </ul>
                        </li>
                        
                       

                        
                        
                       
                        
                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
 
    
</body>   

</html>