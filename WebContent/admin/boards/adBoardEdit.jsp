<!DOCTYPE html>
<%@page import="util.PagingUtil"%>
<%@page import="model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../adIsLogin.jsp"%>

<%@ include file="adIsFlag.jsp"%>
<%-- <%
if(!(bname.equals("freeboard") || bname.equals("qna"))){
	JavascriptUtil.jsAlertBack("해당 게시판은 글쓰기를 할 수 없습니다.", out);
	return;
}
%> --%> 
<%
	//폼값받기  - 파라미터로 전달된 게시물의 일련번호
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO(application);

	//게시물을 가져와서 DTO객체로 변환
	BoardDTO dto = dao.selectView(num);

	dao.close();
%>
<head>

<%@ include file="../include/adminHead.jsp"%>

<title><%=boardTitle%> - Edit(수정)</title>


</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%@ include file="../include/adminSidebar.jsp"%>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<%@ include file="../include/adminTopbar.jsp"%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<div class="col-9 pt-3">
						<h3><%=boardTitle%>
							- <small>Edit(수정)</small>
						</h3>
						<input type="hidden" name="num" value="<%=dto.getNum()%>" /> <input
							type="hidden" name="bname" value="<%=bname%>" />
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
								if (frm.title.value == "") {
									alert('제목을 입력하세요');
									frm.title.focus();
									return false;

								}
								if (frm.content.value == "") {
									alert('내용을입력하세요.'); //경고창 띄움
									frm.content.focus(); //입력란으로 포커스 이동
									return false; // 전송되지 않도록 이벤트리스너로 false반환
								}
							}
						</script>
						<div class="row mt-3 mr-1">
							<table class="table table-bordered table-striped">
							<% if (!bname.equals("info")) {%>
								<form name="writeFrm" method="post" action="adEditProc.jsp"
									onsubmit="return checkValidate(this);">
							<%} else { %>
								<form name="writeFrm" method="post" action="adFileEditProc.jsp"
									onsubmit="return checkValidate(this);" enctype="multipart/form-data">
							<%} %>
									<input type="hidden" name="num" value="<%=dto.getNum()%>" />
									<input type="hidden" name="bname" value="<%=bname%>" />
									<input type="hidden" name = "sfile" value="<%=dto.getSfile() %>" />
									<input type="hidden" name = "ofile" value="<%=dto.getOfile() %>" />
									<colgroup>
										<col width="20%" />
										<col width="*" />
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
											<th class="text-center" style="vertical-align: middle;">제목</th>
											<td><input type="text" class="form-control" name="title"
												value="<%=dto.getTitle()%>" /></td>
										</tr>
										<tr>
											<th class="text-center" style="vertical-align: middle;">내용</th>
											<td><textarea rows="10" class="form-control"
													name="content"><%=dto.getContent()%></textarea></td>
										</tr>
										<% if(bname.equals("info")) {  
											 if(dto.getOfile()!=null)  {%>
										<tr>
											<th class="text-center" style="vertical-align: middle;">기존파일</th>
											<td><%=dto.getOfile() %></td>
										</tr>
											<% } %>
										<tr>
											<th class="text-center" style="vertical-align: middle;">첨부파일</th>
											<td><input type="file" name = "file1" class="form-control" value=""/></td>
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
								<button type="submit" class="btn btn-danger">전송하기</button>
								<button type="reset" class="btn btn-dark">Reset</button>
								<button type="button" class="btn btn-warning"
									onclick="location.href='adBoardList.jsp?bname=<%=bname%>';">리스트보기</button>
							</div>
							</form>
						</div>
					</div>
				</div>
				<!-- End of Main Content -->

				<!-- Footer -->
				<footer class="sticky-footer bg-white">
					<div class="container my-auto">
						<div class="copyright text-center my-auto"></div>
					</div>
				</footer>
				<!-- End of Footer -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>

		<!-- Logout Modal-->
		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Ready to
							Leave?</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are
						ready to end your current session.</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">Cancel</button>
						<a class="btn btn-primary" href="login.html">Logout</a>
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
