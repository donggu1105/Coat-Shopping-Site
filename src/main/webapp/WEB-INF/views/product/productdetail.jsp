<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- 리뷰관련 -->
<c:set var="printPrReview" value="${productReviewMap.printPrReview}" />
<c:set var="prCount" value="${productReviewMap.prCount}" />
<c:set var="starAvg" value="${productReviewMap.starAvg}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>

.bubbly-buttons {
  font-family: 'Helvetica', 'Arial', sans-serif;
  display: inline-block;
  font-size: 1em;
  padding: 1em 2em;
  margin-top: 5px;
  margin-bottom: 5px;
  -webkit-appearance: none;
  appearance: none;
  background-color: #FF084E;
  color: #fff;
  border-radius: 4px;
  border: none;
  cursor: pointer;
  position: relative;
  transition: transform ease-in 0.1s, box-shadow ease-in 0.25s;

}
.bubbly-buttons:focus {
  outline: 0;
}
.bubbly-buttons:before, .bubbly-button:after {
  position: absolute;
  content: '';
  display: block;
  width: 140%;
  height: 100%;
  left: -20%;
  z-index: -1000;
  transition: all ease-in-out 0.5s;
  background-repeat: no-repeat;
}
.bubbly-buttons:before {
  display: none;
  top: -75%;
  background-image: radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, transparent 20%, #ff0081 20%, transparent 30%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, transparent 10%, #ff0081 15%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%);
  background-size: 10% 10%, 20% 20%, 15% 15%, 20% 20%, 18% 18%, 10% 10%, 15% 15%, 10% 10%, 18% 18%;
}
.bubbly-buttons:after {
  display: none;
  bottom: -75%;
  background-image: radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, transparent 10%, #ff0081 15%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%), radial-gradient(circle, #ff0081 20%, transparent 20%);
  background-size: 15% 15%, 20% 20%, 18% 18%, 20% 20%, 15% 15%, 10% 10%, 20% 20%;
}
.bubbly-buttons:active {
  transform: scale(0.9);
  background-color: #e60074;
  box-shadow: 0 2px 25px rgba(255, 0, 130, 0.2);
}
.bubbly-buttons.animate:before {
  display: block;
  animation: topBubbles ease-in-out 0.75s forwards;
}
.bubbly-buttons.animate:after {
  display: block;
  animation: bottomBubbles ease-in-out 0.75s forwards;
}

