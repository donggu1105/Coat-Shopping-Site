<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="p" value="${paging }" />
<html>
<head>
<style>
/* .a {
	margin-left: 7%;
} */
input[name=list_type] {
	opacity: 0;
}

input[name=list_type]:hover+label {
	cursor: pointer;
	color: #ff084e;

	font-size: 15px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">



<style>
#content {
	padding-top: 40px;
}
</style>

<script src="${contextPath}/resources/k/js/jquery/jquery-2.2.4.min.js"></script>
<script src="${contextPath}/resources/k/js/popper.min.js"></script>
<script src="${contextPath}/resources/k/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/k/js/plugins.js"></script>
<script src="${contextPath}/resources/k/js/active.js"></script>

<!--===============================================================================================-->

<script
	src="${contextPath}/resources/c/vendor/animsition/js/animsition.min.js"></script>
<script src="${contextPath}/resources/c/vendor/bootstrap/js/popper.js"></script>
<script
	src="${contextPath}/resources/c/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/c/vendor/select2/select2.min.js"></script>
<script>
	$(".js-select2").each(function() {
		$(this).select2({
			minimumResultsForSearch : 20,
			dropdownParent : $(this).next('.dropDownSelect2')
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
			delegate : 'a', // the selector for gallery item
			type : 'image',
			gallery : {
				enabled : true
			},
			mainClass : 'mfp-fade'
		});
	});
</script>
<script
	src="${contextPath}/resources/c/vendor/isotope/isotope.pkgd.min.js"></script>
<script
	src="${contextPath}/resources/c/vendor/sweetalert/sweetalert.min.js"></script>
<script>
	$('.js-addwish-b2').on('click', function(e) {
		e.preventDefault();
	});

	$('.js-addwish-b2').each(function() {
		var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
		$(this).on('click', function() {
			swal(nameProduct, "is added to wishlist !", "success");

			$(this).addClass('js-addedwish-b2');
			$(this).off('click');
		});
	});

	$('.js-addwish-detail').each(
			function() {
				var nameProduct = $(this).parent().parent().parent().find(
						'.js-name-detail').html();

				$(this).on('click', function() {
					swal(nameProduct, "is added to wishlist !", "success");

					$(this).addClass('js-addedwish-detail');
					$(this).off('click');
				});
			});

	$('.js-addcart-detail').each(
			function() {
				var nameProduct = $(this).parent().parent().parent().parent()
						.find('.js-name-detail').html();
				$(this).on('click', function() {
					swal(nameProduct, "is added to cart !", "success");
				});
			});
</script>
<script
	src="${contextPath}/resources/c/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script>
	$('.js-pscroll').each(function() {
		$(this).css('position', 'relative');
		$(this).css('overflow', 'hidden');
		var ps = new PerfectScrollbar(this, {
			wheelSpeed : 1,
			scrollingThreshold : 1000,
			wheelPropagation : false,
		});

		$(window).on('resize', function() {
			ps.update();
		})
	});
</script>
<script src="${contextPath}/resources/c/js/main.js"></script>




<script type="text/javascript">
	//Filter functions
	$(document).ready(function() {
			var list_type ;
			var color ;
			var price_type ;
						$("input[name='list_type']").change(function() {
							list_type = $(this).val();
							color = $('input[name=color_type]:checked').val();
							price_type = $('input[name=price_type]:checked').val();
							Filter(list_type,price_type ,color);
										});

						$('input[name=price_type]').change(function() {
							price_type = $(this).val();
							color = $('input[name=color_type]:checked').val();
							list_type = $('input[name=list_type]:checked').val();
							Filter(list_type,price_type ,color);
// 							var size = $('input[name=price_type]').length;
// 							for (var i = 0; i < size; i++) {
// 								if ($('input[name=price_type]:eq( '+ i + ')').is(':checked') == true) {
						//     			 document.getElementById('price_type'+(i+1)).ClassName = 
						//     				 'filter-link stext-106 trans-04 filter-link-active';
						//     			 console.log(document.getElementById('price_type'+(i+1)).ClassName);
// 								} else {
						//     			 document.getElementById('price_type'+(i+1)).ClassName = 
						//     				 'filter-link stext-106 trans-04';
// 								}
// 							}
						});
						
						$('input[name=color_type]').change(function(){
							color = $(this).val();
							list_type = $('input[name=list_type]:checked').val();
							price_type = $('input[name=price_type]:checked').val();
							Filter(list_type,price_type ,color);
						});
					});
	
	
	
	function Filter(list_type , price_type , color_type){
		var param = {
				pro_color : color_type,
				list_type : list_type,
				min_price : price_type,
				keyword_detail : '${keyword_detail}',
				keyword : '${keyword}',
				pagenum : '${p.pagenum}'
		}
		console.log(param);
		$('#products').load('${contextPath}/product/productlist.do #products',
				{	
					pro_color : color_type,
					list_type : list_type,
					min_price : price_type,
					keyword_detail : '${keyword_detail}',
					keyword : '${keyword}',
					pagenum : '${p.pagenum}'
											});
		$('#change_page').load('${contextPath}/product/productlist.do #change_page',
				{	
					pro_color : color_type,
					list_type : list_type,
					min_price : price_type,
					keyword_detail : '${keyword_detail}',
					keyword : '${keyword}',
					pagenum : '${p.pagenum}'
											});
	}
