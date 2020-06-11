<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>

<%@ include file="../common/isLogin.jsp"%>
<script>
$(function(){
	$('#regEnd').click(function(){
		
		if($("#name").val()==""){
			alert('이름을 입력하세요');
			$('#name').focus();
			return false;
		}
		if($("#addr").val()==""){
			alert('주소를 입력하세요');
			$('#addr').focus();
			return false;
		}
		if($("#mobile1").val()=="" || $("#mobile2").val()=="" || $("#mobile3").val()==""){
			alert('휴대전화를 입력하세요.');
			$('#mobile1').focus();
			return false;
		}
		
		if($('#cleantype').val()==""){
			alert("청소 종류를 입력해주세요.");
			$('#cleantype').focus();
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
		
		if($("#area").val()==""){
			alert('평수를 입력하세요');
			$('#addr').focus();
			return false;
		}
		
		if($("#cleandate").val()==""){
			alert('청소 희망일을 입력하세요');
			$('#cleandate').focus();
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
					<img src="../images/market/sub03_title.gif" alt="블루크리닝 견적 의뢰" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린장터&nbsp;>&nbsp;블루크리닝 견적 의뢰<p>
				</div>
				<form action="blueProc.jsp" method="post" name="blueFrm">
				<input type="hidden" id="id" name="id" value="<%=session.getAttribute("user_id").toString() %>" />
				<table cellpadding="0" cellspacing="0" border="0" class="con_table" style="width:100%;">
					<colgroup>
						<col width="25%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th>고객명/회사명</th>
							<td style="text-align:left;"><input type="text" name="name" id="name"   value="" class="join_input" /></td>
						</tr>
						<tr>
							<th>청소할 곳 주소</th>
							<td style="text-align:left;"><input type="text" name="addr" id="addr" value="" class="join_input" style="width:300px;" /></td>
						</tr>
						<tr>
							<th>연락처</th>
							<td style="text-align:left;"><input type="text" name="tel1"  id="tel1" value="" class="join_input" style="width:50px;" /> - <input type="text" name="tel2" id="tel2" value="" class="join_input" style="width:50px;" /> - <input type="text" name="tel3" id="tel3"   value="" class="join_input" style="width:50px;" /></td>
						</tr>
						<tr>
							<th>휴대전화</th>
							<td style="text-align:left;"><input type="text" name="mobile1"  id="mobile1" value="" class="join_input" style="width:50px;" /> - <input type="text" name="mobile2"  id="mobile2"  value="" class="join_input" style="width:50px;" /> - <input type="text" name="mobile3"  id="mobile3"  value="" class="join_input" style="width:50px;" /></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td style="text-align:left;"><input type="text" name="email1"  id="email1" value="" class="join_input" style="width:100px;" /> @ <input type="text" name="email2"  id="email2"  value="" class="join_input" style="width:100px;" /></td>
						</tr>
						<tr>
							<th>청소의뢰내역</th>
							<td style="text-align:left;" style="padding:0px;">
								<table cellpadding="0" cellspacing="0" border="0" style="width:100%;">
									<tr>
										<td>청소종류</td>
										<td style="border-right:0px;"><input type="text" name="cleantype"  id="cleantype" value="" class="join_input" /></td>
									</tr>
									<tr>
										<td style="border-bottom:0px;">분양평수/등기평수</td>
										<td style="border:0px;"><input type="text" name="area"  id="area" value="" class="join_input" /></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<th>청소 희망날짜</th>
							<td style="text-align:left;"><input type="date" name="cleandate"  id="cleandate" value="" class="join_input" /></td>
						</tr>
						<tr>
							<th>접수종류 구분</th>
							<td style="text-align:left;"><input type="radio" name="receipt"  id="receipt" value="예약신청" /> 예약신청
&nbsp;&nbsp;&nbsp;<input type="radio" name="receipt" id="receipt"  value="견적문의" /> 견적문의</td>
						</tr>
						<tr>
							<th>기타특이사항</th>
							<td style="text-align:left;"><input type="text" name="memo"  id="memo" value="" class="join_input" style="width:400px;" /></td>
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
