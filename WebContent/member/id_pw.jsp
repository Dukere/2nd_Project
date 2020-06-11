<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="smtp.SMTPAuth"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>

<script src="../common/jquery/jquery-3.5.1.js"></script>
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<script>
$(function(){
	$("#idCheck").click(function(){
		var name = $('#name').val();
		var email = $('#email').val();
		
		$.ajax({
			url : "id_check.jsp",
			type : 'get',
			data : {
				name : name,
				email : email
			},
			success : function(data) {
				
				if(data==0){
					
					$("#result").text("아이디가 없습니다.");
					
				}
				else{
					
					$("#result").text("회원님의 아이디는 '"+data+"' 입니다.");
					 
				}
				
			}, error : function() {
				console.log("실패");
			}
		});
	})
	
	$("#passCheck").click(function(){
		var id = $('#id2').val();
		var name = $('#name2').val();
		var email = $('#email2').val();
		
		$.ajax({
			url : "id_check.jsp",
			type : 'get',
			data : {	
				id : id,
				name : name,
				email : email
			},
			success : function(data) {
				
				if(data==0){
					
					$("#result2").text("일치하는 정보가 없습니다.");
					
				}
				else{
					
					$("#result2").text("가입 시 입력하신 이메일로 발송하였습니다.");
					 
				}
				
			}, error : function() {
				console.log("실패");
			}
		});
	})
});
</script>
 <body>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/member/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<%@ include file = "../include/member_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/member/id_pw_title.gif" alt="" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;아이디/비밀번호찾기<p>
				</div>
				<div class="idpw_box">
					<div class="id_box">
						<ul>
							<li><input type="text" id="name" value="" class="login_input01" /></li>
							<li><input type="text" id="email" value="" class="login_input01" /></li>
							<input type="hidden" id="id" name="id" value=""/>
						</ul>
						<input type="image" id="idCheck" src="../images/member/id_btn01.gif" class="id_btn" data-toggle="modal" data-target="#idCheckModal" />
						<a href=""><img src="../images/login_btn03.gif" class="id_btn02" /></a>
					</div>
					<div class="pw_box">
						<ul>
							<li><input type="text" id="id2" value="" class="login_input01" /></li>
							<li><input type="text" id="name2" value="" class="login_input01" /></li>
							<li><input type="text" id="email2" value="" class="login_input01" /></li>
							<input type="hidden" id="pass" name="pass" value=""/>
						</ul>
						<input type="image" id="passCheck" src="../images/member/id_btn01.gif" class="id_btn" data-toggle="modal" data-target="#passCheckModal" />
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	
	<div class="modal fade" id="idCheckModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">아이디 찾기</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        	<div id="result" class="modal-body"></div>
        <div class="modal-footer">
          <button class="btn btn-primary" type="button" data-dismiss="modal">확인</button>
        </div>
      </div>
    </div>
 	</div>
 	
 	<div class="modal fade" id="passCheckModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">비밀번호 찾기</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        	<div id="result2" class="modal-body"></div>
        <div class="modal-footer">
          <button class="btn btn-primary" type="button" data-dismiss="modal">확인</button>
        </div>
      </div>
    </div>
 	</div>
	
 </body>
</html>