@keyframes topBubbles {
  0% {
    background-position: 5% 90%, 10% 90%, 10% 90%, 15% 90%, 25% 90%, 25% 90%, 40% 90%, 55% 90%, 70% 90%;
  }
  50% {
    background-position: 0% 80%, 0% 20%, 10% 40%, 20% 0%, 30% 30%, 22% 50%, 50% 50%, 65% 20%, 90% 30%;
  }
  100% {
    background-position: 0% 70%, 0% 10%, 10% 30%, 20% -10%, 30% 20%, 22% 40%, 50% 40%, 65% 10%, 90% 20%;
    background-size: 0% 0%, 0% 0%,  0% 0%,  0% 0%,  0% 0%,  0% 0%;
  }
}
@keyframes bottomBubbles {
  0% {
    background-position: 10% -10%, 30% 10%, 55% -10%, 70% -10%, 85% -10%, 70% -10%, 70% 0%;
  }
  50% {
    background-position: 0% 80%, 20% 80%, 45% 60%, 60% 100%, 75% 70%, 95% 60%, 105% 0%;
  }
  100% {
    background-position: 0% 90%, 20% 90%, 45% 70%, 60% 110%, 75% 80%, 95% 70%, 110% 10%;
    background-size: 0% 0%, 0% 0%,  0% 0%,  0% 0%,  0% 0%,  0% 0%;
  }
}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var pro_detail_code;
		function quantity_check(sel){
			var pro_code = ${product.pro_code};
			var color = $('select[name=color]').val();
			var size = $('select[name=size]').val();
			var quantity_div = $('#quantity_check');
			console.log(color + " " + size + " " + pro_code);
			if(color != null && size != null && color != '' && size != ''){
				$.ajax({
					type : 'POST',
					url : '${contextPath}/product/quantitycheck.do' ,
					dataType : 'text',
					data : {
						color : color ,
						size : size,
						pro_code : pro_code
					},
					success : function(data){
						console.log(data);
						if(data == 0){
							pro_detail_code = 0;
							quantity_div.show();
							quantity_div.text('품절 상품');
						}else{
							pro_detail_code = data;
							quantity_div.show();
							quantity_div.text('구매 가능');
						}
						
					},
					error : function(data){
					}
				});
			}else{
				quantity_div.hide();
			}
		}
	
	$(document).ready(function(){
		$('select[name=quantity]').change(function(){
			var quantity = $(this).val();
			$('#total_price').text(${product.pro_price} * quantity);
		});
	});
	
	
	var addcart_result = true;
	function Submit(select){
	      var col = "";
	      var code = 0 ;
	      <c:choose>
	         <c:when test="${memberInfo.member_code != null}">
	            code = ${memberInfo.member_code};
	            col = 'member';
	         </c:when>
	         <c:when test="${nonmemberInfo.nonmember_code != null}">
	            code = ${nonmemberInfo.nonmember_code};
	            col = 'nonmember';
	         </c:when>
	         <c:otherwise>
	            alert('로그인을 하셔야 이용하실 수 있습니다');
	            location.href="${contextPath}/member/memberloginform.do";
	            return;
	         </c:otherwise>
	      </c:choose>
	      if(code != 0){
	    	  <c:if test="${product.pro_sale != 0}">
	    	  	var pro_price = ${product.pro_price - product.pro_price * (product.pro_sale * 0.01)};
	    	  </c:if>
	    	  <c:if test="${product.pro_sale == 0}">
	    	  	var pro_price = ${product.pro_price};
	    	  </c:if>
	         var pro_code = ${product.pro_code};
	         var color = $('select[name=color]').val();
	         var size = $('select[name=size]').val();
	         var quantity = parseInt($('input[name=quantity]').val());
	         
	         var pro_detail_code_int = 0 ;
	         if(pro_detail_code != null){
	             pro_detail_code_int = parseInt(pro_detail_code);}
	         
	         if(color == 'null' || size == 'null'){
	        	 alert('옵션을 선택해 주세요');
	        	 addcart_result = false;
				 return ;        	 
	         }
	         if(pro_detail_code_int == 0) {
                 alert('품절 상품입니다');
                 addcart_result = false;
                 return ;
             }
	         
	         
	         var result = cart_overlap(pro_detail_code_int, col , code);
	         var confirm_result;
	            if(result == 'false'){
	               confirm_result = confirm("장바구니에 이미 중복된 상품이 있습니다. 그래도 담으시겠습니까?");
	               addcart_result = confirm_result;
	               
	            }
	            else if(result == 'true'){
	               confirm_result = true;
	            }
	            if(confirm_result == false){
	               return;
	            }else if(confirm_result == true){
	         $.ajax({
	            type : 'POST',
	            url : '${contextPath}/cart/addcart.do',
	            async: false,
	            dataType : 'text',
	            data : {
                            cart_pro_code 		 : pro_code, 
							cart_pro_detail_code : pro_detail_code_int,
							cart_pro_price 	 	 : pro_price ,
							cart_pro_color 		 : color ,
							cart_pro_size  		 : size ,
							cart_pro_quantity 	 : quantity ,
							code 				 : code ,
							result 				 : result ,
							col 				 : col
	            },
	            success : function(){
	               if(select == '장바구니'){
	                  var confirm_result2 = confirm("장바구니로 바로 가시겠습니까?");
	                  
	                  if(confirm_result2 == true)
	                     location.href='${contextPath}/cart/cartlist.do';
	               }else if(select =='바로구매' ){
	                  if(confirm('주문페이지로 바로 이동하시겠습니까?')){
	                  location.href='${contextPath}/order/orderMain.do?cart_pro_detail_code='+pro_detail_code_int;
	                  }
	               }
	            },
	            error : function(){
	               alert('err');
	            }
	         });
	         
	         $('input[name=quantity]').html('1');
	         }
	      
	         }
	         
	      }
	
	
	function cart_overlap(pro_detail_code , col , code){
		var result;
		$.ajax({
			type : 'POST',
			url : '${contextPath}/cart/cart_overlap.do',
			async: false,
			data : {
				pro_detail_code : pro_detail_code,
				col : col,
				code : code,
			},
			success : function(data){
				result = data;
			},
			error : function(data){
				alert('err');
			}
		});	
		return result;
	}
</script>






























