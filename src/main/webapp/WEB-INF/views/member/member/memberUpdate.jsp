<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="member" value="${memberInfo }" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 정보 수정</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${contextPath}/resources/member/js/memberupdateform.js"></script>
</head>
<body>

   <form action="${contextPath}/member/memberupdate.do" method="post" name="updateform">
  <div class="site-section">
      <div class="container">
       
        <div class="row">
          <div class="col-md-12 mb-5 mb-md-0">
          <center>
            <h2 class="h3 mb-3 text-black">회원정보수정</h2>
           </center>
             <br>
            <div style="border: 1px solid #AAAAAA; border-radius: 30px 30px" class="p-3 p-lg-5">
          
            <!--아이디-->
             
            <!--비밀번호-->
            

             <div style="margin-left: -14px;"class="col-md-12">
              <div class="form-group">
                <label for="c_country" class="text-black">본인 확인 질문</label>
                <select  class="form-control" name="member_pwd_q" id="member_pwd_q">
                  <option value="null" selected="selected">질문선택</option>
                  <option>예전에 살던 동네는?</option>
                  <option>내가 나온 초등학교는?</option>
                  <option>가장 좋아했던 선생님 이름은?</option>
                  <option>두 번째 애완동물 이름은?</option>
                  <option>어린시절 별명은?</option>
                  <option>어린시절 장래 희망은?</option>
                  <option>어린 시절에 존경 했던 인물은?</option>
                  <option>첫번째 직장상사 이름은?</option>
                  <option>첫사랑 이름은?</option>
                  <option>현재 이름을 변경한다면 바꾸고 싶은 이름은?</option>
                </select>
              </div>
              
             </div>
             
             
             <div class="form-group row">
                <div class="col-md-12">
                  <label for="c_companyname" class="text-black">본인확인 답변</label>
                  <input type="text" class="form-control" name="member_pwd_a" value="${member.member_pwd_a }">
                </div>
              </div>
             
                
                
                
               
                
                
                
                
                
                
                
                
                
              <!--전화-->
              <div class="form-group row">
               <div class="col-md-4">
              <div class="form-group">
                <label for="c_country" class="text-black">전화번호</label>
                <select class="form-control" name="member_hp1" id="member_hp1">
                  <option value="02">02</option>
                  <option value="010">010</option>
                  <option value="051">051</option>
                  <option value="053">053</option>
                  <option value="062">062</option>
                  <option value="031">031</option>
                  <option value="064">064</option>
                  <option value="033">033</option> 
                </select>
              </div>
              
             </div>
                <div class="col-md-4">
                  <label for="c_fname" class="text-black"><br></label>
                   <input type="text" class="form-control" name="member_hp2" size="4" maxlength="4" value="${member.member_hp2 }"
					onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;"
					style='IME-MODE: disabled;'>
                </div>
                <div class="col-md-4">
                  <label for="c_lname" class="text-black"><br></label>
                  <input type="text"
					name="member_hp3" class="form-control" size="4" maxlength="4" value="${member.member_hp3 }"
					onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;"
					style='IME-MODE: disabled;'>
                </div>
              </div>
             

             
            <!--휴대전호-->
              <div class="form-group row">
               <div class="col-md-4">
              <div class="form-group">
                <label for="c_country" class="text-black">휴대전화<span class="text-danger">*</span></label>
                <select name="member_cp1" id="member_cp1" class="form-control">
                 <option value="010">010</option>
                  <option value="011">011</option>
                  <option value="016">016</option>
                  <option value="017">017</option>
                  <option value="018">018</option>
                  <option value="019">019</option>  
                </select>
              </div>
             </div>
                <div class="col-md-4">
                  <label for="c_fname" class="text-black"><br></label>
                  <input type="text" class="form-control" name="member_cp2" size="4" id="member_cp2" maxlength="4" value="${member.member_cp2 }"
					onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;"
					style='IME-MODE: disabled;'>
                </div>
                <div class="col-md-4">
                  <label for="c_fname" class="text-black"><br></label>
               <input type="text" class="form-control"
					name="member_cp3" size="4" maxlength="4" id="member_cp3" value="${member.member_cp3 }"
					onkeypress="if (event.keyCode<48|| event.keyCode>57)  event.returnValue=false;"
					style='IME-MODE: disabled;'>
                  </div>
              </div>
             
             
             
             
                          <!--이메일-->
              <div class="form-group row">

                <div class="col-md-4">
                       <label for="c_country" class="text-black">이메일 <span class="text-danger">*</span></label>
                <input type="text" class="form-control" id="email1" name="member_email1" value="${member.member_email1 }"
					size="6">
 
                </div>
                
                
                <div class="col-md-4">
                       <label for="c_country" class="text-black"><br></label>
                <input type="text" class="form-control" id="_email2" size="6" disabled="disabled" value="${member.member_email2 }">
				<input type="hidden" name="member_email2" value="${member.member_email2}" id="email2">
                </div>
                
                
                <div class="col-md-4">
              <div class="form-group">
           
                <label for="c_fname" class="text-black"><br></label>
                <select id="email_select" class="form-control">
                  <option value="naver.com" selected>naver.com</option>
                  <option value="hanmail.net">hanmail.net</option>
                  <option value="hotmail.com">hotmail.com</option>
                  <option value="nate.com">nate.com</option>
                  <option value="yahoo.co.kr">yahoo.co.kr</option>
                  <option value="empas.com">empas.com</option>
                  <option value="dreamwiz.com">dreamwiz.com</option>
                  <option value="freechal.com">freechal.com</option>
                  <option value="lycos.co.kr">lycos.co.kr</option>
                  <option value="korea.com">korea.com</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="hanmir.com">hanmir.com</option>
                  <option value="paran.com">paran.com</option>
                  <option value="direct">직접입력</option>
                </select>
              </div>
              
             </div>
               
              </div>
             
             <!--주소-->
            <div class="form-group row">
                      <div class="col-md-8">
                        <label for="c_diff_address" class="text-black">주소<span class="text-danger">*</span></label>
                       <input type="text" class="form-control" name="member_addr1" id="postaddr" value="${member.member_addr1}"
					placeholder="우편번호">
                      </div>
                      <div class="col-md-4">
                        <label for="c_diff_address" class="text-black"><br></label>
                        <input type="button" class="form-control" onclick="find_addr()" value="주소찾기">
                      </div>
                    </div>

              <div class="form-group">
                <input type="text" class="form-control" name="member_addr2" id="loadaddr" value="${member.member_addr2}"
					placeholder="주소">
              </div>
              <div class="form-group">
               <input type="text" class="form-control" name="member_addr3" id="jiaddr" value="${member.member_addr3}"
					placeholder="동">
              </div>
             
              <input type="text" class="form-control" name="member_addr4" id="detailaddr" value="${member.member_addr4}"
					placeholder="상세주소">

             
             

                











                  
                <br>  <br>  <br>
            		<div class="form-group row">
                      
               
                      
                      <div class="col-md-6">
                         <input style="background-color: #ff084e; border:1px solid #ff084e;" type="button" class="btn btn-primary btn-lg py-3 btn-block" value="회원정보수정"  onclick="Sub()">
                      </div>
                      <div class="col-md-6">
                        <input style="background-color: #ff084e; border:1px solid #ff084e;" type="button" class="btn btn-primary btn-lg py-3 btn-block" value="취소" onclick="history.back();">
                      </div>
                        
             
                    </div>


             
            </div>
          </div>
   
        </div>
        <!-- </form> -->
      </div>
    </div>
   </form>

</body>
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

<script src="${contextPath}/resources/k/js/jquery/jquery-2.2.4.min.js"></script>
<script src="${contextPath}/resources/k/js/popper.min.js"></script>
<script src="${contextPath}/resources/k/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/k/js/plugins.js"></script>
<script src="${contextPath}/resources/k/js/active.js"></script>
</html>