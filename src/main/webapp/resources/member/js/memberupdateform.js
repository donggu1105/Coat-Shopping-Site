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

	$(document).ready(function() {
		$('#email_select').change(function() {
			var email = $('#email_select').val();
			if (email == 'direct') {
				$('#_email2').attr('disabled', false);
				$('#_email2').val('');
				$('#_email2').focus();
			} else {
				$('#_email2').attr('disabled',true);
				$('#_email2').val($('#email_select').val());
				$('#email2').val($('#email_select').val());
			}
		});
	});
	
	$(document).ready(function(){
		$('#_email2').blur(function(){
			$('#email2').text($('#_email2').text());
		});
		$('input').on("propertychange change keyup paste input" , function(){
			$(this).css('border-color' , '');
		});
	});
	
	$(document).ready(function(){
		var sel_pwdq = document.getElementById('member_pwd_q');
		for(var i = 0 ; i < sel_pwdq.options.length; i ++){
			if(sel_pwdq.options[i].value == "${member.member_pwd_q}"){
				$('#member_pwd_q option:eq('+ i +')').attr('selected' , 'selected');
			}
		}
		
		var sel_hp = document.getElementById('member_hp1');
		for(var i = 0 ; i < sel_hp.options.length; i ++){
			if(sel_hp.options[i].value == "${member.member_hp1}"){
				$('#member_hp1 option:eq('+ i +')').attr('selected' , 'selected');
			}
		}
		
		var sel_cp = document.getElementById('member_cp1');
		for(var i = 0 ; i < sel_cp.options.length; i ++){
			if(sel_cp.options[i].value == "${member.member_cp1}"){
				$('#member_cp1 option:eq('+ i +')').attr('selected' , 'selected');
			}
		}
		
		var sel_email = document.getElementById('email1');
		for(var i = 0 ; i < sel_email.options.length; i ++){
			if(sel_email.options[i].value == "${member.member_email1}"){
				$('#email1 option:eq('+ i +')').attr('selected' , 'selected');
			}
		}
		
	});
	
	function Sub(){
		var num = 0;
		var list = new Array();
		list[0] = '#member_cp1';
		list[1] = '#member_cp2';
		list[2] = '#member_cp3';
		list[3] = '#email1';
		list[4] = '#_email2';
		list[5] = '#email_select';
		list[6] = '#postaddr';
		list[7] = '#loadaddr';
		list[8] = '#detailaddr';
		list[9] = '#jiaddr';
		
		for(var i = 0 ; i < list.length ; i ++){
			if($(list[i]).val() == ''){$(list[i]).css('border-color','red'); num++;}
		}
		
		if(num == 0){
		document.updateform.action="memberupdate.do";
		document.updateform.submit();
		}else return;
		
		
	}
	
	