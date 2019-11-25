<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"
 %>
 <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
 
<!DOCTYPE html>
<html>
  <head>
  
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
	<link href="${contextPath}/resources/css/default.css" rel="stylesheet" type="text/css" media="screen">
    <style>
      
    </style>
    
  </head>
    <body>
    
	<div id="content">
		<tiles:insertAttribute name="content"/>
	</div>
  </body>
</html>