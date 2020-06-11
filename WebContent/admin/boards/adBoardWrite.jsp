<!DOCTYPE html>
<%@page import="util.PagingUtil"%>
<%@page import="model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "adIsLogin.jsp" %>

<%@ include file = "adIsFlag.jsp" %>
<%-- <%
if(!(bname.equals("freeboard") || bname.equals("qna"))){
	JavascriptUtil.jsAlertBack("해당 게시판은 글쓰기를 할 수 없습니다.", out);
	return;
}
%> --%>

<head>
	 
	<%@ include file = "../include/adminHead.jsp" %>
	
  <title><%=boardTitle%> - Write(작성)</title>


 	<script>
	function checkValidate(frm) {
		if(frm.title.value ==""){
			alert('제목을 입력하세요');
			frm.title.focus();
			return false;

		}
		if(frm.content.value==""){
			alert('내용을입력하세요.'); //경고창 띄움
			frm.content.focus(); //입력란으로 포커스 이동
			return false; // 전송되지 않도록 이벤트리스너로 false반환
		}
	}
	</script> 
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <%@ include file="../include/adminSidebar.jsp" %>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <%@ include file="../include/adminTopbar.jsp" %>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">
			<div class="col-9 pt-3">
			<h3><%=boardTitle %> - <small>Write(작성)</small></h3>
					
				<!-- 	<script>
					//유기명함수 
					function checkValidate(frm){
						if(frm.title.value==''){
							alert("제목을입력하세요."); //경고창 띄움
							frm.title.focus(); //입력란으로 포커스 이동
							retrun false; // 전송되지 않도록 이벤트리스너로 false반환
						}
						if(frm.title.value==''){
							alert("내용을입력하세요."); //경고창 띄움
							frm.content.focus(); //입력란으로 포커스 이동
							retrun false; // 전송되지 않도록 이벤트리스너로 false반환
						}
							
					} 
					/* 
					//무기명함수
					var checkValidate2 =function(frm){
						//실행부는 유기명함수와 동일함
					} */
					</script>	 -->
				
			 	<script>
				function checkValidate(frm) {
					if(frm.title.value ==""){
						alert('제목을 입력하세요');
						frm.title.focus();
						return false;

					}
					if(frm.content.value==""){
						alert('내용을입력하세요.'); //경고창 띄움
						frm.content.focus(); //입력란으로 포커스 이동
						return false; // 전송되지 않도록 이벤트리스너로 false반환
					}
				}
				</script> 
			<div class="row mt-3 mr-1"> 
				<table class="table table-bordered table-striped">
				<% if(bname.equals("info")||bname.equals("emp")||bname.equals("guard")) {  %>
				<form name = "writeFrm" method= "post" action="adFileProc.jsp" 
				onsubmit="return checkValidate(this);" enctype="multipart/form-data">
				<% } else {%>
				<form name = "writeFrm" method= "post" action="adWriteProc.jsp" 
				onsubmit="return checkValidate(this);">
				<% } %>
				<input type="hidden" name="bname" value="<%=bname %>" />
				<colgroup>
					<col width="20%"/>
					<col width="*"/>
				</colgroup>
				<tbody>
					<!-- <tr>
						<th class="text-center align-middle">작성자</th>
						<td>
							<input type="text" class="form-control"	style="width:100px;"/>
						</td>
					</tr> -->
					<!-- <tr>
						<th class="text-center" 
							style="vertical-align:middle;">패스워드</th>
						<td>
							<input type="password" class="form-control"
								style="width:200px;"/>
						</td>
					</tr> -->
					<tr>
						<th class="text-center" 
							style="vertical-align:middle;">제목</th>
						<td> 
							<input type="text" class="form-control"  name="title"/>
						</td>
					</tr>
					<%
						if(bname.equals("program")){
					%>
					<tr>
						<th class="text-center" 
							style="vertical-align:middle;">프로그램 날짜</th>
						<td>
							<input type="date" class="form-control"  name="date"/> 
						</td>
					</tr>
					<% 
						}
					%>
					<tr>
						<th class="text-center"
							style="vertical-align:middle;">내용</th>
						<td>
							<textarea rows="10" 
								class="form-control"  name="content"></textarea>
							<!-- <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
							<script src="../common/naver_editor/js/HuskyEZCreator.js" charset="utf-8"></script>
							<script>
								$(function(){
									var editor_object=[];
									
									nhn.husky.EZCreator.createInIFrame({
										oAppRef: editor_object,
										elPlaceHolder : "smarteditor",
										sSkinURI : "../common/naver_editor/SmartEditor2Skin.html",
										HTpARAMS : {
											bUseToolbar : true,
											bUseVerticalResizer : true,
											bUseModeChanger : true,
										}
									});
									
									$("#savebutton").click(function(){
										editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", [])
										function writeValidate(){}
									});
								});
								
							</script> -->
						</td>
					</tr>
					<% if(bname.equals("info")||bname.equals("emp")||bname.equals("guard")) {  %>
					 <tr>
						<th class="text-center"
							style="vertical-align:middle;">첨부파일</th>
						<td>
							<input type="file" name="file" class="form-control" />
						</td>
					</tr>
					<% } %>
				</tbody>
				</table>
			</div>
			<div class="row mb-3">
				<div class="col text-right">
					<!-- 각종 버튼 부분 -->
					<!-- <button type="button" class="btn">Basic</button> -->
					<!-- <button type="button" class="btn btn-primary" 
						onclick="location.href='BoardWrite.jsp';">글쓰기</button> -->
					<!-- <button type="button" class="btn btn-secondary">수정하기</button>
					<button type="button" class="btn btn-success">삭제하기</button>
					<button type="button" class="btn btn-info">답글쓰기</button>
					<button type="button" class="btn btn-light">Light</button>
					<button type="button" class="btn btn-link">Link</button> -->
					<button type="submit" id="savebutton" class="btn btn-primary">전송하기</button>
					<button type="reset" class="btn btn-dark">Reset</button>
					<button type="button" class="btn btn-warning" onclick="location.href='adBoardList.jsp?bname=<%=bname %>';">리스트보기</button>
				</div>
				</form>
			</div>
		</div>
      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">정말 로그아웃하시겠습니까?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">'로그 아웃'을 누르면 로그 아웃이 됩니다.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
          <a class="btn btn-primary" href="../adLogout.jsp">로그 아웃</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../js/sb-admin-2.min.js"></script>

</body>

</html>
