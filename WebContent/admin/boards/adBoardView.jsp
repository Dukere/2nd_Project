<!DOCTYPE html>
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
<%@ include file = "adIsFlag.jsp" %>

<%

String queryStr= "bname="+bname+"&"; 
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
String num = request.getParameter("num");
BoardDAO dao = new BoardDAO(application);


/* 
//게시물의 조회수 +1증가
dao.updateVisitCount(num); */

//게시물을 가져와서 DTO객체로 반환
BoardDTO dto = dao.selectView(num);

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
         <h3><%=boardTitle %> - <small>View(상세보기)</small></h3>
                  
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
                  <th class="text-center table-active align-middle">작성자</th>
                  <td><%=dto.getName() %></td>
                  <th class="text-center table-active align-middle">조회수</th>
                  <td><%=dto.getVisitcount() %></td>
               </tr>
               <tr>
                  <th class="text-center table-active align-middle">제목</th>
                  <td colspan="3">
                     <%=dto.getTitle() %>
                  </td>
               </tr>
               <tr>
                  <th class="text-center table-active align-middle">내용</th>
                  <td colspan="3" class="align-middle" style="height:200px;">
                     <%--
                     textarea에서 엔터키로 줄바꿈을 한 후 DB에 저장하면 \r\n으로
                     저장되므로, HTML 페이지에서 출력할 때는 <br>태그로 문자열을
                     변경해야 한다.
                     --%>
                     <%=dto.getContent().replace("\r\n", "<br>") %>
                  </td>
               </tr>
               <% if(bname.equals("info")||bname.equals("emp")||bname.equals("guard")) { %>
               <tr>
                  <th class="text-center table-active align-middle">첨부파일</th>
                  <td colspan="3">
                  	<% if(dto.getOfile()!=null) { %>
                  	    <a href="adDown.jsp?oname=<%=URLEncoder.encode(dto.getOfile(),"UTF-8")%>&sname=<%=URLEncoder.encode(dto.getSfile(),"UTF-8") %>"><%=dto.getOfile() %></a>
                  	<% } else { %>
                  		첨부파일 없음
                    <% } %>
                  </td>
               </tr>
               <% } %>
               
            </tbody>
            </table>
         </div>
         <div class="row mb-3">
            <div class="col-6">
            <%
            /* 
            로그인이 완료된 상태이면서, 동시에 해당 게시물의 작성자라면
            수정, 삭제 버튼을 보이게 처리한다.
            */
            if(session.getAttribute("user_id") != null && 
               session.getAttribute("user_id").toString().equals(dto.getId())) {
            %>
               <!-- 수정, 삭제의 경우 특정게시물에 대해 수행하는 작업이므로 반드시
               게시물의 일련번호(PK)가 파라미터로 전달되어야 한다. -->
               <button type="button" class="btn btn-secondary"
                  onclick="location.href='adBoardEdit.jsp?num=<%=dto.getNum()%>&bname=<%=bname %>';">
                  수정하기</button> 
               <!-- 회원제게시판에서 삭제처리는 별도의 폼이 필요없이, 사용자에 대한
               인증처리만 되면 즉시 삭제처리한다. -->
               <button type="button" class="btn btn-success"
                  onclick="location.href='adDeleteProc.jsp?num=<%=dto.getNum()%>&bname=<%=bname %>';">삭제하기</button>
            <%
            }
            %>
            </div>
            <div class="col-6 text-right pr-5">
               <button type="button" class="btn btn-warning" onclick="location.href='adBoardList.jsp?<%=queryStr%>';">리스트보기</button>
            </div>
         </div>
         <!--
         게시물삭제의 경우 로그인 된 상태이므로 해당 게시물의 일련번호만 
     서버로 전송하면 된다. 이떄 hidden폼을 사용하고, JS의 submit()
     함수를 이용해서 폼값을 전송한다. 해당 form태그는 HTML문서 어디든 
     위치할 수 있다.
           -->
          <form name="deleteFrm">
			<input type="hidden" name="num" value="<%=dto.getNum() %>" />            
			<input type="hidden" name="bname" value="<%=bname %>" />            
          </form>
         <script>
            function isDelete() {
            	var c = confirm("삭제할까요?");
            	if(c){
            		var f = document.deleteFrm;
            		f.method ="post";
            		f.action = "adDeleteProc.jsp";
            		f.submit();
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