<style>
input[name="detail_color"]+label {
	border: 2px solid #111111;
	margin: 10px;
	padding: 15px;
	transition: all ease 0.35s;
}

input[name="detail_color"]:checked+label {
	background-color: #ff084e;
	color: white;
}

input[name="detail_color"]:hover+label {
	cursor: pointer;
}

input[name="detail_size"]+label {
	border: 2px solid #111111;
	margin: 10px;
	padding: 10px;
	transition: all ease 0.35s;
}

input[name="detail_size"]:checked+label {
	background-color: #ff084e;
	color: white;
}

input[name="detail_size"]:hover+label {
	cursor: pointer;
}

.clear {
	clear: both;
}
</style>
</head>
<body>
	<%-- 	<br><br><br>
	<section class="single_product_details_area section_padding_0_100">
	<div class="container">
		<div class="row">

			<div class="col-12 col-md-6">
				<div class="single_product_thumb">
					<div id="product_details_slider" class="carousel slide"
						data-ride="carousel">

						

						<div class="pro_main" id="main_image">
							<c:forEach items="${product_image}" var="image">
								<c:if test="${image.pro_imageFileType == 'main_image'}">
									<img width="450px" height="675px"
										src="${contextPath}/thumbnails.do?pro_code=${product.pro_code}&fileName=${image.pro_imageFileName}">
								</c:if>
							</c:forEach>
						</div>




					</div>
				</div>
			</div>

			<div class="col-12 col-md-6">
				<div class="single_product_desc">

					<h4 class="title">
						<div>
							<strong style="text-align: right;">${product.pro_name}</strong>

						</div>
					</h4>
					<c:choose>
						<c:when test="${product.pro_sale != 0 }">
							<div class="price"><label id="total_price"><del>
									<fmt:formatNumber value="${product.pro_price}" pattern="#,###" />
								</del>
								&nbsp;&nbsp;&nbsp;
								<span style="color: red;"><fmt:formatNumber
										value="${product.pro_price - product.pro_price * (product.pro_sale * 0.01)}"
										pattern="#,###" /> 원</span>
							</label></div>
						</c:when>
						<c:otherwise>
							<div class="price"><label id="total_price"><fmt:formatNumber pattern="#,###">${product.pro_price}</fmt:formatNumber></label> 원</div>
						</c:otherwise>
					</c:choose>

					

					<!-- 리뷰 연동 별점 -->
					<c:if test="${prCount>0}">
					<div class="single_product_ratings mb-15" style="color: #FE9A2E;">
                    <c:forEach begin="1" end="${starAvg }">
						<i class="fa fa-star" aria-hidden="true"></i>
					</c:forEach>
					
					<c:choose>
						<c:when test="${starAvg<=4 }">
							<c:forEach begin="${starAvg+1 }" end="5">
								<i class="fa fa-star-o" aria-hidden="true"></i>
							</c:forEach>
						</c:when>
					</c:choose>
					</div>
					</c:if>
					 <c:if test="${prCount==0}">
					<div>아직 리뷰가 없습니다.</div>
					<br>
					</c:if> 
					<!--  -->


					<div class="widget size mb-30">
						<h6 class="widget-title">Color</h6>
						<div class="widget-desc" id="color">


							<c:forEach items="${color}" var="color">
								<input style="display: none;" type="radio" name="detail_color"
									id="${color}" value="${color }">
								<label for="${color }">${color }</label>
							</c:forEach>
						</div>


					</div>





					<div class="widget size mb-30">
						<h6 class="widget-title">Size</h6>
						<div class="widget-desc" id="size">

							<c:forEach items="${size}" var="size">
								<input style="display: none;" type="radio" name="detail_size"
									id="${size}" value="${size }">
								<label for="${size }">${size }</label>
							</c:forEach>

						</div>
					</div>











<h6 class="widget-title">amount</h6>
					<!-- Add to Cart Form -->
					<form class="cart clearfix d-flex" method="post">
					
						<div class="quantity">
								<span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;">
								<i class="fa fa-minus" aria-hidden="true"></i></span> 
								<input type="number" class="qty-text" id="qty" step="1" min="1" max="12" name="quantity" value="1">
								<span class="qty-minus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;">
								<i class="fa fa-plus" aria-hidden="true"></i></span>
								
								 
								
								
						</div>
						
	
							
					
					</form>
				

<button class="bubbly-button" onclick="Submit('장바구니');">장바구니</button>
<button class="bubbly-button" onclick="Submit('바로구매');">바로구매</button>




