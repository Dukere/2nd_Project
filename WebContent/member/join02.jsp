<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp"%>
<script src="../common/jquery/jquery-3.5.1.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function(){
		$('#regEnd').click(function(){
			
			if($("#name").val()==""){
				alert('이름을 입력하세요');
				$('#name').focus();
				return false;
			}
			if($("#id").val()==""){
				alert('아이디를 입력하세요');
				$('#id').focus();
				return false;
			}
			if($("#isIdcheck").val()=="n"){
				alert('아이디를 확인해 주세요.');
				$('#id').focus();
				return false;
			}
			
			if($("#pass").val()==""){
				alert("패스워드를 입력하세요");
				$('#pass').focus();
				return false;
			}
			
			if($('#isPassCheck').val()=='n'){
				alert("비밀번호를 확인해 주세요.");
				$('#pass').focus();
				return false;
			}
			
			if($("#pass").val()!=$("#pass2").val()){
				alert("패스워드가 일치하지 않습니다.");
				$('#pass').focus();
				return false;
			}
			
			if($("#tel1").val()=="" || $("#tel2").val()=="" || $("#tel3").val()==""){
				alert("전화번호를 정확히 입력하세요");
				$('#tel1').focus();
				return false;
			}
			if($("#mobile1").val().length!=3){
				alert("핸드폰 번호를 정확히 입력하세요");
				$('#mobile1').focus();
				return false;
			}
			if($("#mobile2").val().length!=4){
				alert("핸드폰 번호를 정확히 입력하세요");
				$('#mobile2').focus();
				return false;
			}
			if($("#mobile3").val().length!=4){
				alert("핸드폰 번호를 정확히 입력하세요");
				$('#mobile3').focus();
				return false;
			}
			if($("#email1").val()=="" || $("#email2").val()==""){
				alert("이메일을 입력하세요");
				$('#email1').focus();
				return false;
			}
			
			if($("#zip1").val()=="" || $("#addr1").val()==""){
				alert("주소를 입력하세요");
				$('#zip1').focus();
				return false;
			}
			

		});
        
    	//아이디 유효성 체크
        $("#id").blur(function() {
    		var user_id = $('#id').val();
    		$.ajax({
    			url : "id_check.jsp",
    			type : 'get',
    			data : {
    				id : user_id
    			},
    			success : function(data) {
    				
    				var letter=0;
    				var num=0;
    				
    				 if(user_id.length<4 || user_id.length>12){
    					
    					$("#idChkText").text(" * 4자 이상 12자 이내의 영문/숫자 조합");
    					$('#idChkText').css('color', 'red');
    					$('#isIdcheck').val("n");
    					return;
    				} 
    				
    				for(var i = 0; i<user_id.length;i++){
    					
    					var temp = user_id.charCodeAt(i);
    					
    					console.log(temp);
    					
	    				if (temp >= 0x61 && temp <= 0x7A) {
	    				    letter++;
	    				} 
	    				else if (temp >=0x41 && temp <= 0x5A) {
	    					letter++;
	    				}
	    				else if (temp >= 0x30 && temp <= 0x39) {	
	    				    num++;
	    				} 
	    				else{
	    					$("#idChkText").text(" * 4자 이상 12자 이내의 영문/숫자 조합");
	    					$('#idChkText').css('color', 'red');
	    					$('#isIdcheck').val("n");
	    					return;
	    				}
	    				
    				} 
    				 
    				console.log(letter +", "+ num);
    				if(letter==0 || num==0){
    					$("#idChkText").text(" * 4자 이상 12자 이내의 영문/숫자 조합");
    					$('#idChkText').css('color', 'red');
    					$('#isIdcheck').val("n");
    					return;
    				} 
    				
    				if(data==1){
    					
    					$("#idChkText").text("중복된 아이디가 있습니다. 다시 입력해주세요.");
    					$('#idChkText').css('color', 'red');
    					$('#isIdcheck').val("n");
    					
    				}
    				else{
    					
    					$("#idChkText").text("사용 가능합니다.");
    					$('#idChkText').css('color', 'green');
    					$('#isIdcheck').val("y");
    					 
    				}
    				
    			}, error : function() {
    				console.log("실패");
    			}
    		});
    	});
    	
      //비밀번호 유효성 체크
		$('#pass').blur(function(){
            $('#pass2').val("");
            $('#passCheck2').text('');
            
            var letter=0;
			var num=0;
			
			 if($('#pass').val().length<4 || $('#pass').val().length>12){
				
				$("#passCheck1").text(" * 4자 이상 12자 이내의 영문/숫자 조합");
				$('#passCheck1').css('color', 'red');
				$('#isPassCheck').val('n');
				return;
			} 
			
			for(var i = 0; i<$('#pass').val().length;i++){
				
				var temp = $('#pass').val().charCodeAt(i);
				
				console.log(temp);
				
				if (temp >= 0x61 && temp <= 0x7A) {
				    letter++;
				} 
				else if (temp >=0x41 && temp <= 0x5A) {
					letter++;
				}
				else if (temp >= 0x30 && temp <= 0x39) {	
				    num++;
				}
				else{
					$("#passCheck1").text(" * 4자 이상 12자 이내의 영문/숫자 조합");
					$('#passCheck1').css('color', 'red');
					$('#isPassCheck').val('n');
					return;
				}
				
			} 
			
			if(letter==0 || num==0){
				$("#passCheck1").text(" * 4자 이상 12자 이내의 영문/숫자 조합");
				$('#passCheck1').css('color', 'red');
				$('#isPassCheck').val('n');
				return;
			} 
			
			$("#passCheck1").text(" 사용 가능 ");
			$('#passCheck1').css('color', 'green');
			$('#isPassCheck').val('y');
        });
		 
		
        $('#pass2').blur(function(){
        	if($('#pass').val()==null){
        		$('#passCheck2').text("");
        	} 
        	else if($('#pass').val() == $('#pass2').val()){
                $('#passCheck2').text("암호가 일치합니다.");
                $('#passCheck2').css('color','green');
            }else {
                $('#passCheck2').text("암호가 불일치합니다.");
                $('#passCheck2').css('color','red');
            }
        });
       
        //이메일 자동입력
        $('#last_email_check2').change(function(){
            
            var text = $('#last_email_check2 option:selected').text();
            var value = $('#last_email_check2 option:selected').val();
            if(value==''){//선택하세요를 선택
                $('#email2').attr('readonly', true);
                $('#email2').val('');

            }else if(value=='1'){//직접입력을 선택
                $('#email2').attr('readonly', false);
                $('#email2').val('');

            }else{//그외 포털 도메인 선택
                $('#email2').attr('readonly', true);
                 $('#email2').val(value);
            }
        }); 
        
        $('#open_email').change(function(){
        	if($('#open_email').is(":checked")){
        		$('#openemail').val("y");
        	}
        	else{
        		$('#openemail').val("n");
        	}
        })
        
	})
	
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("addr2").value = extraAddr;
                
                } else {
                    document.getElementById("addr2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip1').value = data.zonecode;
                document.getElementById("addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("extraAddr").focus();
                
                $('#zip1').attr('readonly', true);
                $('#addr1').attr('readonly', true);
            }
        }).open();
    }

	</script>
