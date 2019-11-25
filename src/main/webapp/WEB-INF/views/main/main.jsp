<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main Page</title>
<style>
.bg-overlay1::before {
	content: "";
	position: absolute;
	z-index: -100;
	display: block;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
}
.block1-txt:hover {
   background-color: rgba(0,0,0,0.4);
}
.hov-btn3:hover {
  border-color: #FF084E;
  background-color: #FF084E;
  color: #fff;
}
.filter-link:hover {
  color: #FF084E;
  border-bottom: 1px solid #6c7ae0;
}

.filter-link-active {
  color: #FF084E;
  border-bottom: 1px solid #6c7ae0;
}
.show-search:hover:after,
.show-filter:hover:after {
  background-color: #FF084E;
  border-color: #FF084E;
}
</style>
</head>
<body>










	<!-- Slider -->
<section class="section-slide">
	<div class="wrap-slick1 rs2-slick1">
		<div class="slick1">
			<div class="item-slick1 bg-overlay1"
				style="background-image: url(${contextPath}/resources/banner/banner01.png);"
				data-thumb="${contextPath}/resources/banner/banner01.png" data-caption="1">
				<div class="container h-full"></div>
			</div>

			<div class="item-slick1 bg-overlay1"
				style="background-image: url(${contextPath}/resources/banner/banner02.png);"
				data-thumb="${contextPath}/resources/banner/banner02.png" data-caption="2">
				<div class="container h-full"><</div>
			</div>

			<div class="item-slick1 bg-overlay1"
				style="background-image: url(${contextPath}/resources/banner/banner03.png);"
				data-thumb="${contextPath}/resources/banner/banner03.png" data-caption="3">
				<div class="container h-full"></div>
			</div>
		</div>

		<div class="wrap-slick1-dots p-lr-10"></div>
	</div>
	</section>



	<!-- Banner -->
	<div class="sec-banner bg0 p-t-95 p-b-55">
		<div class="container">
			<div class="row">
				<div class="col-md-6 p-b-30 m-lr-auto">
					<!-- Block1 -->
					<div class="block1 wrap-pic-w">
						<img src="${contextPath}/resources/banner/cata01.png" alt="IMG-BANNER">

						<a
							href="${contextPath}/product/productlist.do?pro_status=steadyseller"
							class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">


							
						</a>
					</div>
				</div>

				<div class="col-md-6 p-b-30 m-lr-auto">
					<!-- Block1 -->
					<div class="block1 wrap-pic-w">
						<img src="${contextPath}/resources/banner/cata02.png"
							alt="IMG-BANNER"> 
							<a
							href="${contextPath}/product/productlist.do?pro_status=onSale"
							class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
							

							
						</a>
					</div>
				</div>

				<div class="col-md-6 col-lg-4 p-b-30 m-lr-auto">
					<!-- Block1 -->
					<div class="block1 wrap-pic-w">
						<img src="${contextPath}/resources/banner/cata03.png"
							alt="IMG-BANNER"> <a
							href="${contextPath}/product/productlist.do?pro_status=newseller"
							class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
						

						</a>
					</div>
				</div>

				<div class="col-md-6 col-lg-4 p-b-30 m-lr-auto">
					<!-- Block1 -->
					<div class="block1 wrap-pic-w">
						<img src="${contextPath}/resources/banner/cata04.png"
							alt="IMG-BANNER"> <a
							href="${contextPath}/product/productlist.do?pro_status=bestseller"
							class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
							

							
						</a>
					</div>
				</div>

				<div class="col-md-6 col-lg-4 p-b-30 m-lr-auto">
					<!-- Block1 -->
					<div class="block1 wrap-pic-w">
						<img src="${contextPath}/resources/banner/cata05.png"
							alt="IMG-BANNER"> <a
							href="${contextPath}/product/productlist.do?pro_status=steadyseller
							" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
							

							
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="p-b-32">
		<h3 class="ltext-105 cl5 txt-center respon1">Best Trenchcoat</h3>
	</div>
	<section class="bg0 p-t-23 p-b-130">
	<div class="container">

		<div class="row isotope-grid">


			<!---->
			<c:set var="pro_code" value="0" />
			<c:forEach items="${pro_list_trench}" var="list">
				<c:choose>
					<c:when test="${pro_code == list.pro_code }" />
					<c:otherwise>
						<div class="col-sm-6 col-md-4 col-lg-4 p-b-33 isotope-item">
							<!-- Block2 -->
							<div class="block2">
								<div class="block2-pic hov-img0">
									<a
										href="${contextPath}/product/productdetail.do?pro_code=${list.pro_code}">
										<img
										src="${contextPath}/thumbnails.do?pro_code=${list.pro_code}&fileName=${list.pro_imageFileName}">
									</a>


								</div>

								<div class="block2-txt flex-w flex-t p-t-14">
									<div class="block2-txt-child1 flex-col-l ">
										<strong><a
											href="${contextPath}/product/productdetail.do?pro_code=${list.pro_code}">${list.pro_name}</a></strong>
										<span class="stext-105 cl3"> <c:if
												test="${list.pro_sale != 0 }">

												<del>
													<fmt:formatNumber value="${list.pro_price}" pattern="#,###" />
												</del>
								&nbsp;&nbsp;&nbsp;
								<span style="color: red;"><fmt:formatNumber
														value="${list.pro_price - list.pro_price * (list.pro_sale * 0.01)}"
														pattern="#,###" /> 원</span>
											</c:if> <c:if test="${list.pro_sale == 0 }">
												<fmt:formatNumber value="${list.pro_price}" pattern="#,###" /> 원 
								
							</c:if>



										</span>
									</div>


								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
				<c:set var="pro_code" value="${list.pro_code }" />
			</c:forEach>







		</div>







	</div>
	</section>

	<div class="p-b-32">
		<h3 class="ltext-105 cl5 txt-center respon1">Best Jacket</h3>
	</div>
	<section class="bg0 p-t-23 p-b-130">
	<div class="container">

		<div class="row isotope-grid">


			<!---->
			<c:set var="pro_code" value="0" />
			<c:forEach items="${pro_list_jk}" var="list">
				<c:choose>
				<c:when test="${pro_code == list.pro_code }" />
				<c:otherwise>
				<div class="col-sm-6 col-md-4 col-lg-4 p-b-33 isotope-item">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<a
								href="${contextPath}/product/productdetail.do?pro_code=${list.pro_code}">
								<img
								src="${contextPath}/thumbnails.do?pro_code=${list.pro_code}&fileName=${list.pro_imageFileName}">
							</a>

						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<strong><a
									href="${contextPath}/product/productdetail.do?pro_code=${list.pro_code}">${list.pro_name}</a></strong>

								<span class="stext-105 cl3"> <c:if
										test="${list.pro_sale != 0 }">

										<del>
											<fmt:formatNumber value="${list.pro_price}" pattern="#,###" />
										</del>
								&nbsp;&nbsp;&nbsp;
								<span style="color: red;"><fmt:formatNumber
												value="${list.pro_price - list.pro_price * (list.pro_sale * 0.01)}"
												pattern="#,###" /> 원</span>
									</c:if> <c:if test="${list.pro_sale == 0 }">
										<fmt:formatNumber value="${list.pro_price}" pattern="#,###" /> 원 
								
							</c:if>


								</span>
							</div>


						</div>
					</div>
				</div>
				</c:otherwise>
				</c:choose>
				<c:set var="pro_code" value="${list.pro_code }" />
			</c:forEach>







		</div>







	</div>
	</section>




	<%-- <div class="row isotope-grid">

					<c:forEach items="${pro_list_trench}" var="list">

						<div class="col-sm-6 col-md-4 col-lg-4 p-b-33 isotope-item">

							<div class="block2-pic hov-img0">
								<a
									href="${contextPath}/product/productdetail.do?pro_code=${list.pro_code}">
									<img
									src="${contextPath}/thumbnails.do?pro_code=${list.pro_code}&fileName=${list.pro_imageFileName}">
								</a>
							</div>

							<br> <strong><a
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
				
				<div class="row isotope-grid">

					<c:forEach items="${pro_list_jk}" var="list">

						<div class="col-sm-6 col-md-4 col-lg-4 p-b-33 isotope-item">

							<div class="block2-pic hov-img0">
								<a
									href="${contextPath}/product/productdetail.do?pro_code=${list.pro_code}">
									<img
									src="${contextPath}/thumbnails.do?pro_code=${list.pro_code}&fileName=${list.pro_imageFileName}">
								</a>
							</div>

							<br> <strong><a
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
				</div> --%>
</body>











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



</html>