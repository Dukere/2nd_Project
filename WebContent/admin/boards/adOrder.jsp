<!DOCTYPE html>
<%@page import="model.OrderDTO"%>
<%@page import="model.OrderDAO"%>
<%@page import="model.ExpDTO"%>
<%@page import="model.blueDTO"%>
<%@page import="model.requestDAO"%>
<%@page import="util.PagingUtil"%>
<%@page import="model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("UTF-8");

	String uri = request.getRequestURI();

	String bname = request.getParameter("bname");

	OrderDAO dao = new OrderDAO(application);
 
	Map<String, Object> param = new HashMap<String, Object>();

	int totalRecordCount = dao.getTotalRecordCountOrder();

	int pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
	int blockPage = Integer.parseInt(application.getInitParameter("BLOCK_PAGE"));

	int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);

	int nowPage = (request.getParameter("nowPage") == null || request.getParameter("nowPage").equals("")) ? 1
			: Integer.parseInt(request.getParameter("nowPage"));

	int start = (nowPage - 1) * pageSize; //(1-1)x2 +1 하면안됨  +1을 지워준다  
	int end = pageSize;

	param.put("start", start); 
	param.put("end", end);
	List<OrderDTO> bbs = dao.selectListPageOrder(param);

	dao.close();
%>

<head>
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
<style>
td{
width:70px; padding:0 5px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;

}
</style>

<%@ include file="../include/adminHead.jsp"%>
<title>주문관리</title>


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
						<h3>주문관리</h3>
						<div class="row mt-3">
							<!-- 게시판리스트부분 -->
							<table class="table table-bordered table-hover table-striped"  style="TABLE-layout:fixed" >
								<colgroup>
									<col width="80px" />
									<col width="80px" />
									<col width="80px" />
									<col width="100px" />
									<col width="100px" />
									<col width="80px" />
								</colgroup>
								<thead>
									<tr style="background-color: rgb(133, 133, 133);"
										class="text-center text-white">
										<th width="10%">번호</th>
										<th width="20%">아이디</th>
										<th width="20%">이름</th>
										<th width="20%">핸드폰번호</th>
										<th width="20%">이메일</th>
										<th width="10%">삭제</th>
									</tr>
								</thead>
								<tbody>
									<%
										//List컬렉션에 입력된 데이터가 없을떄 true를 반환
											if (bbs.isEmpty()) {
									%>
									<tr>
										<td colspan="6" align="center" height="100">등록된 신청이
											없습니다.</td>
									</tr>

									<%
										} else {
												//게시물의 가상번호로 사용할 변수
												int vNum = 0;
												int countNum = 0;

												/*
												컬렉션에 입력된 데이터가 있다면 저장된 BbsDTO의 객수만큼
												즉, DB가 반환해준 레코드의 갯수만큼 반복하면서 출력한다.
												*/
												for (OrderDTO dto : bbs) {
													vNum = totalRecordCount - (((nowPage - 1) * pageSize) + countNum++);

													/* 
													전체 게시물수 : 107개 
													페이지사이즈: 10
													
													현제페이지 1
														첫번쨰 게시물 : 107 - (((1-1)*10)+0)= 107
														두번쨰 게시물 : 107 - (((1-1)*10)+1)= 106
													현제페이지 2
														첫번쨰 게시물 : 107 - (((2-1)*10)+0)= 97
														두번쨰 게시물 : 107 - (((2-1)*10)+1)= 96
													*/
									%>
									<!-- 리스트반복 start-->
									<tr> 
										<td class="text-center"><a
											href="adOrderView.jsp?num=<%=dto.getNum()%>" ><%=vNum%></a></td>
										<td class="text-left" >
												<%=dto.getId()%>
										</td>
										<td class="text-center"><%=dto.getOname()%></td>
										<td class="text-center"><%=dto.getOmobile()%></td>
										<td class="text-center"><%=dto.getOemail()%></td>
										<td class="text-center"><button type="button"
												class="btn btn-danger"
												onclick="return isDelete();">삭제</button></td>
 
									</tr>
									<!-- 리스트반복 end-->
									<%
										}
											}
									%>

								</tbody>
							</table>
						</div>
						<div class="row mt-3">
							<div class="col">
								<!-- 페이지번호 부분 -->
								<ul class="pagination justify-content-center">
									<%=PagingUtil.pagingBS4(totalRecordCount, pageSize, blockPage, nowPage,
					"adOrder.jsp")%>
									<!-- <li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-double-left"></i></a></li>
							<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-left"></i></a></li>
							
							<li class="page-item"><a href="#" class="page-link">1</a></li>		
							<li class="page-item active"><a href="#" class="page-link">2</a></li>
							<li class="page-item"><a href="#" class="page-link">3</a></li>
							<li class="page-item"><a href="#" class="page-link">4</a></li>		
							<li class="page-item"><a href="#" class="page-link">5</a></li>
							
							<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-right"></i></a></li>
							<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-double-right"></i></a></li> -->
								</ul>
							</div>
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
						<h5 class="modal-title" id="exampleModalLabel">정말 로그아웃하시겠습니까?</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">'로그 아웃'을 누르면 로그 아웃이 됩니다.</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">취소</button>
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