<!-- 
div><input type="button" value="장바구니" onclick="Submit(this);"></div>
		<div><input type="button" value="바로구매" onclick="Submit(this);"></div>


 -->





				 <div class="clear"></div>
						<br><br>	
					<div id="accordion" role="tablist">
						<div class="card">
							<div class="card-header" role="tab" id="headingOne">
								<h6 class="mb-0">
									<a data-toggle="collapse" href="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne">Information</a>
										<span
										class="karl-level2">click!</span>
								</h6>
							</div>

							<div id="collapseOne" class="collapse show" role="tabpanel"
								aria-labelledby="headingOne" data-parent="#accordion">
								<div class="card-body">
									<div id="main_option" style="text-align: left;">${product.pro_content}</div>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" role="tab" id="headingTwo">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">세탁법</a>
										<span
										class="karl-level3">click!</span>
								</h6>
								
							</div>
							<div id="collapseTwo" class="collapse" role="tabpanel"
								aria-labelledby="headingTwo" data-parent="#accordion">
								<div class="card-body">
									${product.pro_prec}
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" role="tab" id="headingThree">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse"
										href="#collapseThree" aria-expanded="false"
										aria-controls="collapseThree">원단 &amp; 원산지</a>
										<span
										class="karl-level4">click!</span>
								</h6>
							</div>
							<div id="collapseThree" class="collapse" role="tabpanel"
								aria-labelledby="headingThree" data-parent="#accordion">
								<div class="card-body">
									원단 : ${product.pro_material }<br>
									원산지 : ${product.pro_country }
								</div>
							</div>
						</div>
						
					</div>

				</div>
			</div>
		</div>
	</div>
	</section>

	<center>
	<div id="img_lists">
		<div id="content">
			
			<div>
				<c:forEach items="${product_image }" var="image">
					<img
						src="${contextPath}/thumbnails.do?pro_code=${product.pro_code}&fileName=${image.pro_imageFileName}" />
						<br>
				</c:forEach>
			</div>
		</div>
	</div>
	</center>
	
	<br><br><br><br><br><br><!-- 리뷰 -->
	
	<c:if test="${prCount>0 }">
	
      <div class="site-section block-3 site-blocks-2 bg-light">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-7 site-section-heading text-center pt-4">
            <h2>Review</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="nonloop-block-3 owl-carousel">
 
            <c:forEach items="${printPrReview }" var="pr">
            <a href="${contextPath }/notice/review/contentView.do?review_num=${pr.review_num}">
              <div class="item">
                <div class="block-4 text-center">
                
                   <figure class="block-4-image">
                    <img style="width:340px; height: 340px;"src="${contextPath}/thumbnailsRe.do?review_num=${pr.review_num}&fileName=${pr.review_imageFileName}"
                     alt="Image placeholder" class="img-fluid" />
                  </figure> 
                  
                  <div class="block-4-text p-4">
                   <h3>${pr.review_title }</h3>
                    
					<div class="single_product_ratings mb-15" style="color: #FE9A2E;">
                    <c:forEach begin="1" end="${pr.review_star }">
						<i class="fa fa-star" aria-hidden="true"></i>
					</c:forEach>
					
					<c:choose>
						<c:when test="${pr.review_star<=4 }">
							<c:forEach begin="${pr.review_star+1 }" end="5">
								<i class="fa fa-star-o" aria-hidden="true"></i>
							</c:forEach>
						</c:when>
					</c:choose>
					</div>
                  </div>
                </div>
              </div>
              </a>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </div>
	</c:if>
	<!--  -->
	 --%>






	<!-- Product Detail -->
	<section class="sec-product-detail bg0 p-t-65 p-b-60">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-lg-7 p-b-30">
				<div class="p-l-25 p-r-30 p-lr-0-lg">
					<div class="wrap-slick3 flex-sb flex-w">
						<div class="wrap-slick3-dots"></div>
						<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

						<div class="slick3 gallery-lb">
							<c:forEach items="${product_image}" var="image">
								<c:if
									test="${image.pro_imageFileType eq 'main_image' || image.pro_imageFileType eq 'detail_image1' }">
									<div class="item-slick3"
										data-thumb="${contextPath}/thumbnails.do?pro_code=${product.pro_code}&fileName=${image.pro_imageFileName}">
										<div class="wrap-pic-w pos-relative">

