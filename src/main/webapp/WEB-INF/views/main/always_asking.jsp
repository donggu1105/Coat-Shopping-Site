<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script src="${contextPath}/resources/k/js/jquery/jquery-2.2.4.min.js"></script>
<script src="${contextPath}/resources/k/js/popper.min.js"></script>
<script src="${contextPath}/resources/k/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/k/js/plugins.js"></script>
<script src="${contextPath}/resources/k/js/active.js"></script>

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

<body>
<Br><Br>
	<section class="single_product_details_area section_padding_0_100">
	<div class="container">
		<div class="row">



			<div class="col-12">
				<div class="single_product_desc">


					<div id="accordion" role="tablist">
						<h5 style="color: #ff0081">배송</h5>
						<div class="card">
							<div class="card-header" role="tab" id="a">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#aa"
										aria-expanded="false" aria-controls="aa">배송중인 상품의 위치를 확인하고
										싶어요.</a>
								</h6>
							</div>
							<div id="aa" class="collapse" role="tabpanel" aria-labelledby="a"
								data-parent="#accordion">
								<div class="card-body">
									√ 마이페이지 > 주문배송조회 > 배송조회에서 확인 가능 ( 딜/상품(Beta)/티켓/할인항공권 구분되어
									있습니다. )<br> ㆍ위메프에서는 상품 출고송장 등록 시, 고객님께 출고 안내 SMS/알림톡을
									발송해드리고 있습니다.<br> ㆍ마이페이지 > 주문배송조회 > 배송조회 버튼을 클릭하시면 확인하실 수
									있습니다.<br> ㆍ 운송장 등록 후, 택배사 사정에 따라 실제 송장조회가 반영되는데 까지 영업일기준
									1일 정도 소요될 수 있습니다. 택배사에서 집하된 상품이 배송중 위치추적이 어렵거나, 흐름조회가 어려울 경우 실제
									배송을 담당하고 있는 택배사측으로 문의를 부탁드리겠습니다.<br> (배송조회시 택배기사 연락처가 확인되지
									않는 경우, 택배사 홈페이지를 통해 확인하실 수 있습니다.) ㆍ 우편배송상품의 경우 출고일을 안내드리고 있습니다.
									우편 발송 물량에 따라 영업일 기준 5일에서 최대 14일 정도 소요될 수 있습니다. (우편함 확인 필요)<br>

									ㆍ 가구, 가전 등 대형 화물 배송상품의 경우, 업체 사정에 의해 배송예정일이 변동될 가능성이 있기 때문에,
									정확한 배송일정은 상품페이지 > Q&A로 문의를 부탁드리겠습니다.<br> 1. CJ 대한통운 : 1588
									- 1255<br> 2. 로젠택배 : 1588 - 9988<br> 3. 롯데택배 : 1588 -
									2121<br> 4. 한진택배 : 1588 - 0011<br> 5. 경동택배 : 080 -
									873 - 2178<br> 6. KGB택배 : 1577 - 4577<br> 7. 동부택배 :
									1588 - 8848<br> 8. 합동택배 : 080 - 877 - 8202<br> 9.
									우체국택배 : 1588 - 1300<br> 10. GTX로지스 : 1588 - 1756<br>
									11. 대신택배 : 043-222-4582<br> 12. 일양로지스 : 1588-0002<br>
									13. 천일택배 : 031-462-1001 (서울,경인) / 055-371-2200 (부산,경남) /
									053-353-8911 (대구,경북) 062-361-2340 (호남,제주) / 042-284-1006
									(대전,충청) / 033-743-1007 (강원)<br> 14. 고려택배 : 031-240-2400<br>
									15. 건영택배 : 031-460-2700 (서울,경기) / 051-645-3351 (부산) /
									053-345-3001 (대구)<br>
								</div>
							</div>
						</div>

						<div class="card">
							<div class="card-header" role="tab" id="b">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#bb"
										aria-expanded="false" aria-controls="bb">이미 주문을 했는데, 배송지를
										변경하고 싶어요.</a>
								</h6>
							</div>
							<div id="bb" class="collapse" role="tabpanel" aria-labelledby="b"
								data-parent="#accordion">
								<div class="card-body">
									√ 마이페이지 > 주문배송조회 페이지 에서 변경가능<br> ㆍ배송지 변경은 마이페이지 > 주문배송조회
									페이지에서 구매상세내역 > 배송정보/배송지 변경 버튼을 클릭하여 변경할 수 있습니다.<br> ㆍ배송지
									변경은 상품이 발송되기 전 '입금대기' 및 '배송준비중/신규주문' 단계에서만 변경이 가능합니다.<br>
									ㆍ한 결제번호당 하나의 배송지만 설정하실 수 있습니다.<br> ㆍ'상품출고대기/상품준비중' 단계에서는
									변경이 어려워 취소신청 부탁드립니다. 다만 즉각적인 취소가 어려우며, 상품이 출고되었을 경우에는 취소가 어려울 수
									있습니다.<br> ㆍ상품이 이미 출고되어 배송중인 상태에서는 배송지 변경이 불가능합니다.<br>
								</div>
							</div>
						</div>

						<div class="card">
							<div class="card-header" role="tab" id="c">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#cc"
										aria-expanded="false" aria-controls="cc">상품 구매 후 주소 변경을
										하려면 어떻게 해야 하나요?</a>
								</h6>
							</div>
							<div id="cc" class="collapse" role="tabpanel" aria-labelledby="c"
								data-parent="#accordion">
								<div class="card-body">


									ㆍ상품 결제 후 배송준비 작업 등의 과정으로 배송정보, 선택사항 변경이 어려울 수 있습니다. <br>
									ㆍ주문제작상품 및 해외직배송 이외 상품에 주소 변경을 원하시는 경우 고객센터 1:1문의를 통해 문의 주시면 확인
									후 변경 가능여부에 대해 안내드리겠습니다.<br>
								</div>
							</div>
						</div>

						<div class="card">
							<div class="card-header" role="tab" id="d">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#dd"
										aria-expanded="false" aria-controls="dd">휴일에 상품을 받을 수 있나요?</a>
								</h6>
							</div>
							<div id="dd" class="collapse" role="tabpanel" aria-labelledby="d"
								data-parent="#accordion">
								<div class="card-body">상품 배송은 택배 서비스가 운행되는 평일과 토요일에 진행되고
									있어, 일요일, 공휴일 배송이 불가합니다.</div>
							</div>
						</div>
						<br>
						<br>
						<h5 style="color: #ff0081">교환 / 반품 / 환불</h5>
						<div class="card">
							<div class="card-header" role="tab" id="e">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#ee"
										aria-expanded="false" aria-controls="ee"> 환불을 신청했는데 환불 기간은
										얼마나 소요되나요? </a>
								</h6>
							</div>
							<div id="ee" class="collapse" role="tabpanel" aria-labelledby="e"
								data-parent="#accordion">
								<div class="card-body">
									√ 결제수단별 환불 기간 상이 환불 접수 완료 후, 결제 수단별 환불 시점은 아래와 같이 소요됩니다. (반품환불은
									상품 회수>업체 입고>환불승인단계를 거쳐 진행되오니 참고 부탁드립니다.)<br> - 신용카드 : 2
									영업일 이내, 카드사 승인 취소(페이코,케이페이,페이나우 등 간편결제 동일)<br> - 체크카드 : 2
									영업일 이내, 카드사 승인 취소 후 해당 카드에 연계된 계좌로 입금<br> - 실시간 계좌이체 : 2
									영업일 이내, 승인 취소 후 결제 계좌로 입금<br> - 휴대폰 결제 : 휴대폰 결제 전체 취소 시,
									즉시 취소 반영 (휴대폰 전월 결제 주문 및 부분 취소 계좌 환불인 경우에는 아래 무통장입금 환불과 동일하게
									진행됩니다.)<br> - 무통장입금 : 2 영업일 이내 환불신청 계좌로 입금 (Ex. 7월 6일(금)
									즉시취소/취소/환불 승인 > 7월 10일(화) 이내 결제사 취소 반영)<br> - 위메프 포인트 : 즉시
									적립 (단, 무통장입금+포인트 복합 결제시 무통장입금건 환불처리 이후 포인트 적립됩니다.)


								</div>
							</div>
						</div>

						<div class="card">
							<div class="card-header" role="tab" id="f">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#ff"
										aria-expanded="false" aria-controls="cc"> 구매한 상품을
										취소/교환/반품하려면 어떻게 해야 하나요? </a>
								</h6>
							</div>
							
							<div id="ff" class="collapse" role="tabpanel" aria-labelledby="f"
								data-parent="#accordion">
								<div class="card-body">
									√ 마이페이지 > 주문배송조회 페이지에서 신청 가능 ( 딜/상품(Beta)/티켓/할인항공권 구분되어 있습니다. )<br>


									■ 취소 / 교환 / 반품 신청 방법 1. 배송상품 ㆍ 배송상품은 물품 수령일 다음 날로 부터 7일 이내,
									마이페이지 > 주문배송조회 페이지 내 취소/반품 신청을 통해 원하시는 옵션, 회수 주소지 등을 선택하시면 빠르고
									정확한 신청이 가능합니다.<br> ㆍ 배송중 상태에서는 교환/반품 신청이 불가하며, 배송 완료 이후
									[마이페이지>주문배송조회]으로 접속하여 교환/반품 신청이 가능합니다. 배송 상태가 배송중일 경우 수취확인 후 신청
									부탁드립니다.<br> ㆍ 운송장 상 배송완료 상태로 보이지만, 실제 상품을 수령하지 못한 상품의 경우는
									해당 운송장정보에 기재된 택배대리점 또는 택배기사님을 통해 배송상품 위치 확인 및 반품의사를 전달하신 이후,
									마이페이지에서 직접 반품 신청해주시면 취소신청이 가능합니다.<br> ㆍ 배송상품의 경우, 교환/반품 신청
									완료시, 택배기사님이 방문 수거할 수 있도록 위메프에서 직접 회수접수를 해드립니다. (신청 완료 이후 택배 기사님
									방문까지 평균 영업일 기준 2~3일 정도 소요되며, 택배사 사정에 따라 지연이 발생할 수 있습니다.)<br>
									ㆍ 회수 완료 후 영업일기준 1~2일이내 마이페이지>취소/교환/반품 조회 > 배송현황 클릭을 통해 진행상태 확인이
									가능합니다. (다만, 고객님께서 직접 반송을 해주신 경우, 반송장번호를 직접 등록해주셔야 진행상태 확인이
									가능합니다.)<br> ㆍ 교환/반품과 관련된 자세한 내용은 '교환/반품 안내' 페이지에서 확인이
									가능합니다. <br> ㆍ1개의 결제건에서 동시에 취소/교환/반품 신청이 불가할 수 있으므로, 신청이
									불가한 경우 1:1문의를 이용 부탁드립니다.<br> ㆍ결제수단이 무통장입금 또는 휴대폰 전월결제 주문 및
									부분취소로 계좌 환불이 필요하나 계좌번호 확인이 어려운 경우<br> 위메프 유료포인트로 우선 환급 될 수
									있으며, 포인트 사용을 원치 않을 경우 1:1문의를 접수해주시면 지급된 포인트 회수 후 전액 계좌 환급이
									가능합니다.<br> 2. 티켓상품(여행/숙박/지역서비스/온라인상품)<br> 티켓상품의 판매,
									사용처리 방법에 따라 취소신청 방법이 상이합니다. <br> 마이페이지>주문배송조회 페이지에서 취소신청
									버튼이 보이지 않는 경우, 고객센터로 문의 부탁드립니다. (딜페이지 내 환불규정 참고)<br> ■
									교환/반품 가능 기간<br> - 구매자 단순변심 : 물품 수령일 다음 날로부터 7일 이내<br>
									- 표시, 광고 상이, 물품 하자 (초기 불량) : 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내 <br>

									■ 취소/교환/반품 신청가능 기간 예시 <br> 1. 배송 상품 <br> - 구매일 : 1/1
									<br> - 물품 수령일 : 1/3<br> - 취소/교환/반품 가능일 : 1/3~1/10 (물품
									수령일 다음 날로 부터 +7일까지)<br> 2. 서비스 상품<br> - 구매일 : 1/1 <br>
									- 티켓 수령일 : 1/1<br> - 취소/교환/반품 가능일 : 1/1~1/8 (구매일 다음 날로 부터
									+7일까지)<br> * 단 일부 서비스상품은 유효기간에 따라 취소 가능 일이 제한 될 수 있습니다.<br>

									■ 교환/반품 배송비 관련<br> ㆍ 초기 불량 상품일 경우, 판매업체에서 왕복배송비를 부담하오며 반품
									및 입고 확인 후 환불됩니다.<br> ㆍ 변심에 의한 교환/반품시 발생되는 배송비는 고객 부담으로 상품에
									따라 반품 상자에 동봉하여 보내주시거나 판매업체 계좌로 입금 부탁드립니다.<br> (무료배송, 배송료
									선불과는 무관함. 환불시, 선불 배송료는 상품대금과 함께 전체 환불되며, 환불고객에게는 무료배송을 제공하지 않음)
									ㆍ 상품에 따라 왕복배송비가 상이하므로, 상품페이지 > 안내사항 또는 교환 및 반품신청 페이지에서
									확인부탁드립니다.<br> ■ 교환 / 반품 처리기간<br> ㆍ 회수된 상품이 판매업체에 입고 후
									검수를 거쳐, 교환/반품이 진행됩니다. <br> ㆍ 통상적으로 반품은 입고일로부터 1~2이내
									환불처리되며, 교환은 입고일로부터 2~3일이내 교환 출고됩니다. (단, 상품 검수과정 중 특이사항 발생 시 다소
									지연이 될 수 있습니다.)<br> ■ 교환 및 반품이 불가한 경우<br> ㆍ 소비자의 책임 있는
									사유로 상품 등이 멸실/훼손된 경우<br> ㆍ 소비자의 사용/소비에 의해 상품 등의 가치가 현저히 감소한
									경우<br> ㆍ 시간의 경과에 의해 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우<br>
									ㆍ 복제가 가능한 상품 등의 포장을 훼손한 경우<br> ㆍ 판매/생산방식의 특성상, 교환/반품 시 판매자
									에게 회복할 수 없는 손해가 발생하는 경우 (주문 접수 후 개별생산, 맞춤 제작 등)<br> ■
									교환/반품 철회 및 수정 관련<br> 반품 또는 교환 접수이후에는 마이페이지를 통한 반품,교환 취소 및
									수정이 어려울 수 있어, 1:1문의를 이용 부탁드리립니다.


								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" role="tab" id="g">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#gg"
										aria-expanded="false" aria-controls="gg"> 배송상품 중 단순 변심으로
										환불이 불가한 상품도 있나요? </a>
								</h6>
							</div>
							
							<div id="gg" class="collapse" role="tabpanel" aria-labelledby="g"
								data-parent="#accordion">
								<div class="card-body">
									ㆍ식품(냉장/냉동)상품 중 일부는 상품 특성상 환불이 불가한 경우가 있습니다.<br> ㆍ식품이 아니더라도
									상품 특성상 환불이 불가한 상품도 있으니 상품 상세페이지의 구매정보와 안내사항을 필독해 주시기 바랍니다.<br>


								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" role="tab" id="h">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#hh"
										aria-expanded="false" aria-controls="cc"> 배송상품을 즉시 취소하려는데,
										온라인으로 반품 접수가 불가능하다고 합니다. </a>
								</h6>
							</div>
							
							<div id="hh" class="collapse" role="tabpanel" aria-labelledby="h"
								data-parent="#accordion">
								<div class="card-body">√ 고객센터 1:1문의로 접수 ㆍ조건부 무료배송 상품을
									구매하시고 상품준비중 단계에서 부분 취소 신청 시 남은 상품금액이 무료배송 조건 금액보다 작은 경우 배송비가
									발생됩니다. ㆍ 취소상품 금액이 배송비보다 큰 경우에는 상품가에서 배송비가 차감 후 환불되며, 취소상품 금액이
									배송비보다 작은 경우에는 취소 신청이 불가합니다. ㆍ 배송비보다 작은 금액의 상품을 취소하시고자 하시는 경우,
									고객센터 1:1문의로 접수 부탁드립니다. 예시) ① 5 만원 이상 구매시, 무료배송 상품 (배송비 2,500원인
									경우)을 구매 : A 옵션 4 만원 + B 옵션 2만원 = 총 6 만원 취소 : B 옵션 2만원 부분취소 취소 후
									남은 상품금액 A 옵션 4 만원이 무료배송 조건인 5 만원을 충족하지 않기 때문에 취소상품인 B옵션에서 배송비가
									차감 후, 환불됩니다. ② 1만원 이상 구매시, 무료배송 상품 (배송비 2,500원인 경우)을 구매 : A 옵션
									2천원 * 5개 = 총 1만원 취소 : A 옵션 1개 2천원 부분 취소 취소 후 남은 상품금액이 A옵션 2천원
									*4=8천원으로 무료배송 조건인 1만원을 충족하지 않기 때문에 배송비가 발생하지만, 취소상품 금액이 배송비보다
									작기 때문에 온라인으로는 취소신청이 접수되지 않습니다.</div>
							</div>
						</div>
						<br>
						<br>
						<h5 style="color: #ff0081">구매(결제)</h5>
						<div class="card">
							<div class="card-header" role="tab" id="i">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#ii"
										aria-expanded="false" aria-controls="ii"> 고객센터에서 전화상으로 본인
										확인 후 대리 결제가 가능한가요? </a>
								</h6>
							</div>
							
							<div id="ii" class="collapse" role="tabpanel" aria-labelledby="i"
								data-parent="#accordion">
								<div class="card-body">√ 텔레마트 고객센터를 통해 구매(결제) 대행 가능 ㆍ전화주문
									이용 서비스 약관 및 개인정보수집 동의한 고객님께서는 위메프 내 전 상품 서비스 이용 가능합니다. (단,
									컬처/여행, 롯데백화점 등 무통장입금 제외딜은 불가) ㆍ무통장 입금 결제수단만 가능합니다. ㆍ텔레마트 고객센터 :
									1644-4555 | 평일 09시~18시 (점심시간 13시~14시)</div>
							</div>
						</div>

						<div class="card">
							<div class="card-header" role="tab" id="j">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#jj"
										aria-expanded="false" aria-controls="jj"> 무통장입금 주문 후,
										입금하였는데 취소 문자를 받았습니다. </a>
								</h6>
							</div>
							
							<div id="jj" class="collapse" role="tabpanel" aria-labelledby="j"
								data-parent="#accordion">
								<div class="card-body">√ 환불계좌 확인 후 고객센터 1:1문의 접수 필요



									ㆍ무통장입금으로 주문하여 결제대금을 입금완료한 시점에 주문상품의 재고가 매진되었거나, 판매종료 되었을 경우, 전체
									주문 취소가 될 수 있습니다. (주문접수 취소시 마이페이지 내 주문배송조회 페이지에서는 확인되지 않습니다.)

									ㆍ고객님께서 입금 시 이용하였던 계좌번호는 개인정보 해당하기 때문에 당사에서 수집 및 활용하지 않아, 별도의
									환불조치가 필요합니다. ㆍ번거로우시겠지만 입금금액에 대해 환불처리를 위해, 회원 본인명의 환불계좌를 기재하시어
									1:1문의로 접수해주시면 결제대금 환불로 도움드리겠습니다. ㆍ계좌번호 확인이 어려운 경우 위메프 유료포인트로 우선
									환급 될 수 있으며, 포인트 사용을 원치 않을 경우 1:1문의를 접수해주시면 지급된 포인트 회수 후 전액 계좌
									환급이 가능합니다. ㆍ고객센터를 통해 환불 접수완료 후 영업일기준 2일 이내 요청하신 환불계좌로 입금됩니다.</div>
							</div>
						</div>

						<div class="card">
							<div class="card-header" role="tab" id="k">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#kk"
										aria-expanded="false" aria-controls="cc"> 실시간 계좌이체 이용 가능
										시간은 어떻게 되나요? </a>
								</h6>
							</div>
							
							<div id="kk" class="collapse" role="tabpanel" aria-labelledby="k"
								data-parent="#accordion">
								<div class="card-body">상품 배송은 택배 서비스가 운행되는 평일과 토요일에 진행되고
									있어, 일요일, 공휴일 배송이 불가합니다.실시간 계좌이체 은행별 이용 가능 시간은 아래와 같습니다. - 국민은행
									: 00:00 ~ 24:00 - 농협은행 : 00:30 ~ 24:00 - 우리은행 : 00:00 ~ 24:00 -
									SC은행 : 00:00 ~ 24:00 - 기업은행 : 00:00 ~ 24:00 - 외환은행 : 00:10 ~
									23:50 - 수협중앙회 : 00:10 ~ 23:55 - 신한은행 : 00:05 ~ 23:55 - 한국씨티 :
									00:00 ~ 24:00 - 대구은행 : 00:00 ~ 24:00 - 부산은행 : 00:05 ~ 24:00 -
									한국산업은행 : 00:30 ~ 24:00 - 광주은행 : 00:10 ~ 23:55 - 제주은행 : 00:20 ~
									23:55 - 전북은행 : 00:10 ~ 24:00 - 경남은행 : 00:00 ~ 24:00 - 하나은행 :
									00:15 ~ 23:50 - 우체국 : 00:10 ~ 24:00 - 새마을금고 : 00:30 ~ 23:30 -
									신협은행 : 00:10 ~ 23:50 - 산림조합 : 00:30 ~ 23:30</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header" role="tab" id="l">
								<h6 class="mb-0">
									<a class="collapsed" data-toggle="collapse" href="#ll"
										aria-expanded="false" aria-controls="cc"> 실시간 계좌이체 한도는
										얼마인가요? 법인계좌로 가능한가요? </a>
								</h6>
							</div>
							
							<div id="ll" class="collapse" role="tabpanel" aria-labelledby="l"
								data-parent="#accordion">
								<div class="card-body">ㆍ은행에 따라 이용가능 금액에 차이가 있으나, 최소
									160원/1일 최대 300만원까지 적용이 가능합니다. ㆍ고객님께서 인터넷 뱅킹 신청 시, 고객님이 설정한 1일
									최대 이체금액 한도금액이 300만원보다 적을 경우 이체한도는 고객님의 이체 최대한도 금액을 우선시 합니다.

									[법인계좌 실시간 계좌이체] 법인계좌도 실시간 계좌이체가 가능합니다.</div>
							</div>
						</div>






					</div>

				</div>
				
			</div>
		</div>
	</div>
	
	
	</section>
	<center>
	<button onclick="history.back();" class="bubbly-buttons">뒤로가기</button>
<%-- 						<center>
<button type="submit" name="addtocart" style="background-color: #111;" value="5" class="btn cart-submit d-block">Add to cart</button>
				</center> --%>
				</center>
</body>

<!--===============================================================================================-->


<script>
	var animateButton = function(e) {

		e.preventDefault;
		//reset animation
		e.target.classList.remove('animate');

		e.target.classList.add('animate');
		setTimeout(function() {
			e.target.classList.remove('animate');
		}, 700);
	};

	var bubblyButtons = document.getElementsByClassName("bubbly-buttons");

	for (var i = 0; i < bubblyButtons.length; i++) {
		bubblyButtons[i].addEventListener('click', animateButton, false);
	}
</script>

</html>