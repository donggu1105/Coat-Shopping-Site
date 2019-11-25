<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="orderList" value="${orderViewMap.orderList }" />
<c:set var="total_coupons" value="${orderViewMap.total_coupons }" />
<c:set var="memberDetail" value="${orderViewMap.memberDetail }" />



<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>주문 메인 페이지</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${contextPath}/resources/c/js/main.js"></script>
<script src="${contextPath}/resources/s/js/jquery-ui.js"></script>
<script src="${contextPath}/resources/s/js/popper.min.js"></script>
<script src="${contextPath}/resources/s/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/s/js/owl.carousel.min.js"></script>
<script src="${contextPath}/resources/s/js/jquery.magnific-popup.min.js"></script>
<script src="${contextPath}/resources/s/js/aos.js"></script>

<script src="${contextPath}/resources/s/js/main.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${contextPath}/resources/s/js/jquery-ui.js"></script>
<script src="${contextPath}/resources/s/js/popper.min.js"></script>
<script src="${contextPath}/resources/s/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/s/js/owl.carousel.min.js"></script>
<script src="${contextPath}/resources/s/js/jquery.magnific-popup.min.js"></script>
<script src="${contextPath}/resources/s/js/aos.js"></script>

<script src="${contextPath}/resources/s/js/main.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<script src="${contextPath}/resources/k/js/jquery/jquery-2.2.4.min.js"></script>
<script src="${contextPath}/resources/k/js/popper.min.js"></script>
<script src="${contextPath}/resources/k/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/k/js/plugins.js"></script>
<script src="${contextPath}/resources/k/js/active.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
   src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function find_addr() {
   new daum.Postcode({
      oncomplete : function(data) {
         // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

         // 각 주소의 노출 규칙에 따라 주소를 조합한다.
         // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
         var addr = ''; // 주소 변수
         var extraAddr = ''; // 참고항목 변수

         //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
         if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            addr = data.roadAddress;
         } else { // 사용자가 지번 주소를 선택했을 경우(J)
            addr = data.jibunAddress;
         }

         // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
         if (data.userSelectedType === 'R') {
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
               extraAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if (data.buildingName !== '' && data.apartment === 'Y') {
               extraAddr += (extraAddr !== '' ? ', '
                     + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if (extraAddr !== '') {
               extraAddr = ' (' + extraAddr + ')';
            }
            // 조합된 참고항목을 해당 필드에 넣는다.
            document.getElementById("jiaddr").value = extraAddr;

         } else {
            document.getElementById("jiaddr").value = '';
         }

         // 우편번호와 주소 정보를 해당 필드에 넣는다.
         document.getElementById('postaddr').value = data.zonecode;
         document.getElementById("loadaddr").value = addr;
         // 커서를 상세주소 필드로 이동한다.
         document.getElementById("detailaddr").focus();
      }
   }).open();
   
}

function find_addr2() {
   new daum.Postcode({
      oncomplete : function(data) {
         // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

         // 각 주소의 노출 규칙에 따라 주소를 조합한다.
         // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
         var addr = ''; // 주소 변수
         var extraAddr = ''; // 참고항목 변수

         //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
         if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            addr = data.roadAddress;
         } else { // 사용자가 지번 주소를 선택했을 경우(J)
            addr = data.jibunAddress;
         }

         // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
         if (data.userSelectedType === 'R') {
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
               extraAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if (data.buildingName !== '' && data.apartment === 'Y') {
               extraAddr += (extraAddr !== '' ? ', '
                     + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if (extraAddr !== '') {
               extraAddr = ' (' + extraAddr + ')';
            }
            // 조합된 참고항목을 해당 필드에 넣는다.
            document.getElementById("jiaddr2").value = extraAddr;

         } else {
            document.getElementById("jiaddr2").value = '';
         }

         // 우편번호와 주소 정보를 해당 필드에 넣는다.
         document.getElementById('postaddr2').value = data.zonecode;
         document.getElementById("loadaddr2").value = addr;
         // 커서를 상세주소 필드로 이동한다.
         document.getElementById("detailaddr2").focus();
      }
   }).open();
}

   $(document).ready(function(){
      
      $('#div_how_pay1').show();
      $('#div_how_pay2').hide();
      
      $('#how_pay1').click(function(){
            $('#div_how_pay1').show();
            $('#div_how_pay2').hide();
      });
      
      $('#how_pay2').click(function(){
         $('#div_how_pay2').show();
         $('#div_how_pay1').hide();
   });
      
      
      $('#email_direct').hide();
      
      $('#email2').change(function(){
      var email = $('#email2').val();
      if(email == 'direct'){
         $('#email_direct').show();
         $('#email2').hide();
      }else{
         $('#email_direct').hide();
         $('#email2').show();
      }
      });
      
      $('#delivery_choice').click(function(){
            
            var member_name =$('#member_name').val();
            var postaddr=$('#postaddr').val();
            var loadaddr=$('#loadaddr').val();
            var jiaddr=$('#jiaddr').val();
            var detailaddr=$('#detailaddr').val();
            var member_cp1=$('#member_cp1').val();
            var member_cp2=$('#member_cp2').val();
            var member_cp3=$('#member_cp3').val();
            
         if($(this).val()=='same'){
            
            $('#receiver').val(member_name);
            $('#postaddr2').val(postaddr);
            $('#loadaddr2').val(loadaddr);
            $('#jiaddr2').val(jiaddr);
            $('#detailaddr2').val(detailaddr);
            $('#receiver_hp1').val(member_cp1);
            $('#receiver_hp2').val(member_cp2);
            $('#receiver_hp3').val(member_cp3);
            
         }
      });
      
      $('#delivery_choice2').click(function(){
         
         $('#receiver').val('');
         $('#postaddr2').val('');
         $('#loadaddr2').val('');
         $('#jiaddr2').val('');
         $('#detailaddr2').val('');
         $('#receiver_hp1').val('');
         $('#receiver_hp2').val('');
         $('#receiver_hp3').val('');
      });
      
      $('#request_to_delivery').change(function(){
         
         if($(this).val()=='직접 작성'){
            $('#request_to_delivery_text').val('택배기사님들이 보시는 내용 입니다.');
            $('#request_to_delivery_text').prop('disabled',false);
         }
         else{
         var request_to_delivery=$(this).val();
         $('#request_to_delivery_text').val(request_to_delivery);
         $('#request_to_delivery_text').prop('disabled',true);
         $('#duplicate_textarea').val(request_to_delivery);
            
         }
         
      });
      
      var total_discount=0;
      var member_saving=${memberInfo.member_saving};
      var member_point=${memberInfo.member_point};
      var apply_point=0;
      var apply_saving=0;
      
      $('#member_saving').change(function(){
         //초기화
      var _member_saving=$(this).val();
         apply_saving=parseInt(_member_saving);
         
         if(apply_saving <= member_saving){
            total_discount=apply_saving+apply_point;
         }else{
            alert("적립금 한도를 초과하였습니다. 다시 입력해주세요");
            $(this).val('');
            
         }
         
         $('#total_discount').text(total_discount); 
         $('#order_discount').val(total_discount);
         $('#discount_point').val(apply_point);
         $('#discount_saving').val(apply_saving);
         
      }); 
   
      $('#member_point').change(function(){
         //초기화
         
         var _member_point=$(this).val();
         apply_point=parseInt(_member_point);
         
         if(apply_point <= member_point){
            total_discount=apply_saving+apply_point;
         }else{
            alert("포인트 한도를 초과하였습니다. 다시 입력해주세요");   
            $(this).val('');
         }
         
         $('#total_discount').text(total_discount);
         $('#order_discount').val(total_discount);
         $('#discount_point').val(apply_point);
         $('#discount_saving').val(apply_saving);
      }); 
      
   });
   
   function order(obj){
      
      if($("input:checkbox[name='agree_to_pay']").is(":checked")==false){
         alert('결제정보 확인 및 구매진행에 동의하셔야 주문이 가능합니다.');
      }else{
         if(confirm('정말로 결제하시겠습니까?')){
            
             obj.submit();      
         }
      }
      
   }
   
   function apply_discount(){
       var _total_discount=$('#total_discount').text();
       var total_discount=parseInt(_total_discount);
       
       
       var _final_total_order_price=$('#final_total_order_price').text();
       var final_total_order_price=parseInt(_final_total_order_price);
      
       if(final_total_order_price-total_discount>0){
       var final_total_pay_price=final_total_order_price-total_discount;
       }
       
       $('#final_total_pay_price').text(final_total_pay_price);
       $('#final_total_pay_price2').text(final_total_pay_price);
       $('#order_price').val(final_total_pay_price);
   }
   
   function text(){

      var text1=('#request_to_delivery_text').text();
      alert(text1);
      $('#duplicate_textarea').val(text);
   }

</script>

<style>
 table {
   border-spacing: 30px;
}

input {
   border: 1px;
   border-color: black;
   display: inline;
}

radio {
   display: inline;
} 
</style>
<style>
 .orderinfo {
   width: 100%;
      border-top : 3px solid darkgray;
    border-left : none;
    border-right : none;
    line-height: 4;
}
.orderinfo th , .orderinfo td{
   border-right: none;
   border-left: none;
    border-bottom : 1px solid darkgray;
   text-align: center;
} 

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

</head>
<body>

   <form method="post" action="${contextPath }/order/order.do"
      name="frm_order">

      <div class="site-section">
         <div class="container">



<%--             <div class="row mb-5">
               <div class="col-md-12">
                  <div class="border p-4 rounded" role="alert">
                     <strong>${memberInfo.member_name }</strong>님은 <strong>${memberInfo.member_rank }</strong>회원
                     이십니다.<br> 가용적립금 :<strong><fmt:formatNumber
                           value="${memberInfo.member_saving }" type="number"
                           var="member_saving" />${member_saving}</strong>원 <br> 포인트 :<strong><fmt:formatNumber
                           value="${memberInfo.member_point }" type="number"
                           var="member_point" />${member_point}</strong>P<br> 쿠폰 :
                     ${total_coupons}개
                  </div>
               </div>
            </div> --%>
            
            
            
            
<!--             <div class="row mb-5"> -->
<!--                   <div class="col-md-12"> -->
<!--                      <div class=" p-4 rounded" role="alert"> -->
                        
<%--                         <strong id="s">${memberInfo.member_name }</strong>님은 <strong id="s">${memberInfo.member_rank }</strong>회원 이십니다.<br> --%>
<%--                         가용적립금 : <strong id="s"><fmt:formatNumber value="${memberInfo.member_saving }" type="number" var="member_saving"/>${member_saving}</strong>원  <br>   --%>
<%--                         포인트 : <strong id="s"><fmt:formatNumber value="${memberInfo.member_point }" type="number" var="member_point"/>${member_point}P</strong><Br>  --%>
<%--                         쿠폰 : <strong id="s">${total_coupons}</strong>개 --%>
                        
                        
<!--                      </div> -->
<!--                   </div> -->
<!--                </div> -->
               
            <table style="margin-bottom: 50px !important; width: 100%; border: 1px solid darkgray;" >
               <tr>
                  <th rowspan="4" style="border-right: 1px solid darkgray; text-align : center; width: 100px;">회원 혜택</th>                     
               </tr>
               <tr style="border-bottom: 1px solid darkgray; border-top : 1px solid darkgray;">
                  <th>&nbsp;&nbsp;&nbsp;<strong id="s">${memberInfo.member_name }</strong>님은 <strong id="s">${memberInfo.member_rank }</strong>회원 이십니다.<br>
                  &nbsp;&nbsp;&nbsp;가용적립금 : <strong id="s"><fmt:formatNumber value="${memberInfo.member_saving }" type="number" var="member_saving"/>${member_saving}</strong>원 </th>  
                  </tr>
                  <tr style="border-bottom : 1px solid darkgray;">
                  <th>&nbsp;&nbsp;&nbsp;포인트 : <strong id="s"><fmt:formatNumber value="${memberInfo.member_point }" type="number" var="member_point"/>${member_point}P</strong><br>
                  &nbsp;&nbsp;&nbsp;쿠폰 : <strong id="s">${total_coupons}</strong>개</th>
               </tr>
                  
            </table>
            
         







         <table border="1" class="orderinfo">
         <thead>
            <tr style="text-align: center;">
               <th width="150px;">이미지</th>
               <th width="180px;">상품명 </th>
               <th width="100px">상품정보</th>
               <th width="100px;">판매가</th>
               <th width="60px;">수량</th>
               <th width="100px;">적립포인트</th>
               <th width="100px;">배송구분</th>
               <th width="50px;">배송비</th>
               <th width="100px;">합계</th>
            </tr>
         </thead>
         <tbody>
         
         <c:choose>
            <c:when test="${orderList ==null }">
               <h1><strong>주문할 상품이 없습니다.</strong></h1>
            </c:when>
            <c:when test="${orderList !=null }">
         <c:forEach items="${orderList }" var="cart">
         <c:set var="pro_saving" value="${cart.cart_pro_price * cart.cart_pro_quantity * 0.01 }"  />
         <fmt:formatNumber value="${pro_saving}" type="number" var="pro_saving2"/>
         <fmt:formatNumber value="${cart.cart_pro_price}" type="number" var="pro_price"/>
            <tr>
               <th><a href="${contextPath}/product/productdetail.do?pro_code=${cart.cart_pro_code}">
               <img width="70px" height="105px" src="${contextPath}/thumbnails.do?pro_code=${cart.cart_pro_code}&fileName=${cart.pro_imagefilename}"></a></th>
               <td><a href="${contextPath}/product/productdetail.do?pro_code=${cart.cart_pro_code}">${cart.pro_name}</a></td>
               <td><strong>${cart.cart_pro_size }<br>${cart.cart_pro_color}</strong></td>
               <td>${pro_price}원</td>
               <td>${cart.cart_pro_quantity}개</td>
               <td>${pro_saving2}P</td>
               <td>[기본 배송]</td>
               <td>무료</td>
               <td><strong><fmt:formatNumber value="${cart.cart_pro_price * cart.cart_pro_quantity  }" pattern="#,###" />원</strong></th> 
            </tr>
            <c:set var="final_total_order_price" value="${final_total_order_price+cart.cart_pro_price* cart.cart_pro_quantity }" />
            <c:set var="final_total_order_quantity" value="${final_total_order_quantity+cart.cart_pro_quantity }" />
             <c:set var="final_total_pro_saving" value="${final_total_pro_saving + pro_saving }"/> 
             
             <input type="hidden" name="${cart.cart_pro_detail_code}" value="${cart.cart_pro_detail_code} " />
             <input type="hidden" name="${cart.cart_pro_detail_code}size" value="${cart.cart_pro_size}" />
             <input type="hidden" name="${cart.cart_pro_detail_code}color"  value="${cart.cart_pro_color}"/>
              <input type="hidden" name="${cart.cart_pro_detail_code}price" value="${cart.cart_pro_price}" /> 
             <input type="hidden" name="${cart.cart_pro_detail_code}quantity" value="${cart.cart_pro_quantity}" />
             <input type="hidden" name="${cart.cart_pro_detail_code}saving" value="${pro_saving}" />
             <input type="hidden" name="${cart.cart_pro_detail_code}total" value="${cart.cart_pro_price *cart.cart_pro_quantity}" /> 
         </c:forEach>
         </c:when>
         </c:choose>
         </tbody>
      </table>
      
      <input type="hidden" name="delivery_how" value="일반배송" />
      <input type="hidden" name="delivery_status" value="배송중" />
      <input type="hidden" name="order_pro_quantity" value="${final_total_order_quantity }" />
      <input type="hidden" name="order_saving" value="${final_total_pro_saving }" />

            <div class="row">

               <!--11111111111111111111111111-->

               <div class="col-md-12 mb-5 mb-md-0">
               <Br><br>
                  <h2 class="h3 mb-3 text-black">주문자</h2>
                  <div style="border: 1px solid darkgray;" class="p-3 p-lg-5">



                     <!--이름-->
                     <div class="form-group row">
                        <div class="col-md-12">
                           <label for="c_companyname" class="text-black">주문하시는분 
                           <span style="color: red;">*</span></label> 
                           <input type="text" class="form-control" value="${memberInfo.member_name }" id="member_name" />
                        </div>
                     </div>

                     <!--주소-->
                     <div class="form-group row">
                        <div class="col-md-8">
                           <label for="c_address" class="text-black">주소 <span
                              class="text-danger">*</span></label> <input type="text"
                              class="form-control" id="postaddr" placeholder="우편번호"
                              value="${memberInfo.member_addr1 }">
                        </div>

                        <div class="col-md-4">
                           <label for="c_address" class="text-black"><br></label> <input
                              type="button" class="form-control" id="c_address"
                              name="c_address" onclick="find_addr()" value="주소찾기">
                        </div>
                     </div>

                     <div class="form-group">
                        <input type="text" class="form-control" id="loadaddr"
                           placeholder="주소" value="${memberInfo.member_addr2 }">
                     </div>
                     <div class="form-group">
                        <input type="text" class="form-control" id="jiaddr"
                           placeholder="동" value="${memberInfo.member_addr3 }">
                     </div>
                     <div class="form-group">
                        <input type="text" class="form-control" id="detailaddr"
                           placeholder="나머지주소" value="${memberInfo.member_addr4 }">
                     </div>


                     <!--전화번호-->
                     <div class="form-group row">
                        <div class="col-md-4">
                           <label for="c_state_country" class="text-black">휴대전화 <span
                              class="text-danger">*</span></label> <input type="text"
                              class="form-control" id="member_cp1" name="c_state_country"
                              value="${memberInfo.member_cp1 }">
                        </div>
                        <div class="col-md-4">
                           <label for="c_postal_zip" class="text-black"><br></label>
                           <input type="text" class="form-control" maxlength="4"
                              id="member_cp2" value="${memberInfo.member_cp2 }"
                              onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;"
                              style='IME-MODE: disabled;'>
                        </div>
                        <div class="col-md-4">
                           <label for="c_postal_zip" class="text-black"><br></label>
                           <input type="text" class="form-control" maxlength="4"
                              id="member_cp3" value="${memberInfo.member_cp3 }"
                              onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;"
                              style='IME-MODE: disabled;'>
                        </div>
                     </div>

                  </div>
               </div>

               <Br><Br><Br>

               <!--22222222222222222222222222222-->

               <div class="col-md-12 mb-5 mb-md-0">
                  <Br><Br><Br><Br><Br>
                  <h2 class="h3 mb-3 text-black">배송지</h2>
                  <div style="border: 1px solid darkgray;" class="p-3 p-lg-5 ">


                     <input type="radio" value="same" id="delivery_choice"
                        name="delivery_choice" chekced />주문자 정보와 동일 <input type="radio"
                        value="different" id="delivery_choice2" name="delivery_choice" />새로운
                     배송지
                     <!--이름-->
                     <div class="form-group row">
                        <div class="col-md-12">
                           <label for="c_companyname" class="text-black">받으시는분 </label> <input
                              type="text" class="form-control" name="receiver" id="receiver">
                        </div>
                     </div>


                     <!--주소-->

                     <div class="form-group row">
                        <div class="col-md-8">
                           <label for="c_address" class="text-black">주소 <span
                              class="text-danger">*</span></label> <input type="text"
                              class="form-control" name="delivery_addr1" id="postaddr2"
                              placeholder="우편번호">
                        </div>

                        <div class="col-md-4">
                           <label for="c_address" class="text-black"><br></label> <input
                              type="button" class="form-control" name="c_address"
                              onclick="find_addr2()" value="주소찾기">
                        </div>
                     </div>

                     <div class="form-group">
                        <input type="text" class="form-control" name="delivery_addr2"
                           id="loadaddr2" placeholder="주소">
                     </div>
                     <div class="form-group">
                        <input type="text" class="form-control" name="delivery_addr3"
                           id="jiaddr2" placeholder="동">
                     </div>
                     <div class="form-group">
                        <input type="text" class="form-control" name="delivery_addr4"
                           id="detailaddr2" placeholder="나머지주소">
                     </div>

                     <!--전화번호-->
                     <div class="form-group row">
                        <div class="col-md-4">
                           <label for="c_state_country" class="text-black">전화번호 </label> <input type="text"
                              class="form-control" id="c_state_country" name="receiver_tel1">
                        </div>
                        <div class="col-md-4">
                           <label for="c_postal_zip" class="text-black"><br></label>
                           <input type="text" class="form-control" id="c_postal_zip"
                              name="receiver_tel2" size="4" maxlength="4"
                              onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;"
                              style='IME-MODE: disabled;'>
                        </div>
                        <div class="col-md-4">
                           <label for="c_postal_zip" class="text-black"><br></label>
                           <input type="text" class="form-control" id="c_postal_zip"
                              name="receiver_tel3" size="4" maxlength="4"
                              onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;"
                              style='IME-MODE: disabled;'>
                        </div>
                     </div>

                     <!--휴대번호-->
                     <div class="form-group row">
                        <div class="col-md-4">
                           <label for="c_state_country" class="text-black">휴대전화 <span
                              class="text-danger">*</span></label> <input type="text"
                              class="form-control" name="receiver_hp1" id="receiver_hp1">
                        </div>
                        <div class="col-md-4">
                           <label for="c_postal_zip" class="text-black"><br></label>
                           <input type="text" class="form-control" name="receiver_hp2"
                              size="4" maxlength="4" id="receiver_hp2"
                              onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;"
                              style='IME-MODE: disabled;'>
                        </div>
                        <div class="col-md-4">
                           <label for="c_postal_zip" class="text-black"><br></label>
                           <input type="text" class="form-control" name="receiver_hp3"
                              size="4" maxlength="4" id="receiver_hp3"
                              onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;"
                              style='IME-MODE: disabled;'>
                        </div>
                     </div>




                     <div class="form-group">
                        <label for="c_diff_country" class="text-black">배송메시지 <span
                           class="text-danger">*</span></label> <select id="request_to_delivery"
                           class="form-control">
                           <option value="직접 작성">직접 작성</option>
                           <option value="부재시 문앞에 놔주세요" selected>부재시 문앞에 놔주세요</option>
                           <option value="문앞에 두고가주세요(우편함에 넣어주셔도 되요)" selected>문앞에 두고가주세요(우편함에 넣어주셔도 되요)</option>
                           <option value="부재시 경비실에 맡겨주세요">부재시 경비실에 맡겨주세요</option>
                           <option value="도착하기전에 전화나 문자를 남겨주세요">도착하기전에 전화나 문자를 남겨주세요</option>
                           <option value="배송전 미리 연락 부탁드립니다">배송전 미리 연락 부탁드립니다</option>
                           <option value="문앞에 두고 문자주세요">문앞에 두고 문자주세요</option>
                           <option value="문앞에 두고 전화주세요">문앞에 두고 전화주세요</option>
                           <option value="택배함에 놔주세요">택배함에 놔주세요</option>
                           <option value="깨지는 물건이니 조심히 다뤄주세요">깨지는 물건이니 조심히 다뤄주세요</option>
                           
                           
                           
                        </select>
                     </div>



                     <div class="form-group">
                        <label for="c_order_notes" class="text-black">택배 메세지</label>
                        <textarea name="c_order_notes" cols="30" rows="5"
                           class="form-control" placeholder="택배기사님들이 보시는 내용입니다."
                           id="request_to_delivery_text" onchange="text()" disabled></textarea>
                     </div>

                  <input type="hidden" id="duplicate_textarea" name="request_to_delivery" value="문앞에 두고가주세요(우편함에 넣어주셔도 되요)" />

                  </div>

</div>
</div>











            <div class="row mb-5">
               <div class="col-md-12">
                  <br><br>
                     <h2 class="h3 mb-3 text-black">Your Order</h2>
                        <div style="border: 1px solid darkgray;" class="p-3 p-lg-5 border">
                           <table class="table site-block-order-table mb-5">
   
                              <tbody>
                                 <tr>
                                    <td class="text-black font-weight-bold"><strong>총주문금액</strong></td>

                                    <td><label  id="final_total_order_price">${final_total_order_price }</label>원</td>
                                 </tr>

                                 <tr>
                                    <td class="text-black font-weight-bold"><strong>총할인금액</strong></td>

                                    <td><label  id="total_discount"></label>원</td>
                                 </tr>

                                 <tr>
                                    <td>총 결제예정 금액</td>
                                    <td><label  id="final_total_pay_price"></label>원</td>
                                 </tr>
									<c:set var="final_total_order_price" value="${final_total_order_price }" />
                                 <tr>
                                    <td class="text-black font-weight-bold"><strong>적립금</strong></td>

                                    <td ><input type="text" id="member_saving" placeholder="사용하실 적릭금 입력" />
            원(총 사용가능 적립금:<strong><fmt:formatNumber value="${memberInfo.member_saving }" type="number" var="member_saving"/>${member_saving}원</strong>)</td>
                                 </tr>

                                 <tr>
                                    <td>포인트</td>
                                    <td><input type="text"  id="member_point"  placeholder="사용하실 포인트를 입력"  />
            원(총 사용가능 포인트:<strong><fmt:formatNumber value="${memberInfo.member_point }" type="number" var="member_point"/>${member_point}P</strong>)</td>
                                 </tr>


<!-- <button class="bubbly-buttons" onclick="apply_discount()" ></button>
 -->                                 
                              </tbody>                           
                              
                           </table>
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           <!-- 나만올수있어 -->
                           <center>
                            <button type="button" class="bubbly-buttons"  onclick="apply_discount()">할인 적용하기   </button> 
                           </center>
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
<input type="hidden" id="order_discount" name="order_discount" />
            <input type="hidden" id="discount_point" name="discount_point" />
            <input type="hidden" id="discount_saving" name="discount_saving" />
            <input type="hidden" id="order_price" name="order_price" />
                     


            


                     

                     
                        </div>
                     </div>
                  </div>

















                  <!-- 33333333333333333 -->



                  <div class="col-md-12 mb-5 mb-md-0">
                     <Br>
                     <Br>
                     <Br>
                     <Br>
                     <Br>
                     <h2 class="h3 mb-3 text-black">배송지</h2>
                     <div style="border: 1px solid darkgray;" class="p-3 p-lg-5 ">






                        <input type="radio" value="무통장입금" name="how_pay" id="how_pay1"
                           checked />무통장 입금 <input type="radio" value="카드결제"
                           name="how_pay" id="how_pay2" />카드결제














                        <!--주소-->

                        <div class="form-group row">
                           <div class="col-md-6">
                              <label  class="text-black">최종 결제 금액</label>
                                <label class="form-control"
                                 id="final_total_pay_price2">원</label>
                                 
                           </div>

                           <div class="col-md-6">
                              <label class="text-black">총 적립예정금액</label>

                              <p class="form-control">${final_total_pro_saving }원</p>
                           </div>
                        </div>

                  





                        <div class="form-group row">
                           <br>
                           <div class="col-md-12">
                              <input type="checkbox" name="agree_to_pay">결제정보를
                              확인하였으며, 구매진행에 동의합니다.
                           </div>
                        </div>

                        


<br>

                        <div id="div_how_pay1" class="form-group">
                           <label  class="text-black">입금은행
                            <span
                              class="text-danger">*</span></label> 
                              <select 
                              class="form-control" name="which_bank">
                              <option value="직접 작성">직접 작성</option>
                              <option value="" selected>:::선택해 주세요:::</option>
                              <option value="기업은행">기업은행:02-987454-54-658-강동현</option>
                              <option value="국민은행">국민은행:65-654846-34-654-강동현</option>
                              <option value="신한은행">신한은행:68-686543-65-654-강동현</option>
                           </select>
                           
                           
                           <br>
                           <div class="form-group row">
                              <div class="col-md-12">
                              <label class="text-black">입금자명 </label>
                               <input
                              type="text" class="form-control" name="who_pay" >
                              </div>
                           </div>
                           
                           
                           
                        </div>










<br>
                           <div id="div_how_pay2" class="form-group">
                           <label  class="text-black">카드회사 <span
                              class="text-danger">*</span></label>
                               <select 
                              class="form-control" name="company_name_of_card">
                              <option value="" selected>:::선택해 주세요:::</option>
            <option value="신한카드">신한카드</option>
            <option value="BC카드">BC카드</option>
            <option value="국민카드">국민카드</option>
            <option value="제일카드">제일카드</option>
            <option value="삼성카드">삼성카드</option>
            <option value="우리카드">우리카드</option>
            <option value="하나카드">하나카드</option>
                           </select>
                           카드주명 <input type="text" name="who_pay" />
                        </div>




<input type="radio" value="일시불" name="card_split" checked/>일시불
         <input type="radio" value="3개월" name="card_split"  />3개월
         <input type="radio" value="6개월" name="card_split"  />6개월
         <input type="radio" value="9개월" name="card_split"  />9개월
         <input type="radio" value="12개월" name="card_split"  />12개월
            







<center>
                            <button type="button" class="bubbly-buttons"  onclick="order(this.form)">결제하기   </button> 
                           </center>




                     





                     </div>







   </form>

</div>
</div>
</div>

</body>
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