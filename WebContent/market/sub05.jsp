<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>


<script>
$(function(){
	$('#regEnd').click(function(){
		
		if($("#name").val()==""){
			alert('이름을 입력하세요');
			$('#name').focus();
			return false;
		}
		if($("#disabled1").val()==""&&$("#disabled2").val()==""){
			alert('장애 유무를 입력하세요');
			$('#disabled').focus();
			return false;
		}
		if($("#disabledtype").val()==""){
			alert('주요 장애 유형을 입력하세요');
			$('#disabledtype').focus();
			return false;
		}
		if($("#equip1").val()==""&&$("#equip2").val()==""){
			alert('보장구 사용유무를 입력하세요');
			$('#equip').focus();
			return false;
		}
		if($("#equipname").val()==""){
			alert('보장구명을 입력하세요');
			$('#equipname').focus();
			return false;
		}
		if($("#mobile1").val()=="" || $("#mobile2").val()=="" || $("#mobile3").val()==""){
			alert('휴대전화를 입력하세요.');
			$('#mobile1').focus();
			return false;
		}
		
		if($('#cakeexp').val()==""){
			alert("케잌체험을 입력해주세요.");
			$('#cakeexp').focus();
			return false;
		}
		if($('#cookieexp').val()==""){
			alert("쿠키체험을 입력해주세요.");
			$('#cookieexp').focus();
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
		
		if($("#expdate").val()==""){
			alert('체험 일자를 입력하세요');
			$('#expdate').focus();
			return false;
		}
		if($("#receipt").val()==""){
			alert('접수 종류를 선택하세요');
			$('#receipt').focus();
			return false;
		}
		

	});
	
})
</script>

 <body>
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/market/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				
				<%@ include file = "../include/market_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/market/sub05_title.gif" alt="체험학습신청" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린장터&nbsp;>&nbsp;체험학습신청<p>
				</div>
				<p class="con_tit"><img src="../images/market/sub05_tit01.gif" /></p>
				<ul class="dot_list">
					<li>무 방부제 • 무첨가제 수제 빵 제작 체험</li>
					<li>사전에 준비된 반죽으로 성형 및 굽기 체험</li>
					<li>참가비 : 일인당 20,000원 (교육비, 재료비 포함)</li>
				</ul>
				<p class="con_tit"><img src="../images/market/sub05_tit02.gif" /></p>
				<ul class="dot_list">
					<li>내가만든 맛있는 쿠키~!</li>
					<li>쿠키의 반죽 ,성형, 굽기 기술 경험의 기회! </li>
					<li>참가비 : 일인당 15,000원 (교육비, 재료비 포함)</li>
				</ul> 
				<p class="con_tit"><img src="../images/market/sub05_tit03.gif" /></p>
				<ul class="dot_list">
					<li>만드는 즐거움 받는이에겐 감동을~!</li>
					<li>직접 데코레이션한 세상에서 하나뿐인
케익을 소중한 사람에게 전하세요~!
</li>
					<li>준비된 케익시트에 테코레이션 과정 체험</li>
					<li>참가비 : 일인당 25,000원 (교육비, 재료비 포함)</li>
				</ul>
				<div style="text-align:left">
					<img src="../images/market/sub05_img01.jpg" style="margin-bottom:30px;" />
				</div>
				<form action="ExpProc.jsp" method="post" name="blueFrm">
				<input type="hidden" id="id" name="id" value="<%=session.getAttribute("user_id").toString() %>" />
				<table cellpadding="0" cellspacing="0" border="0" class="con_table" style="width:100%;">
					<colgroup>
						<col width="25%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th>고객명/회사명</th>
							<td style="text-align:left;"><input type="text" name="name" id="name"  value="" class="join_input" /></td>
						</tr>
						<tr>
							<th>장애유무</th>
							<td style="text-align:left;" style="padding:0px;">
								<table cellpadding="0" cellspacing="0" border="0" style="width:100%;">
									<tr>
										<td style="border-bottom:0px;"><input type="radio" name="disabled" id="disabled1"  value="유" /> 유&nbsp;&nbsp;&nbsp;<input type="radio" name="disabled" id="disabled2"  value="무" /> 무</td>
										<th style="border-bottom:0px;" width="100px">주요장애유형</th>
										<td style="border-right:0px; border-bottom:0px;"><input type="text" name="disabledtype" id="disabledtype"  value="" class="join_input" /></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<th>보장구 사용유무</th>
							<td style="text-align:left;" style="padding:0px;">
								<table cellpadding="0" cellspacing="0" border="0" style="width:100%;">
									<tr>
										<td style="border-bottom:0px;"><input type="radio" name="equip" id="equip1"  value="유" /> 유&nbsp;&nbsp;&nbsp;<input type="radio" name="equip" id="equip2"  value="무" /> 무</td>
										<th style="border-bottom:0px;" width="100px">보장구 명</th>
										<td style="border-right:0px; border-bottom:0px;"><input type="text" name="equipname"  id="equipname" value="" class="join_input" /></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td style="text-align:left;"><input type="text" name="tel1" id="tel1"  value="" class="join_input" style="width:50px;" /> - <input type="text" name="tel2" id="tel2"  value="" class="join_input" style="width:50px;" /> - <input type="text" name="tel3" id="tel3"  value="" class="join_input" style="width:50px;" /></td>
						</tr>
						<tr>
							<th>담당자 휴대전화</th>
							<td style="text-align:left;"><input type="text" name="mobile1" id="mobile1"  value="" class="join_input" style="width:50px;" /> - <input type="text" name="mobile2" id="mobile2"  value="" class="join_input" style="width:50px;" /> - <input type="text" name="mobile3" id="mobile3"  value="" class="join_input" style="width:50px;" /></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td style="text-align:left;"><input type="text" name="email1" id="email1"  value="" class="join_input" style="width:100px;" /> @ <input type="text" name="email2" id="email2"  value="" class="join_input" style="width:100px;" /></td>
						</tr>
						<tr>
							<th>체험내용</th>
							<td style="text-align:left;" style="padding:0px;">
								<table cellpadding="0" cellspacing="0" border="0" style="width:100%;">
									<tr>
										<td>케익체험</td>
										<td style="border-right:0px;"><input type="text" name="cakeexp" id="cakeexp"  value="" class="join_input" /></td>
									</tr>
									<tr>
										<td style="border-bottom:0px;">쿠키체험</td>
										<td style="border:0px;"><input type="text" name="cookieexp" id="cookieexp"  value="" class="join_input" /></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<th>체험희망날짜</th>
							<td style="text-align:left;"><input type="date" name="expdate" id="expdate"  value="" class="join_input" /></td>
						</tr>
						<tr>
							<th>접수종류 구분</th>
							<td style="text-align:left;"><input type="radio" name="receipt" id="receipt1"  value="예약신청" /> 예약신청
&nbsp;&nbsp;&nbsp;<input type="radio" name="receipt" id="receipt2"  value="견적문의" /> 견적문의</td>
						</tr>
						<tr>
							<th>기타특이사항</th>
							<td style="text-align:left;"><input type="text" name="memo" id="memo"  value="" class="join_input" style="width:400px;" /></td>
						</tr>
					</tbody>
				</table>
				<p style="text-align:center; margin-bottom:40px"><input type="image" src="../images/btn01.gif" />&nbsp;&nbsp;<a href="#"><img src="../images/btn02.gif" /></a></p>
				</form>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>
