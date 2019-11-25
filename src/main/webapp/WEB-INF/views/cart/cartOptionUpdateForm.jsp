<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function exit(){
		window.close();
	}
	
	function optionsChange(val){
		console.log('function init!!');
		var col = "";
		var code = 0 ;
		<c:choose>
			<c:when test="${memberInfo.member_code != null}">
				code = ${memberInfo.member_code};
				col = 'member';
			</c:when>
			<c:otherwise>
				code = ${nonmemberInfo.nonmember_code};
				col = 'nonmember';
			</c:otherwise>
		</c:choose>
		var action = $(val).val();
		var pro_code = ${img.pro_code};
		console.log(pro_code);
		var color = $('select[name=color]').val();
		var size = $('select[name=size]').val();
		var price = ${pro_price};
		var pro_quantity = ${pro_quantity};
		var pro_detail_code = get_pro_Detail_code(pro_code , color , size);
		var origin_pro_detail_code = ${pro_detail_code};
		var result = cartOverlap(pro_detail_code , col , code);
		var confirm_result = true;
		
		if(pro_detail_code == origin_pro_detail_code){
			alert('현재 보고계신 상품 입니다.');
			return;
		}
		
		if(result == false)
			confirm_result = confirm('이미 장바구니에 같은 상품이 있습니다. 그래도 '+action+'하시겠습니까?');
		var param = {
					 col  					: col ,
					 code 					: code, 
					 action 				: action,
					 pro_detail_code 		: pro_detail_code ,
					 origin_pro_detail_code : origin_pro_detail_code ,
					 pro_code 				: pro_code,
					 pro_quantity   		: pro_quantity,
					 price 					: price,
					 color 					: color ,
					 size 					: size ,
					 result 				: result
					 };
		console.log(param);
		if(confirm_result == true){
		$.ajax({
			type : 'POST',
			url : '${contextPath}/cart/cartOptionUpdate.do',
			data : param,
			dataType : 'json',
			async: false,
			success : function(data){	
				alert('suc');
			},
			error : function(){
			}
		});
		window.close();
		opener.parent.location.reload();
		}
	}
	
	function get_pro_Detail_code(pro_code, color , size){
		var pro_detail_code = 0;
		$.ajax({
			type : "POST",
			url : "${contextPath}/cart/getPro_Detail_code.do",
			async: false,
			dataType : 'json',
			data : {
				pro_code : pro_code ,
				color 	 : color ,
				size 	 : size
			},
			success : function(data){
				pro_detail_code = parseInt(data);
			},
			error : function(){
				alert('pro_detail err');
			}
			
		});
		return pro_detail_code;
	}
	
	function cartOverlap(pro_detail_code , col , code){
		var result = '';
		$.ajax({
			type : "POST",
			url : "${contextPath}/cart/cart_overlap.do",
			async : false,
			data : {
				pro_detail_code : pro_detail_code ,
				col 			: col ,
				code 			: code
			},
			dataType : 'json',
			success : function(data){
				result = data;
			},
			error : function(){
				alert('overlap_err');
			}
		});
		return result;
	}
</script>
</head>
<body>
	<div style="margin: 0; padding : 0; float: left;">
		<img width="230px;" height="345px" src="${contextPath}/thumbnails.do?pro_code=${img.pro_code}&fileName=${img.pro_imageFileName}" style="margin : 25px;">
	</div>
	<div style="margin: 0; padding:0; float: left; text-align: center;">
		<strong>${pro_name}</strong>
		<div style="margin-top: 20px; margin-bottom: 20px; border-bottom: 1px solid black;">
		<select name="color">
			<c:forEach items="${color}" var="color">
				<option value="${color}">${color}</option>		
			</c:forEach>
		</select>
		<select name="size">
			<c:forEach items="${size}" var="size">
				<option value="${size}">${size}</option>				
			</c:forEach>
		</select>
		</div>
		<input type="button" value="추가" onclick="optionsChange(this)">
		<input type="button" value="변경" onclick="optionsChange(this)">
		<input type="button" value="취소" onclick="exit()" >
	</div>
</body>
</html>