<%-- 											<c:if test="${image.pro_imageFileType == 'main_image'}"> --%>
												<img width="450px" height="675px"
													src="${contextPath}/thumbnails.do?pro_code=${product.pro_code}&fileName=${image.pro_imageFileName}">
<%-- 											</c:if> --%>
											<a
												class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
												href="${contextPath}/thumbnails.do?pro_code=${product.pro_code}&fileName=${image.pro_imageFileName}">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>
								</c:if>
							</c:forEach>



						</div>
					</div>
				</div>
			</div>

			<div class="col-md-6 col-lg-5 p-b-30">
				<div class="p-r-50 p-t-5 p-lr-0-lg">
					<h4 class="mtext-105 cl2 js-name-detail p-b-14">
						${product.pro_name}</h4>

					<!-- <span class="mtext-106 cl2">
							$58.79
						</span> -->
					<c:choose>
						<c:when test="${product.pro_sale != 0 }">
							<div class="price">
								<label id="total_price"><del>
										<fmt:formatNumber value="${product.pro_price}" pattern="#,###" />
									</del> &nbsp;&nbsp;&nbsp; <span style="color: red;"><fmt:formatNumber
											value="${product.pro_price - product.pro_price * (product.pro_sale * 0.01)}"
											pattern="#,###" /> 원</span> </label>
							</div>
						</c:when>
						<c:otherwise>
							<div class="price">
								<label id="total_price"><fmt:formatNumber
										pattern="#,###">${product.pro_price}</fmt:formatNumber></label> 원
							</div>
						</c:otherwise>
					</c:choose>
					<c:if test="${prCount>0}">
						<div class="single_product_ratings mb-15" style="color: #FE9A2E;">
							<c:forEach begin="1" end="${starAvg }">
								<i class="fa fa-star" aria-hidden="true"></i>
							</c:forEach>

							<c:choose>
								<c:when test="${starAvg<=4 }">
									<c:forEach begin="${starAvg+1 }" end="5">
										<i class="fa fa-star-o" aria-hidden="true"></i>
									</c:forEach>
								</c:when>
							</c:choose>
						</div>
					</c:if>
					<c:if test="${prCount==0}">
						<div>아직 리뷰가 없습니다.</div>
						<br>
					</c:if>
					<p class="stext-102 cl3 p-t-23">${product.pro_content}</p>
								<div style="color: red;" id="quantity_check"></div>

					<!--  -->
					<div class="p-t-33">
						<div class="flex-w flex-r-m p-b-10">
							<div class="size-203 flex-c-m respon6">Size</div>

							<div class="size-204 respon6-next">
								<div class="rs1-select2 bor8 bg0">
									<select class="js-select2" name="size" onchange="quantity_check(this)">
										<option value="null">사이즈를 선택해주세요.</option>
										<c:forEach items="${size}" var="size">
											<option value="${size}">Size ${size}</option>
										</c:forEach>
									</select>
									<div class="dropDownSelect2"></div>
								</div>
							</div>
						</div>

						<div class="flex-w flex-r-m p-b-10">
							<div class="size-203 flex-c-m respon6">Color</div>

							<div class="size-204 respon6-next">
								<div class="rs1-select2 bor8 bg0">
									<select class="js-select2" name="color" onchange="quantity_check(this)">
										<option value="null">색깔을 선택해주세요.</option>
										<c:forEach items="${color}" var="color">
											<option value="${color}">${color}</option>
										</c:forEach>
									</select>
									<div class="dropDownSelect2"></div>
								</div>
							</div>
									
		
						</div>

						<div class="flex-w flex-r-m p-b-10">
							<div class="size-204 flex-w flex-m respon6-next">
								<div class="wrap-num-product flex-w m-r-20 m-tb-10">
									<div
										class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
										<i class="fs-16 zmdi zmdi-minus"></i>
									</div>

									<input class="mtext-104 cl3 txt-center num-product"
										type="number" name="quantity" value="1">

									<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
										<i class="fs-16 zmdi zmdi-plus"></i>
									</div>
								</div>
								<br><br>

								<!-- <button onclick="Submit()"
									class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
									Add to cart</button>
										<button onclick="Submit()"
									class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
									Add to cart</button> -->
									
									
									
							</div>
							
						</div>
						<br><br>
						<div class="flex-w flex-r-m p-b-10">
							

							
									<button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail" onclick="Submit('장바구니');" style="background-color: #FF084E !important;">
										장바구니
									</button>
						<button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail" onclick="Submit('바로구매');" style="background-color: #FF084E !important;">
										바로구매
									</button>
		
						</div>
						
						
