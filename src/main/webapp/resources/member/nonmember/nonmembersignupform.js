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
					$('#jiaddr').css('border','');

				} else {
					document.getElementById("jiaddr").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postaddr').value = data.zonecode;
				document.getElementById("loadaddr").value = addr;
				$('#postaddr').css('border','');
				$('#loadaddr').css('border','');
				
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailaddr").focus();
				
				
			}
		}).open();
		
	}

	$(document).ready(function() {//id 중복처리 function
		$('#member_id').blur(function() {
			var id = $('#member_id').val();
			if (id == '') {
				$('#id_check').text('아이디를 입력해주세요');
			} else {
				$.ajax({
					type : 'POST',
					url : 'idoverlap.do',
					dataType : "text",
					data : {
						nonmember_id : id
					},
					success : function(data) {
						if (data == 'true') {
							$('#id_check').text('사용가능한 아이디 입니다');
							$('#id_check').css('color', 'black');
						} else {
							$('#id_check').text('사용할 수 없는 아이디 입니다');
							$('#id_check').css('color', 'red');
						}
					},
					error : function() {
						$('#id_check').text('오류');
					}

				});
			}
		});
	});

	$(document).ready(function() {//password 일치 여부
		$('#pwd2').blur(function() {

			var pw1 = $('#pwd1').val();
			var pw2 = $('#pwd2').val();

			if (pw1 == pw2) {
				$('#password_check').text("");
			} else {
				$('#password_check').text("비밀번호가 일치하지 않습니다");
			}
		});
	});

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
		});
		
		$(document).ready(function(){
			
			$("input").on("propertychange change keyup paste input", function() {
				$(this).css('border-color','');			 
			});
			
			$('select').change(function(){
				$(this).css('border-color','');
			});
			
			$('#email_select').change(function(){
				$('#_email2').css('border','');
			});
		});	
		
		function Sub(){
			var num = 0;
			var list = new Array();
			list[0] = '#member_id';
			list[1] = '#pwd1';
			list[2] = '#pwd2';
			list[3] = '#member_name';
			list[4] = '#member_gender';
			list[5] = '#member_cp1';
			list[6] = '#member_cp2';
			list[7] = '#member_cp3';
			list[8] = '#email1';
			list[9] = '#_email2';
			list[10] = '#postaddr';
			list[11] = '#loadaddr';
			list[12] = '#detailaddr';
			list[13] = '#jiaddr';
			list[14] = '#birth_y';
			list[15] = '#birth_m';
			list[16] = '#birth_d';
			
			
			for(var i = 0 ; i < list.length ; i ++){
				if($(list[i]).val() == ''){$(list[i]).css('border-color','red'); num++;}
			}
			
			
			if(num == 0){
			document.signupform.action="nonmembersignup.do";
			document.signupform.submit();
			}else return;
		}
		
		