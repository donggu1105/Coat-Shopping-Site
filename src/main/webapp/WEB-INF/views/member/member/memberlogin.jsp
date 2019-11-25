<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인 창</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/member/css/signupform.css">
 <style>
.forms-section{
	padding-top: 7%;
	padding-bottom: 7%;
	
}

<style> 



</style>
</head>
<body style="background-color: #fff;">
<section class="forms-section" style="background-color: #3b4465;">

  <div class="forms">
    <div class="form-wrapper is-active">
      <button type="button" class="switcher switcher-login">
        	회원 로그인
        <span class="underline"></span>
      </button>
      <form action="${contextPath}/member/memberlogin.do" method="post" class="form form-login">
        <fieldset>
        
          <div class="input-block">
            <label >아이디</label>
            <input name="member_id" id="login-email" type="text" required>
          </div>
          <div class="input-block">
            <label >비밀번호</label>
            <input name="member_pwd" id="login-password" type="password" required>
          </div>
        </fieldset>
       <input type="submit" class="btn-signup"  value="로그인">
       <input type="submit" class="btn-signup" onclick="location.href='${contextPath}/member/membersignupchoice.do'" value="회원가입" >
      </form>
    </div>
  
    
    <div class="form-wrapper">
      <button type="button" class="switcher switcher-signup">
        비회원 로그인
        <span class="underline"></span>
      </button>
      <form class="form form-signup" action="${contextPath}/nonmember/nonmemberlogin.do" method="POST">
        <fieldset>
         
          <div class="input-block">
            <label for="signup-password">비회원 아이디</label>
            <input id="signup-password" type="text" name="nonmember_id" required>
          </div>
          <div class="input-block">
            <label for="signup-password-confirm">비회원 비밀번호</label>
            <input id="signup-password-confirm" type="password" name="nonmember_pwd" required>
          </div>
        </fieldset>
        <button type="submit" class="btn-signup">로그인</button>
        <input type="submit" class="btn-signup" onclick="location.href='${contextPath}/member/membersignupchoice.do'" value="비회원가입" >
      </form>
    </div>
  </div>
</section>



	
</body>
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
<script type="text/javascript">
const switchers = [...document.querySelectorAll('.switcher')]

switchers.forEach(item => {
	item.addEventListener('click', function() {
		switchers.forEach(item => item.parentElement.classList.remove('is-active'))
		this.parentElement.classList.add('is-active')
	})
})
</script>

</html>