<%-- 						<center>
						
						<button class="bubbly-buttons js-addcart-detail" onclick="Submit('장바구니');">장바구니</button>
						
									<button onclick="Submit('바로구매');" class="bubbly-buttons">바로구매</button>
				
				
	
				</center>  --%>
				
				

				
				
				
				
				
				
				
				
				
				
				
				
				
					</div>


				</div>
			</div>
		</div>

		<div class="bor10 m-t-50 p-t-43 p-b-40">
			<!-- Tab01 -->
			<div class="tab01">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item p-b-10"><a class="nav-link active"
						data-toggle="tab" href="#description" role="tab">세탁법</a></li>

					<li class="nav-item p-b-10"><a class="nav-link"
						data-toggle="tab" href="#information" role="tab">원단 &amp; 원산지</a>
					</li>

					<!-- <li class="nav-item p-b-10"><a class="nav-link"
						data-toggle="tab" href="#reviews" role="tab">Reviews (1)</a></li> -->
				</ul>

				<!-- Tab panes -->
				<div class="tab-content p-t-43">
					<!-- - -->
					<div class="tab-pane fade show active" id="description"
						role="tabpanel">
						<div class="how-pos2 p-lr-15-md">
							<p class="stext-102 cl6">${product.pro_prec}</p>
						</div>
					</div>

					<!-- - -->
					<div class="tab-pane fade" id="information" role="tabpanel">
						<div class="row">
							<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
								<ul class="p-lr-28 p-lr-15-sm">
									<li class="flex-w flex-t p-b-7"><span
										class="stext-102 cl3 size-205"> 원단 </span> <span
										class="stext-102 cl6 size-206"> ${product.pro_material }
									</span></li>

									<li class="flex-w flex-t p-b-7"><span
										class="stext-102 cl3 size-205"> 원산지 </span> <span
										class="stext-102 cl6 size-206"> ${product.pro_country }
									</span></li>






								</ul>
							</div>
						</div>
					</div>

					<!-- - -->
<!-- 					<div class="tab-pane fade" id="reviews" role="tabpanel">
						<div class="row">
							<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
								<div class="p-b-30 m-lr-15-sm">
									Review
									<div class="flex-w flex-t p-b-68">
										<div class="wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6">
											<img src="images/avatar-01.jpg" alt="AVATAR">
										</div>


									</div>

									Add review
									<form class="w-full">
										<h5 class="mtext-108 cl2 p-b-7">Add a review</h5>

										<p class="stext-102 cl6">Your email address will not be
											published. Required fields are marked *</p>

										<div class="flex-w flex-m p-t-50 p-b-23">
											<span class="stext-102 cl3 m-r-16"> Your Rating </span> <span
												class="wrap-rating fs-18 cl11 pointer"> <i
												class="item-rating pointer zmdi zmdi-star-outline"></i> <i
												class="item-rating pointer zmdi zmdi-star-outline"></i> <i
												class="item-rating pointer zmdi zmdi-star-outline"></i> <i
												class="item-rating pointer zmdi zmdi-star-outline"></i> <i
												class="item-rating pointer zmdi zmdi-star-outline"></i> <input
												class="dis-none" type="number" name="rating">
											</span>
										</div>

										<div class="row p-b-25">
											<div class="col-12 p-b-5">
												<label class="stext-102 cl3" for="review">Your
													review</label>
												<textarea
													class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10"
													id="review" name="review"></textarea>
											</div>

											<div class="col-sm-6 p-b-5">
												<label class="stext-102 cl3" for="name">Name</label> <input
													class="size-111 bor8 stext-102 cl2 p-lr-20" id="name"
													type="text" name="name">
											</div>

											<div class="col-sm-6 p-b-5">
												<label class="stext-102 cl3" for="email">Email</label> <input
													class="size-111 bor8 stext-102 cl2 p-lr-20" id="email"
													type="text" name="email">
											</div>
										</div>

										<button
											class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">
											Submit</button>
									</form>





								</div>
							</div>
						</div>
					</div> -->
				</div>












			</div>
		</div>
	</div>


	</section>

	<div id="img_lists">
		<BR> <BR>
		<center>


			<div id="content">

				<div>
					<c:forEach items="${product_image }" var="image">
						<img
							src="${contextPath}/thumbnails.do?pro_code=${product.pro_code}&fileName=${image.pro_imageFileName}" />
						<br>
					</c:forEach>
				</div>
			</div>
		</center>
	</div>

	<c:if test="${prCount>0 }">

		<div class="site-section block-3 site-blocks-2 bg-light">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-7 site-section-heading text-center pt-4">
						<h2>Review</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="nonloop-block-3 owl-carousel">

							<c:forEach items="${printPrReview }" var="pr">
								<a
									href="${contextPath }/notice/review/contentView.do?review_num=${pr.review_num}">
									<div class="item">
										<div class="block-4 text-center">

											<figure class="block-4-image"> <img
												style="width: 340px; height: 340px;"
												src="${contextPath}/thumbnailsRe.do?review_num=${pr.review_num}&fileName=${pr.review_imageFileName}"
												alt="Image placeholder" class="img-fluid" /> </figure>

											<div class="block-4-text p-4">
												<h5>${pr.review_title }</h5>

												<div class="single_product_ratings mb-15"
													style="color: #FE9A2E;">
													<c:forEach begin="1" end="${pr.review_star }">
														<i class="fa fa-star" aria-hidden="true"></i>
													</c:forEach>

													<c:choose>
														<c:when test="${pr.review_star<=4 }">
															<c:forEach begin="${pr.review_star+1 }" end="5">
																<i class="fa fa-star-o" aria-hidden="true"></i>
															</c:forEach>
														</c:when>
													</c:choose>
												</div>
											</div>
										</div>
									</div>
								</a>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>

