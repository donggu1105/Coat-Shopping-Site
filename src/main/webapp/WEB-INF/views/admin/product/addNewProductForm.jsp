<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<html>
<head>
<style>
@media (min-width: 767.98px) {
  .card {
  	margin-left: 300px;
  	margin-right: 50px;
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
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>


table{
min-width:100%;
margin-top: 5%;
/* margin-left: 20%; */
}  

td{
min-width: 150px;
margin-bottom: 10px;

}
select { width: 298px; /* 원하는 너비설정 */ 
padding: .4em .3em; /* 여백으로 높이 설정 */ 
font-family: inherit; /* 폰트 상속 */ 
background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */
border: 1px solid #999; border-radius: 0px; /* iOS 둥근모서리 제거 */
-webkit-appearance: none; /* 네이티브 외형 감추기 */
-moz-appearance: none; appearance: none; 
}
input{
padding: .4em .3em;
border: 1px solid #999; border-radius: 0px;

}

.b{
min-width:150px;
}

/* table{
width:150%;
margin-top:5%;
} */


/* @media screen and (max-width: 700px) { table{}



 } }
 @media screen and (max-width: 900px) { td 
{ width:100%;


 } }
 */

</style>
</head>

<script>

function readURL(input,id) {
	 if (input.files && input.files[0]) {
	  var reader = new FileReader();
	  reader.onload = function (e) {
		  if(id =='main'){
	   $('#preview').attr('src', e.target.result);  
		  }else{
			  $("#preview"+id).attr('src', e.target.result);  
		  }
	}
	  
	  reader.readAsDataURL(input.files[0]);
	  }
	}
	
	var cnt=1;
	function fn_addFile(){
		
		$("#detail_list").append("디테일이미지 "+cnt+" : <input type='file' name='detail_image"+cnt+"' id='"+cnt+"' onchange='readURL(this,this.id);' />"+"<br>");
		if(cnt % 2 != 0){
			$("#image_list").append("<img src='#' width=200 height=200 id='preview"+cnt+"'> <br>");
		}else{
		$("#image_list").append("<img src='#' width=200 height=200 id='preview"+cnt+"'>");
		}

		cnt++;
	}
	
	
	function backToList(obj){
		obj.action="${contextPath}/admin/product/adminProductMain.do";
		obj.submit();
	}
	$(document).ready(function(){
		
		$("#pro_sale").change(function(){
			
			var originalPrice=$("#pro_price").val();
			if($("#pro_sale").val() != null){
			var discount=$("#pro_sale").val()/100;
			var salesPrice=originalPrice-(originalPrice*discount);
				
			}
			$("#pro_price").val(salesPrice);
			
		});
		
	});
	function itemChange(){
		var top=["반소매","긴소매","후디","민소매","네오프렌"];
		var coat=["트렌치코트","자켓","무스탕 퍼","울 코트","핸드메이드"];
		var shirts=["체크/줄무늬","헨리/차이나","패턴","데님","베이직","반팔셔츠"];
		var knit=["터틀넥","라운드","가디건","조끼"];
		var bottom=["슬랙스","청바지","코튼","반바지","트레이닝"];
		var outer=["자켓","코트","패딩","가죽","집업/조끼","무스탕","수트"];
		var shoes=["스니커즈","슬립온","로퍼","옥스포드","부츠/하이","샌들"];
		var acc=["양말","모자","벨트","반지","팔찌","가방","목걸이","안경","시계","머플러/스카프","넥타이"];
		
		var selectedItem=$("#pro_category").val();
		var changeItem;
		
		if(selectedItem=='상의'){
			changeItem=top;
		}else if(selectedItem=='코트'){
			changeItem=coat;
		}
		else if(selectedItem=='셔츠'){
			changeItem=shirts;
		}else if(selectedItem=='니트'){
			changeItem=knit;
		}else if(selectedItem=='하의'){
			changeItem=bottom;
		}else if(selectedItem=='아우터'){
			changeItem=outer;
		}else if(selectedItem=='신발'){
			changeItem=shoes;
		}else if(selectedItem=='악세사리'){
			changeItem=acc;
		}
		
		$("#pro_category_detail").empty();
		
		for(var i=0; i<changeItem.length; i++){
			var option=$("<option value='"+changeItem[i]+"'>"+changeItem[i]+"</option>");
			$("#pro_category_detail").append(option);
			
		}
	}
	/* pro_category_detail */

</script>
<body>
 <div class="container-fluid">
             
                <div class="row">
                    <!-- column -->
                    <div class="col-12">
                       
                       
                       
                        <div class="card">
                           
                           
                           
                            
<!--                             <div class="comment-widgets scrollable"> -->
                             <!--membersList  -->	
   <form action="${contextPath }/admin/product/addNewProduct.do" method="post" enctype="multipart/form-data" id="frm_register">
   	 <center>
   	 <br><br>
   	 <center>
   	 <h2>새 상품 등록창</h2>
   	 </center>
   	 <table style="min-width:50%;">
   	 <tr>
   	 	<td>상품 카테고리 </td>
   	 	<td>
   	 		<select name="pro_category" onchange="itemChange();" id="pro_category">
   	 			<option value="카테고리 설정" >카테고리 설정</option>
   	 			<option value="코트" >코트</option>
   	 			<option value="상의" >상의</option>
   	 			<option value="셔츠" >셔츠</option>
   	 			<option value="니트" >니트</option>
   	 			<option value="하의">하의</option>
   	 			<option value="아우터">아우터</option>
   	 			<option value="신발">신발</option>
   	 			<option value="악세사리">악세사리</option>
   	 		</select>
   	 	</td>
   	 	</tr>
		<tr>
   	 	<td >상품 세부 카테고리 </td>
   	 	<td >
   	 		<select id="pro_category_detail" name="pro_category_detail">
				<option selected>--세부카테고리--</option>   	 		
   	 		</select>
   	 	</td>
   	 </tr>
   	 <tr>
   	 	<td>상품 이름 </td>
   	 	<td  class="b">
   	 		<input type="text" name="pro_name" size="39"/>
   	 	</td>
   	 	</tr>
   	 	<tr>
   	 		<td>상품 구분 </td>
   	 	<td  class="b">
   	 		<select name="pro_status" >
   	 			<option value="newseller" selected>신제품</option>
   	 			<option value="bestseller">베스트셀러</option>
   	 			<option value="steadyseller">스테디셀러</option>
   	 			<option value="onSale">할인중</option>
   	 			<option value="buy_out">품절</option>
   	 		</select>
   	 	</td>
   	 </tr>
   	  <tr>
   	 	<td>상품 가격 </td>
   	 	<td  class="b">
   	 		<input type="text" name="pro_price" id="pro_price" size="39" />
   	 	</td>
   	 	</tr>
   	 	<tr>
   	 	<td>상품 할인율 </td>
   	 	<td  class="b">
   	 		<input type="text" name="pro_sale" id="pro_sale" size="39" /> %
   	 	</td>
   	 </tr>
 		
 		<tr>
 		<td>상품 색상 </td>
		<td  class="b">
		<select name="pro_color">
			<!-- 색상추가 일치시키기 -->
			<option value="오트밀" selected>오트밀</option>
			<option value="블랙">블랙</option>
			<option value="카멜">카멜</option>
			<option value="그레이">그레이</option>
			<option value="브라운">브라운</option>
			<option value="베이지">베이지</option>
			<option value="베이지 체크">베이지 체크</option>
			<option value="핑크">핑크</option>
			<option value="연핑크">연핑크</option>
			<option value="아이보리">아이보리</option>
			<option value="딥에메랄드">딥에메랄드</option>
			<option value="와인">와인</option>
			<option value="크림">크림</option>
			<option value="스카이">스카이</option>
			<option value="라벤더">라벤더</option>
			<option value="진베이지">진베이지</option>
			<option value="카키그레이">카키그레이</option>
			<option value="화이트">화이트</option>
			<option value="연베이지">연베이지</option>
			<option value="그레이베이지">그레이베이지</option>
		</select>
		</td>
		</tr>
		<tr>
 				<td>상품 사이즈  </td>
		<td  class="b">
		<select name="pro_size">
			<option value="Free" selected>Free</option>
			<option value="XS" >XS</option>
			<option value="S" >S</option>
			<option value="M" >M</option>
			<option value="L" >L</option>
			<option value="XL" >XL</option>
			<option value="XXL" >XXL</option>
		
		</select>
		</td>
 		
 		
 		
 		</tr>
   	 <tr>
   	 	<td>소재</td>
   	 	<td  class="b">
   	 	<select name="pro_material">
   	 		<option value="가죽" selected>가죽</option>
   	 		<option value="면">면</option>
   	 		<option value="폴리에스테르">폴리에스테르</option>
   	 		<option value="레이온">레이온</option>
   	 		<option value="기모">기모</option>
   	 		<option value="분또">분또</option>
   	 		<option value="아크릴">아크릴</option>
   	 		<option value="텐셀">텐셀</option>
   	 		<option value="울">울</option>
   	 		<option value="캐시미어">캐시미어</option>
   	 		<option value="트위드">트위드</option>
   	 	</select>
   	 	
   	 	</td>
   	 	</tr>
   	 	<tr>
   	 <td>판매 재고 </td>
		<td  class="b"><!--지금 애 스트링으로 받아옴  -->
			<input type="text" name="pro_quantity" size="39" /> 개		
		</td>
   	 </tr>
   	
   	 <tr>
   	 	<td>상품 설명</td>
   	 	<td  class="b">
   	 		<textarea rows="8" cols="39" name="pro_content" ></textarea>
   	 	</td>
   	 	</tr>
   	 	<tr>
   	 	<td>주의사항</td>
   		<td  class="b">
   		<textarea name="pro_prec" rows="8" cols="39"></textarea>
   		</td> 
   	 </tr>
   	 <tr>
   		<td>메인 이미지 추가 </td>
   		<td  class="b">
   			 <input type="file" value="메인 이미지 등록" id="main" name="main_image"  onchange="readURL(this,this.id);" />
   			
   			<input type="button" value="디테일 이미지 추가" onClick="fn_addFile()" />
   				 
   					
   		</td>
   		</tr>
   	<tr>
   	<td>상품 이미지 등록 </td>
   	
   		
   		<td colspan="2">
   			<div id="detail_list">
   					</div>
   					<div id="image_list">
   			<img id="preview" src="#" width=200 height=200 />
   			</div>
   			
   		</td>
   	</tr>	
   <tr>
   	<td colspan="4">
   	<input type="submit" value="상품 등록하기" /> 
   	<input type="button" value="목록창으로 돌아가기" onClick="backToList(this.form)" />
   	</td>
   </tr>
   </table>
   </center>
   </form>
   
<!-- </div> -->

</div>
</div>
</div>
</div>
</body>
</html>