</script>


</head>
<body>


	<div class="bg0 m-t-23 p-b-140" style="">
		<div class="container">
			<div class="flex-w flex-sb-m p-b-52">
				<div class="row isotope-grid" id="products">
					<c:set var="pro_code" value="0" />
					<c:forEach items="${pro_list}" var="list">
								<div class="col-sm-6 col-md-4 col-lg-4 p-b-33 isotope-item">

									<div class="block2-pic hov-img0">
										<a
											href="${contextPath}/product/productdetail.do?pro_code=${list.pro_code}">
											<img
											src="${contextPath}/thumbnails.do?pro_code=${list.pro_code}&fileName=${list.pro_imageFileName}">
										</a>
									</div>
									<div>
										<c:forEach items="${list.pro_color_list}" var="color">
											<div style="padding:5px; float: left; width: 15px; height: 15px; margin-top:10px; margin-right:10px; border: 1px solid #D9D2D5;  border-radius: 50%; background-color: #${color.hex_code}" title="${color.color}">
											</div>
										</c:forEach>
									</div>
									<div style="clear: both;"></div>
									<br><strong><a
										href="${contextPath}/product/productdetail.do?pro_code=${list.pro_code}">${list.pro_name}</a></strong>
									<br>

									<c:if test="${list.pro_sale != 0 }">

										<del>
											<fmt:formatNumber value="${list.pro_price}" pattern="#,###" />
										</del>
								&nbsp;&nbsp;&nbsp;
								<span style="color: red;"><fmt:formatNumber
												value="${list.pro_price - list.pro_price * (list.pro_sale * 0.01)}"
												pattern="#,###" /> 원</span>
									</c:if>

									<c:if test="${list.pro_sale == 0 }">
										<fmt:formatNumber value="${list.pro_price}" pattern="#,###" /> 원 
								
							</c:if>

								</div>
					</c:forEach>
				</div>
			</div>




			<div class="clear"></div>
			<center>
				<div id="change_page">
					<c:if test="${p.prev}">
						<c:choose>
							<c:when test="${p.startpage == 1 }">
								<a	
									href="${contextPath}/product/productlist.do?pagenum=${p.startpage}
								&keyword=${keyword}&keyword_detail=${keyword_detail}&list_type=${list_type}&pro_status=${pro_status}&min_price=${min_price}"
									class="page_a"><<</a>
							</c:when>
							<c:otherwise>
								<a
									href="${contextPath}/product/productlist.do?pagenum=${p.startpage-1}
								&keyword=${keyword}&keyword_detail=${keyword_detail}&list_type=${list_type}&pro_status=${pro_status}&min_price=${min_price}"
									class="page_a"><<</a>
							</c:otherwise>
						</c:choose>
						<a
							href="${contextPath}/product/productlist.do?pagenum=${p.pagenum-1}
						&keyword=${keyword}&keyword_detail=${keyword_detail}&list_type=${list_type}&pro_status=${pro_status}&min_price=${min_price}"
							class="page_a"><</a>
					</c:if>

					<c:forEach begin="${p.startpage}" end="${p.endpage}" var="page">
						<c:choose>
							<c:when test="${page <= p.allpage}">
								<c:choose>
									<c:when test="${page == p.pagenum}">
										<a class="this_page">${page}</a>
									</c:when>
									<c:otherwise>
										<a	
											href="${contextPath}/product/productlist.do?pagenum=${page}
										&keyword=${keyword}&keyword_detail=${keyword_detail}&list_type=${list_type}&pro_status=${pro_status}&min_price=${min_price}"
											class="page_a">${page}</a>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise />
						</c:choose>
					</c:forEach>

					<c:if test="${p.next}">
						<a
							href="${contextPath}/product/productlist.do?pagenum=${p.pagenum+1}
						&keyword=${keyword}&keyword_detail=${keyword_detail}&list_type=${list_type}&pro_status=${pro_status}&min_price=${min_price}"
							class="page_a">></a>
						<c:choose>
							<c:when test="${p.endpage >= p.allpage}">
								<a
									href="${contextPath}/product/productlist.do?pagenum=${p.allpage}
								&keyword=${keyword}&keyword_detail=${keyword_detail}&list_type=${list_type}&pro_status=${pro_status}&min_price=${min_price}"
									class="page_a">>></a>
							</c:when>
							<c:otherwise>
								<a
									href="${contextPath}/product/productlist.do?pagenum=${p.endpage+1}
								&keyword=${keyword}&keyword_detail=${keyword_detail}&list_type=${list_type}&pro_status=${pro_status}&min_price=${min_price}"
									class="page_a">>></a>
							</c:otherwise>
						</c:choose>
					</c:if>

				</div>
			</center>
		</div>
	</div>
</body>
<style>
	#change_page a{
		padding: 8px;
		padding-top:5px;
		padding-bottom:5px;
		margin:7px;
		border-radius: 100% 100% 100% 100%;
	}
	#change_page a:hover{
		background-color: rgba(30,30,30,0.3);
	}
</style>
</html>