</body>


<script src="${contextPath}/resources/k/js/jquery/jquery-2.2.4.min.js"></script>
<script src="${contextPath}/resources/k/js/popper.min.js"></script>
<script src="${contextPath}/resources/k/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/k/js/plugins.js"></script>
<script src="${contextPath}/resources/k/js/active.js"></script>


<!--===============================================================================================-->
<script>
var animateButton = function(e) {

	  e.preventDefault;
	  //reset animation
	  e.target.classList.remove('animate');
	  
	  e.target.classList.add('animate');
	  setTimeout(function(){
	    e.target.classList.remove('animate');
	  },700);
	};

	var bubblyButtons = document.getElementsByClassName("bubbly-buttons");

	for (var i = 0; i < bubblyButtons.length; i++) {
	  bubblyButtons[i].addEventListener('click', animateButton, false);
	}
</script>

<script
	src="${contextPath}/resources/c/vendor/animsition/js/animsition.min.js"></script>
<script src="${contextPath}/resources/c/vendor/bootstrap/js/popper.js"></script>
<script
	src="${contextPath}/resources/c/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/c/vendor/select2/select2.min.js"></script>
<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<script
	src="${contextPath}/resources/c/vendor/daterangepicker/moment.min.js"></script>
<script
	src="${contextPath}/resources/c/vendor/daterangepicker/daterangepicker.js"></script>
<script src="${contextPath}/resources/c/vendor/slick/slick.min.js"></script>
<script src="${contextPath}/resources/c/js/slick-custom.js"></script>
<script
	src="${contextPath}/resources/c/vendor/parallax100/parallax100.js"></script>
<script>
        $('.parallax100').parallax100();
	</script>
<script
	src="${contextPath}/resources/c/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<script
	src="${contextPath}/resources/c/vendor/isotope/isotope.pkgd.min.js"></script>
<script
	src="${contextPath}/resources/c/vendor/sweetalert/sweetalert.min.js"></script>
<script>
		$('.js-addwish-b2').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				if(addcart_result){
				swal(nameProduct, "is added to cart !", "success");
				}
			});
		});
	</script>
<script
	src="${contextPath}/resources/c/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<script src="${contextPath}/resources/c/js/main.js"></script>
<script src="${contextPath}/resources/s/js/jquery-ui.js"></script>
<script src="${contextPath}/resources/s/js/popper.min.js"></script>
<script src="${contextPath}/resources/s/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/s/js/owl.carousel.min.js"></script>
<script src="${contextPath}/resources/s/js/jquery.magnific-popup.min.js"></script>
<script src="${contextPath}/resources/s/js/aos.js"></script>

<script src="${contextPath}/resources/s/js/main.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</html>