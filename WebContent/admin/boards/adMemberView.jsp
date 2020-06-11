<!DOCTYPE html>
<%@page import="model.MemDTO"%>
<%@page import="model.MemDAO"%>
<%@page import="util.PagingUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "adIsFlag.jsp" %>
    
<%
request.setCharacterEncoding("UTF-8"); 

String queryStr="";

String searchColumn = request.getParameter("searchColumn");
String searchWord = request.getParameter("searchWord");
if(searchWord!=null){
	queryStr += 
		"searchColumn="+searchColumn+"&searchWord="+searchWord+"&";
}
//3페이지에서 상세보기 했다면 리스트로 돌아갈때도 3페이지로 가야한다.
String nowPage =request.getParameter("nowPage");
if(nowPage==null||nowPage.equals(""))
	nowPage="1";
queryStr += "&nowPage="+ nowPage;


//폼값 받기 - 파라미터로 전달된 게시물의 일련번호
String id = request.getParameter("id");
MemDAO dao = new MemDAO(application);


/* 
//게시물의 조회수 +1증가
dao.updateVisitCount(num); */

//게시물을 가져와서 DTO객체로 반환
MemDTO dto = dao.selectView(id);

dao.close();
%>  

<head>
		
  
	<%@ include file="../include/adminHead.jsp" %>
  	<title><%=boardTitle%></title>


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
						<h3><%=boardTitle%>
							- <small>Edit(수정)</small>
						</h3>
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

						<form name="writeFrm" method="post" action="adMemberEditProc.jsp">
							<div class="row mt-3 mr-1">
								<table class="table table-bordered table-striped">
									<input type="hidden" name="id" value="<%=dto.getId()%>" />
									<colgroup>
										<col width="20%" />
										<col width="*" />
									</colgroup>
									<tbody>
										<tr>
											<th class="text-center" style="vertical-align: middle;">아이디</th>
											<td><%=dto.getId()%></td>
											<th class="text-center" style="vertical-align: middle;">이름</th>
											<td><input type="text" class="form-control" name="name"
												value="<%=dto.getName()%>" /></td>
										</tr>
										<tr>
											<th class="text-center" style="vertical-align: middle;">비밀번호</th>
											<td><input type="text" class="form-control" name="pass"
												value="<%=dto.getPass()%>" /></td>
											<th class="text-center" style="vertical-align: middle;">전화번호</th>
											<td><input type="text" class="form-control" name="tel"
												value="<%=dto.getTel()%>" /></td>
										</tr>
										<tr>
											<th class="text-center" style="vertical-align: middle;">핸드폰번호</th>
											<td><input type="text" class="form-control" name="mobile"
												value="<%=dto.getMobile()%>" /></td>
											<th class="text-center" style="vertical-align: middle;">이메일</th>
											<td><input type="text" class="form-control" name="email"
												value="<%=dto.getEmail()%>" /></td>
										</tr>
										<tr>
											<th class="text-center" style="vertical-align: middle;">이메일수신여부</th>
											<td><input type="text" class="form-control" name="openemail"
												value="<%=dto.getOpenemail()%>" /></td>
											<th class="text-center" style="vertical-align: middle;">권한</th>
											<td><select type="select" class="form-control" name="auth" >
												<%
													
													String x1="", x2="", x3="";
												
													switch(dto.getAuth()){
													
														case "admin":
															x1="selected='selected'";
															break;
														case "worker":
															x2="selected='selected'";
															break;
														case "normal":
															x3="selected='selected'";
															break;
															
													}
												%>
													<option value="">직업선택</option>
													<option value="admin" <%=x1 %>>관리자</option>
													<option value="worker" <%=x2 %>>직원</option>
													<option value="normal" <%=x3 %>>일반</option>
												</select>
													
											</td>
										</tr>
										<tr>
											<th class="text-center" style="vertical-align: middle;">가입일</th>
											<td><input type="text" class="form-control" name="regidate"
												value="<%=dto.getRegidate()%>" /></td>
											<th class="text-center" style="vertical-align: middle;">우편번호</th>
											<td><input type="text" class="form-control" name="zip"
												value="<%=dto.getZip()%>" /></td>
										</tr>
										<tr>
											<th class="text-center" style="vertical-align: middle;">주소</th>
											<td><input type="text" class="form-control" name="addr"
												value="<%=dto.getAddr()%>" /></td>
											<th class="text-center" style="vertical-align: middle;">상세주소</th>
											<td><input type="text" class="form-control" name="extraaddr"
												value="<%=dto.getExtraaddr()%>" /></td>
										</tr>
									</tbody>
							</table>
						</div>
							<div class="row mb-3">
								<div class="col text-right">
									<button type="submit" class="btn btn-danger">전송하기</button>
									<button type="reset" class="btn btn-dark">Reset</button>
									<button type="button" class="btn btn-warning"
										onclick="location.href='adMember.jsp?<%=queryStr%>';">리스트보기</button>
								</div>
							</div>
						</form>
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
