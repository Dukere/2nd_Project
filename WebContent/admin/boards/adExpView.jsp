<!DOCTYPE html>
<%@page import="model.ExpDTO"%>
<%@page import="model.requestDAO"%>
<%@page import="model.blueDTO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="util.PagingUtil"%>
<%@page import="model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "adIsLogin.jsp" %>

<% 

request.setCharacterEncoding("UTF-8");

String bname = request.getParameter("bname");
String uri = request.getRequestURI();
String num = request.getParameter("num");
requestDAO dao = new requestDAO(application);


ExpDTO dto = dao.selectViewExp(num); 

dao.close();
%> 

<head>

  
	<%@ include file="../include/adminHead.jsp" %>
  <title>체험학습</title>

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
         <h3>체험학습 - <small>View(상세보기)</small></h3>
                  
         <div class="row mt-3 mr-1">
            <table class="table table-bordered">
            <colgroup>
               <col width="20%"/>
               <col width="30%"/>
               <col width="20%"/>
               <col width="*"/>
            </colgroup>
            <tbody>
               <tr>
                  <th class="text-center table-active align-middle">아이디</th>
                  <td><%=dto.getId() %></td>
                  <th class="text-center table-active align-middle">작성일</th>
                  <td><%=dto.getPostdate() %></td>
               </tr>
               <tr>
                  <th class="text-center table-active align-middle">장애유무</th>
                  <td><%=dto.getDisabled() %></td>
                  <th class="text-center table-active align-middle">주요장애유형</th>
                  <td><%=dto.getDisabledtype() %></td>
               </tr>
               <tr>
                  <th class="text-center table-active align-middle">보장구 사용유무</th>
                  <td><%=dto.getEquip() %></td>
                  <th class="text-center table-active align-middle">보장구 명</th>
                  <td><%=dto.getEquipname() %></td>
               </tr>          
               <tr>
                  <th class="text-center table-active align-middle">연락처</th>
                  <td><%=dto.getTel() %></td>
                  <th class="text-center table-active align-middle">담당자 휴대전화</th>
                  <td><%=dto.getMobile() %></td>
               </tr>          
               <tr>
                  <th class="text-center table-active align-middle">이메일</th>
                  <td><%=dto.getEmail() %></td>
                  <th class="text-center table-active align-middle">체험희망날짜</th>
                  <td><%=dto.getExpdate() %></td>
               </tr>          
               <tr>
                  <th class="text-center table-active align-middle">케잌체험</th>
                  <td><%=dto.getCakeexp() %></td>
                  <th class="text-center table-active align-middle">쿠키체험</th>
                  <td><%=dto.getCookieexp() %></td>
               </tr>          
               <tr>
                  <th class="text-center table-active align-middle">접수종류 구분</th>
                  <td><%=dto.getReceipt() %></td>
                  <th class="text-center table-active align-middle">기타특이사항</th>
                  <td><%=dto.getMemo() %></td>
               </tr>          
            </tbody>
            </table>
         </div>
         <div class="row mb-3">
            <div class="col-6">
               <button type="button" class="btn btn-success"
                  onclick="return isDelete()">삭제하기</button>
            </div>
            <div class="col-6 text-right pr-5">
               <button type="button" class="btn btn-warning" onclick="location.href='adExp.jsp';">리스트보기</button>
            </div>
         </div>
          <form name="deleteFrm">
			<input type="hidden" name="num" value="<%=dto.getNum() %>" />            
          </form>
         <script>
            function isDelete() {
            	var affected = dao.deleteExp(dto);
            	if(affected==1){
            		alert("삭제성공");
            		response.sendRedirect("adExp.jsp");
            	}
            	else{
            		alert("삭제에 실패하였습니다.");
            	}
            }
         </script>
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
