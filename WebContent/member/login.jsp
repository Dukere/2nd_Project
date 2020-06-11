<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>

<%
//리퀘스트 내장객체를 이용하여 쿠키를 읽어온다.
Cookie[] cookies = request.getCookies();
//쿠키에 저장된 아이디를 저장 할 변수 생성
String user = "";
//쿠키가 존재한다면 전체에서 USER_ID라는 쿠키명이 있는지 찾는다.
if(cookies != null){
	for(Cookie ck : cookies) {
		if(ck.getName().equals("user_id")) {
			//찾았다면 쿠키에 저장된 쿠키값을 변수에 저장한다.
			user = ck.getValue();
		}
	}
}
%>
 <body>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/member/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<%@ include file = "../include/member_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
			<%
			//로그인 전이거나 로그인에 실패했을때 출력되는 내용
			if(session.getAttribute("user_id")==null){
			%>
				<div class="top_title">
					<img src="../images/login_title.gif" alt="인사말" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;로그인<p>
				</div>
				<script>
					function logValid(fn){
						if(!fn.user_id.value){
							alert("아이디를 입력하세요");
							fn.user_id.focus();
							return false;
						}
						if(fn.user_pw.value==""){
							alert("패스워드를 입력하세요");
							fn.user_pw.focus();
							return false;
						}
					}
				</script>
				<form action="../common/logProc.jsp" method="post" name="logFrm"
					onsubmit="return logValid(this);">
				<div class="login_box01">
					<img src="../images/login_tit.gif" style="margin-bottom:30px;" />
					<ul>
						<li><img src="../images/login_tit001.gif" alt="아이디" style="margin-right:15px;" /><input type="text" name="user_id" value="<%=user == null ? "" : user %>" class="login_input01" /></li>
						<li><img src="../images/login_tit002.gif" alt="비밀번호" style="margin-right:15px;" /><input type="text" name="user_pw" value="" class="login_input01" /></li>
					</ul>
					<input type="image" src="../images/login_btn.gif" class="login_btn01" />
				</div> 
				<p style="margin-left : 90px;margin-bottom:50px;">
				<input type="checkbox" name="id_save" value="" 
							<% if(user.length() != 0) { %>
								checked="checked" 
							<% } %> />
				<img src="../images/login_tit03.gif" alt="저장" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""><img src="../images/login_btn02.gif" alt="아이디/패스워드찾기" /></a>&nbsp;<a href=""><img src="../images/login_btn03.gif" alt="회원가입" /></a></p>
				</form>
			<% }else{  %>
				<script>
					alert("로그인되어있습니다.");
					window.location='../main/main.jsp';
				</script>
			<% } %>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	
	<%@ include file="../include/footer.jsp" %>
	
 </body>
</html>
