<!DOCTYPE html>
<%@page import="model.OrderDTO"%>
<%@page import="model.OrderDAO"%>
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
OrderDAO dao = new OrderDAO(application);


OrderDTO dto = dao.selectViewOrder(num); 
 
dao.close();
%> 

<head>

  
	<%@ include file="../include/adminHead.jsp" %>
  <title>주문관리</title>

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
         <h3>주문관리 - <small>View(상세보기)</small></h3>
                  
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
                  <th class="text-center table-active align-middle">주문자 이름</th>
                  <td><%=dto.getOname() %></td>
               </tr>
               <tr>
                  <th class="text-center table-active align-middle">주문자 주소</th>
                  <td><%=dto.getOzip() %>&nbsp;<%=dto.getOaddr() %>&nbsp;<%=dto.getOextraaddr() %></td>
                  <th class="text-center table-active align-middle">주문자 연락처</th>
                  <td><%=dto.getOmobile() %></td>
               </tr>
               <tr>
                  <th class="text-center table-active align-middle">주문자 이메일</th>
                  <td><%=dto.getOemail() %></td>
                  <th class="text-center table-active align-middle">수령인 이름</th>
                  <td><%=dto.getSname() %></td>
               </tr>          
               <tr>
                  <th class="text-center table-active align-middle">수령인 주소</th>
                  <td><%=dto.getSzip() %>&nbsp;<%=dto.getSaddr() %>&nbsp;<%=dto.getSextraaddr() %></td>
                  <th class="text-center table-active align-middle">수령인 연락처</th>
                  <td><%=dto.getSmobile() %></td>
               </tr>          
               <tr>
                  <th class="text-center table-active align-middle">수령인 이메일</th>
                  <td><%=dto.getSemail() %></td>
                  <th class="text-center table-active align-middle">주문 내용</th>
                  <td><%=dto.getOrdering() %></td>
               </tr>          
               <tr>
                  <th class="text-center table-active align-middle">총 금액</th>
                  <td><%=dto.getTotal() %></td>
                  <th class="text-center table-active align-middle">결제 방식</th>
                  <td><%=dto.getPayment() %></td>
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
               <button type="button" class="btn btn-warning" onclick="location.href='adOrder.jsp';">리스트보기</button>
            </div>
         </div>
          <form name="deleteFrm">
			<input type="hidden" name="num" value="<%=dto.getNum() %>" />            
          </form>
         <script>
            function isDelete() {
            	var affected = dao.deleteOrder(dto);
            	if(affected==1){
            		alert("삭제성공");
            		response.sendRedirect("adOrder.jsp");
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
