<%@page import="model.MemDTO"%>
<%@page import="model.MemDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.BasketDAO"%>
<%@page import="model.BasketDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp"%>

<%@ include file="../common/isLogin.jsp"%>

<script src="../common/jquery/jquery-3.5.1.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%
	String id = session.getAttribute("user_id").toString();

	BasketDAO dao = new BasketDAO(application);

	List<BasketDTO> bbs = dao.selectList(id);

	MemDAO dao2 = new MemDAO(application);

	MemDTO dto2 = new MemDTO();

	dto2 = dao2.selectView(id);

	dao.close();
%>
<script>
	$(function() {
		$('#regEnd').click(
				function() {

					if ($("#name").val() == "") {
						alert('이름을 입력하세요');
						$('#name').focus();
						return false;
					}
					if ($("#id").val() == "") {
						alert('아이디를 입력하세요');
						$('#id').focus();
						return false;
					}
					if ($("#isIdcheck").val() == "n")
					{
						alert('아이디를 확인해 주세요.');
						$('#id').focus();
						return false;
					}

					if ($("#pass").val() == "") {
						alert("패스워드를 입력하세요");
						$('#pass').focus();
						return false;
					}

					if ($('#isPassCheck').val() == 'n') {
						alert("비밀번호를 확인해 주세요.");
						$('#pass').focus();
						return false;
					}

					if ($("#pass").val() != $("#pass2").val()) {
						alert("패스워드가 일치하지 않습니다.");
						$('#pass').focus();
						return false;
					}

					if ($("#tel1").val() == "" || $("#tel2").val() == ""
							|| $("#tel3").val() == "") {
						alert("전화번호를 정확히 입력하세요");
						$('#tel1').focus();
						return false;
					}
					if ($("#mobile1").val().length != 3) {
						alert("핸드폰 번호를 정확히 입력하세요");
						$('#mobile1').focus();
						return false;
					}
					if ($("#mobile2").val().length != 4) {
						alert("핸드폰 번호를 정확히 입력하세요");
						$('#mobile2').focus();
						return false;
					}
					if ($("#mobile3").val().length != 4) {
						alert("핸드폰 번호를 정확히 입력하세요");
						$('#mobile3').focus();
						return false;
					}
					if ($("#email1").val() == "" || $("#email2").val() == "") {
						alert("이메일을 입력하세요");
						$('#email1').focus();
						return false;
					}

					if ($("#zip1").val() == "" || $("#addr1").val() == "") {
						alert("주소를 입력하세요");
						$('#zip1').focus();
						return false;
					}

					if ($("#payment1").val() == "" && $("#paymen2").val() == ""
							&& $("#payment3").val() == "") {
						alert("결제방식을 선택하세요");
						$('#payment1').focus();
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

					var letter = 0;
					var num = 0;

					if (user_id.length<4 || user_id.length>12) {

						$("#idChkText").text(" * 4자 이상 12자 이내의 영문/숫자 조합");
						$('#idChkText').css('color', 'red');
						$('#isIdcheck').val("n");
						return;
					}

					for (var i = 0; i < user_id.length; i++) {

						var temp = user_id.charCodeAt(i);

						console.log(temp);

						if (temp >= 0x61 && temp <= 0x7A) {
							letter++;
						} else if (temp >= 0x41 && temp <= 0x5A) {
							letter++;
						} else if (temp >= 0x30 && temp <= 0x39) {
							num++;
						} else {
							$("#idChkText").text(" * 4자 이상 12자 이내의 영문/숫자 조합");
							$('#idChkText').css('color', 'red');
							$('#isIdcheck').val("n");
							return;
						}

					}

					console.log(letter + ", " + num);
					if (letter == 0 || num == 0) {
						$("#idChkText").text(" * 4자 이상 12자 이내의 영문/숫자 조합");
						$('#idChkText').css('color', 'red');
						$('#isIdcheck').val("n");
						return;
					}

					if (data == 1) {

						$("#idChkText").text("중복된 아이디가 있습니다. 다시 입력해주세요.");
						$('#idChkText').css('color', 'red');
						$('#isIdcheck').val("n");

					} else {

						$("#idChkText").text("사용 가능합니다.");
						$('#idChkText').css('color', 'green');
						$('#isIdcheck').val("y");

					}

				},
				error : function() {
					console.log("실패");
				}
			});
		});

		//비밀번호 유효성 체크
		$('#pass').blur(function() {
			$('#pass2').val("");
			$('#passCheck2').text('');

			var letter = 0;
			var num = 0;

			if ($('#pass').val().length < 4 || $('#pass').val().length > 12) {

				$("#passCheck1").text(" * 4자 이상 12자 이내의 영문/숫자 조합");
				$('#passCheck1').css('color', 'red');
				$('#isPassCheck').val('n');
				return;
			}

			for (var i = 0; i < $('#pass').val().length; i++) {

				var temp = $('#pass').val().charCodeAt(i);

				console.log(temp);

				if (temp >= 0x61 && temp <= 0x7A) {
					letter++;
				} else if (temp >= 0x41 && temp <= 0x5A) {
					letter++;
				} else if (temp >= 0x30 && temp <= 0x39) {
					num++;
				} else {
					$("#passCheck1").text(" * 4자 이상 12자 이내의 영문/숫자 조합");
					$('#passCheck1').css('color', 'red');
					$('#isPassCheck').val('n');
					return;
				}

			}

			if (letter == 0 || num == 0) {
				$("#passCheck1").text(" * 4자 이상 12자 이내의 영문/숫자 조합");
				$('#passCheck1').css('color', 'red');
				$('#isPassCheck').val('n');
				return;
			}

			$("#passCheck1").text(" 사용 가능 ");
			$('#passCheck1').css('color', 'green');
			$('#isPassCheck').val('y');
		});

		$('#pass2').blur(function() {
			if ($('#pass').val() == null) {
				$('#passCheck2').text("");
			} else if ($('#pass').val() == $('#pass2').val()) {
				$('#passCheck2').text("암호가 일치합니다.");
				$('#passCheck2').css('color', 'green');
			} else {
				$('#passCheck2').text("암호가 불일치합니다.");
				$('#passCheck2').css('color', 'red');
			}
		});

		//이메일 자동입력
		$('#last_email_check2').change(function() {

			var text = $('#last_email_check2 option:selected').text();
			var value = $('#last_email_check2 option:selected').val();
			if (value == '') {//선택하세요를 선택
				$('#email2').attr('readonly', true);
				$('#email2').val('');

			} else if (value == '1') {//직접입력을 선택
				$('#email2').attr('readonly', false);
				$('#email2').val('');

			} else {//그외 포털 도메인 선택
				$('#email2').attr('readonly', true);
				$('#email2').val(value);
			}
		});
		$('#last_email_check22').change(function() {

			var text = $('#last_email_check22 option:selected').text();
			var value = $('#last_email_check22 option:selected').val();
			if (value == '') {//선택하세요를 선택
				$('#email22').attr('readonly', true);
				$('#email22').val('');

			} else if (value == '1') {//직접입력을 선택
				$('#email22').attr('readonly', false);
				$('#email22').val('');

			} else {//그외 포털 도메인 선택
				$('#email22').attr('readonly', true);
				$('#email22').val(value);
			}
		});

		$('#open_email').change(function() {
			if ($('#open_email').is(":checked")) {
				$('#openemail').val("y");
			} else {
				$('#openemail').val("n");
			}
		})

		$('#yes').click(function() {
			$('#name2').val($('#name').val());
			$('#zip12').val($('#zip1').val());
			$('#addr12').val($('#addr1').val());
			$('#extraAddr2').val($('#extraAddr').val());

			$('#mobile12').val($('#mobile1').val());
			$('#mobile22').val($('#mobile2').val());
			$('#mobile32').val($('#mobile3').val());

			$('#email12').val($('#email1').val());
			$('#email22').val($('#email2').val());

		});
		$('#no').click(function() {
			$('#name2').val("");
			$('#zip12').val("");
			$('#addr12').val("");
			$('#extraAddr2').val("");

			$('#mobile12').val("");
			$('#mobile22').val("");
			$('#mobile32').val("");

			$('#email12').val("");
			$('#email22').val("");

		});

	})

	function sample6_execDaumPostcode() {
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

	function sample6_execDaumPostcode2() {
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
					document.getElementById("addr22").value = extraAddr;

				} else {
					document.getElementById("addr22").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zip12').value = data.zonecode;
				document.getElementById("addr12").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("extraAddr2").focus();

				$('#zip12').attr('readonly', true);
				$('#addr12').attr('readonly', true);
			}
		}).open();
	}