<body>
	<center>
		<div id="wrap">
			<%@ include file="../include/top.jsp"%>

			<img src="../images/member/sub_image.jpg" id="main_visual" />

			<div class="contents_box">
				<div class="left_contents">
					<%@ include file="../include/member_leftmenu.jsp"%>
				</div>
				<div class="right_contents">
					<div class="top_title">
						<img src="../images/join_tit.gif" alt="회원가입" class="con_title" />
						<p class="location">
							<img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;회원가입
						
						<p>
					</div>

					<p class="join_title">
						<img src="../images/join_tit03.gif" alt="회원정보입력" />
					</p>
					
					<form action="joinProc.jsp" method="post" name="joinFrm"> 
					
						<table cellpadding="0" cellspacing="0" border="0" class="join_box">
							<colgroup>
								<col width="80px;" />
								<col width="*" />
							</colgroup>
							<tr>
								<th><img src="../images/join_tit001.gif" /></th>
								<td><input type="text" id="name" name="name" value=""
									class="join_input" /></td>
							</tr>
							<tr>
								<th><img src="../images/join_tit002.gif" /></th>
								<td><input type="text" id="id" name="id" value="" class="join_input"/>
									<input type="hidden" id="isIdcheck" name ="isIdcheck"/>
									&nbsp;&nbsp;<span id="idChkText" name ="idChkText">*
										4자 이상 12자 이내의 영문/숫자 조합하여 공백 없이 기입</span></td>
							</tr>
							<tr>
								<th><img src="../images/join_tit003.gif" /></th>
								<td><input type="password" id="pass" name="pass" value=""
									class="join_input" />&nbsp;&nbsp;<span id="passCheck1">* 4자 이상 12자 이내의
										영문/숫자 조합</span>
									<input type="hidden" id="isPassCheck" name="passCheck" />		
								</td>
							</tr>
							<tr>
								<th><img src="../images/join_tit04.gif" /></th>
								<td><input type="password" id="pass2" value=""
									class="join_input" />&nbsp;&nbsp; <span id="passCheck2"></span>
								</td>
							</tr>


							<tr>
								<th><img src="../images/join_tit06.gif" /></th>
								<td><input type="text" id="tel1" name="tel1" value="" maxlength="3"
									class="join_input" style="width: 50px;" />&nbsp;-&nbsp; <input
									type="text" id="tel2" name="tel2" value="" maxlength="4" class="join_input"
									style="width: 50px;" />&nbsp;-&nbsp; <input type="text"
									id="tel3" name="tel3" value="" maxlength="4" class="join_input"
									style="width: 50px;" /></td>
							</tr>
							<tr>
								<th><img src="../images/join_tit07.gif" /></th>
								<td><input type="text" id="mobile1" name="mobile1" value="" maxlength="3"
									class="join_input" style="width: 50px;" />&nbsp;-&nbsp; <input
									type="text" id="mobile2" name="mobile2" value="" maxlength="4"
									class="join_input" style="width: 50px;" />&nbsp;-&nbsp; <input
									type="text" id="mobile3" name="mobile3" value="" maxlength="4"
									class="join_input" style="width: 50px;" /></td>
							</tr>
							<tr>
								<th><img src="../images/join_tit08.gif" /></th>
								<td><input type="text" id="email1" name="email1"
									style="width: 100px; height: 20px; border: solid 1px #dadada;"
									value="" /> @ 
									<input type="text" id="email2" name="email2"
									style="width: 150px; height: 20px; border: solid 1px #dadada;"
									value="" readonly /> 
									<select name="last_email_check2"
										class="pass" id="last_email_check2">
										<option selected="" value="">선택해주세요</option>
										<option value="1">직접입력</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="msn.co.kr">msn.co.kr</option>
										<option value="nate.com">nate.com</option>
										<option value="naver.com">naver.com</option>
										<option value="google.com">google.com</option>
									</select> 
								<input type="checkbox" id="open_email" name="open_email" value="yes"> <span>이메일
										수신동의</span>
								<input type="hidden" id="openemail" name="openemail" />
								</td>
										
							</tr>
							<tr>
								<th><img src="../images/join_tit09.gif" /></th>
								<td><input type="text" id="zip1" name="zip1" value=""
									class="join_input" style="width: 100px;" /> <a
									onclick="sample6_execDaumPostcode()"
									href="javascript:;" title="새 창으로 열림"
									onkeypress="">[우편번호검색]</a> <br /> 
									<input type="text"
									id="addr1" name="addr1" value="" class="join_input"
									style="width: 550px; margin-top: 5px;" />
									 <input type="text"
									id="addr2" name="addr2" value="" class="join_input"
									style="width: 550px; margin-top: 5px;" />
									<br>
									<input type="text" id="extraAddr" name="extraAddr" value="" class="join_input"
									style="width: 550px; margin-top: 5px;" /></td>
							</tr>
						</table>
					<p style="text-align: center; margin-bottom: 20px">
						<input type="image" src="../images/btn01.gif" id="regEnd" alt="회원가입">&nbsp;&nbsp;<a
							href="../main/main.jsp"><img src="../images/btn02.gif" /></a>
					</p>
					</form>

				</div>
			</div>
			<%@ include file="../include/quick.jsp"%>
		</div>


		<%@ include file="../include/footer.jsp"%>
	</center>
</body>
</html>