</script>

<body>
	<center>
		<div id="wrap">
			<%@ include file="../include/top.jsp"%>

			<img src="../images/market/sub_image.jpg" id="main_visual" />

			<div class="contents_box">
				<div class="left_contents">

					<%@ include file="../include/market_leftmenu.jsp"%>
				</div>
				<div class="right_contents">
					<div class="top_title">
						<img src="../images/market/sub01_title.gif" alt="수아밀 제품 주문"
							class="con_title" />
						<p class="location">
							<img src="../images/center/house.gif" />&nbsp;&nbsp;열린장터&nbsp;>&nbsp;수아밀
							제품 주문
						<p>
					</div>
					<p class="con_tit">
						<img src="../images/market/basket_title01.gif" />
					</p>
					<table cellpadding="0" cellspacing="0" border="0"
						class="basket_list" style="margin-bottom: 50px;">
						<colgroup>
							<col width="20%" />
							<col width="*" />
							<col width="20%" />
							<col width="15%" />
							<col width="10%" />
							<col width="15%" />
						</colgroup>
						<thead>
							<tr>
								<th>이미지</th>
								<th>상품명</th>
								<th>판매가</th>
								<th>적립금</th>
								<th>수량</th>
								<th>합계</th>
							</tr>
						</thead>
						<tbody>
							<%
								String path = "";
								int allTotal = 0;

								for (BasketDTO dto : bbs) {

									allTotal += dto.getTotal();

									path = "../images/market/" + dto.getImage();
							%>
							<tr>
								<td><img src="<%=path%>" width="50" height="50" /></td>
								<td><%=dto.getName()%></td>
								<td><%=dto.getPrice()%>원</td>
								<td><img src="../images/market/j_icon.gif" />&nbsp;<%=dto.getMileage()%></td>
								<td><input type="number" name="qty"
									value="<%=dto.getQty()%>" class="basket_num" readonly /></td>
								<td><span><%=dto.getTotal()%><span></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
					<form action="orderProc.jsp" method="post">
						<p class="con_tit">
							<img src="../images/market/basket_title02.gif" />
						</p>
						<table cellpadding="0" cellspacing="0" border="0"
							class="con_table" style="width: 100%;"
							style="margin-bottom:50px;">
							<colgroup>
								<col width="15%" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th>성명</th>
									<td style="text-align: left;"><input type="text" id="name"
										name="name" value="<%=dto2.getName()%>" class="join_input" /></td>
								</tr>
								<tr>
									<th>주소</th>
									<td style="text-align: left;"><input type="text" id="zip1"
										name="zip1" value="<%=dto2.getZip()%>" class="join_input"
										style="width: 100px;" readonly /> <a
										onclick="sample6_execDaumPostcode()" href="javascript:;"
										title="새 창으로 열림" onkeypress="">[우편번호검색]</a> <br /> <input
										type="text" id="addr1" name="addr1"
										value="<%=dto2.getAddr()%>" class="join_input"
										style="width: 550px; margin-top: 5px;" readonly /> <input
										type="text" id="addr2" name="addr2" value=""
										class="join_input" style="width: 550px; margin-top: 5px;"
										readonly /> <br> <input type="text" id="extraAddr"
										name="extraAddr" value="<%=dto2.getExtraaddr()%>"
										class="join_input" style="width: 550px; margin-top: 5px;" /></td>
								</tr>
								<tr>
									<th>휴대폰</th>
									<td style="text-align: left;"><input type="text"
										id="mobile1" name="mobile1"
										value="<%=dto2.getMobile().substring(0, 3)%>" maxlength="3"
										class="join_input" style="width: 50px;" />&nbsp;-&nbsp; <input
										type="text" id="mobile2" name="mobile2"
										value="<%=dto2.getMobile().substring(3, 7)%>" maxlength="4"
										class="join_input" style="width: 50px;" />&nbsp;-&nbsp; <input
										type="text" id="mobile3" name="mobile3"
										value="<%=dto2.getMobile().substring(7, 11)%>" maxlength="4"
										class="join_input" style="width: 50px;" /></td>
								</tr>
								<tr>
									<%
										String[] emailArr = dto2.getEmail().split("@");
									%>
									<th>이메일주소</th>
									<td style="text-align: left;"><input type="text"
										id="email1" name="email1"
										style="width: 100px; height: 20px; border: solid 1px #dadada;"
										value="<%=emailArr[0]%>" /> @ <input type="text" id="email2"
										name="email2"
										style="width: 150px; height: 20px; border: solid 1px #dadada;"
										value="<%=emailArr[1]%>" readonly /> <select
										name="last_email_check2" class="pass" id="last_email_check2">
											<option selected="" value="">선택해주세요</option>
											<option value="1">직접입력</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="msn.co.kr">msn.co.kr</option>
											<option value="nate.com">nate.com</option>
											<option value="naver.com">naver.com</option>
											<option value="google.com">google.com</option>
									</select></td>
								</tr>
							</tbody>
						</table>

						<p class="con_tit">
							<img src="../images/market/basket_title03.gif" />
						</p>
						<p style="text-align: right">
							배송지 정보가 주문자 정보와 동일합니까? 예<input type="radio" name="check" id="yes" />
							아니오<input type="radio" name="check" id="no" />
						</p>
						<table cellpadding="0" cellspacing="0" border="0"
							class="con_table" style="width: 100%;"
							style="margin-bottom:50px;">
							<colgroup>
								<col width="15%" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th>성명</th>
									<td style="text-align: left;"><input type="text"
										id="name2" name="name2" value="" class="join_input" /></td>
								</tr>
								<tr>
									<th>주소</th>
									<td style="text-align: left;"><input type="text"
										id="zip12" name="zip12" value="" class="join_input"
										style="width: 100px;" /> <a
										onclick="sample6_execDaumPostcode2()" href="javascript:;"
										title="새 창으로 열림" onkeypress="">[우편번호검색]</a> <br /> <input
										type="text" id="addr12" name="addr12" value=""
										class="join_input" style="width: 550px; margin-top: 5px;" />
										<input type="text" id="addr22" name="addr22" value=""
										class="join_input" style="width: 550px; margin-top: 5px;" />
										<br> <input type="text" id="extraAddr2" name="extraAddr2"
										value="" class="join_input"
										style="width: 550px; margin-top: 5px;" /></td>
								</tr>
								<tr>
									<th>휴대폰</th>
									<td style="text-align: left;"><input type="text"
										id="mobile12" name="mobile12" value="" maxlength="3"
										class="join_input" style="width: 50px;" />&nbsp;-&nbsp; <input
										type="text" id="mobile22" name="mobile22" value=""
										maxlength="4" class="join_input" style="width: 50px;" />&nbsp;-&nbsp;
										<input type="text" id="mobile32" name="mobile32" value=""
										maxlength="4" class="join_input" style="width: 50px;" /></td>
								</tr>
								<tr>
									<th>이메일주소</th>
									<td style="text-align: left;"><input type="text"
										id="email12" name="email12"
										style="width: 100px; height: 20px; border: solid 1px #dadada;"
										value="" /> @ <input type="text" id="email22" name="email22"
										style="width: 150px; height: 20px; border: solid 1px #dadada;"
										value="" readonly /> <select name="last_email_check22"
										class="pass" id="last_email_check22">
											<option selected="" value="">선택해주세요</option>
											<option value="1">직접입력</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="msn.co.kr">msn.co.kr</option>
											<option value="nate.com">nate.com</option>
											<option value="naver.com">naver.com</option>
											<option value="google.com">google.com</option>
									</select></td>
								</tr>
								<tr>
									<th>배송메세지</th>
									<td style="text-align: left;"><input type="text"
										name="message" value="" class="join_input"
										style="width: 500px;" /></td>
								</tr>
							</tbody>
						</table>

						<p class="con_tit">
							<img src="../images/market/basket_title04.gif" />
						</p>
						<table cellpadding="0" cellspacing="0" border="0"
							class="con_table" style="width: 100%;"
							style="margin-bottom:30px;">
							<colgroup>
								<col width="15%" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th>결제금액</th>
									<td style="text-align: left;"><span class="money"
										name="total"><%=allTotal%></span></td>
									<input type="hidden" name="total" value="<%=allTotal%>" />
								</tr>
								<tr>
									<th>결제방식선택</th>
									<td style="text-align: left;"><input type="radio"
										name="payment" id="payment1" value="카드결제" />
										카드결제&nbsp;&nbsp;&nbsp;<input type="radio" name="payment"
										id="payment2" value="무통장입금" /> 무통장입금&nbsp;&nbsp;&nbsp;<input
										type="radio" name="payment" id="payment3" value="실시간 계좌이체" />
										실시간 계좌이체</td>
								</tr>
							</tbody>
						</table>
						<p style="text-align: right;">
							<input type="image" src="../images/market/basket_btn04.gif" />
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
