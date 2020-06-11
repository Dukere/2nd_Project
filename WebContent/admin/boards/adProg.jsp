<!DOCTYPE html>
<%@page import="util.PagingUtil"%>
<%@page import="model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="adIsFlag.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");

	BoardDAO dao = new BoardDAO(application);

	String queryStr = ""; // 검색시 페이지번호로 쿼리스트링을 넘겨주기 위한 용도

	queryStr = "bname=" + bname + "&";

	dao.close(); 
%>

<head>


<%@ include file="../include/adminHead.jsp"%>
<title><%=boardTitle%></title> 
<style>
.txt-overflow{
word-wrap:normal
}
</style>

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
						<h3><%=boardTitle%></h3>

						<%@page import="java.text.SimpleDateFormat"%>

							<%@page import="java.util.Calendar"%>

							<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

							<%
								Calendar cal = Calendar.getInstance();

								String strYear = request.getParameter("year");

								String strMonth = request.getParameter("month");

								int year = cal.get(Calendar.YEAR);

								int month = cal.get(Calendar.MONTH);

								int date = cal.get(Calendar.DATE);

								if (strYear != null)

								{

									year = Integer.parseInt(strYear);

									month = Integer.parseInt(strMonth);

								} else {

								}

								//년도/월 셋팅

								cal.set(year, month, 1);

								int startDayDay = cal.getMinimum(java.util.Calendar.DATE);

								int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);

								int startDay = cal.get(java.util.Calendar.DAY_OF_WEEK);

								int newLine = 0;

								//오늘 날짜 저장.

								Calendar todayCal = Calendar.getInstance();

								SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");

								int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
							%>

							<script src="../common/jquery/jquery-3.5.1.js"></script>
							<form name="calendarFrm" id="calendarFrm" action="" method="post">

								<DIV id="content" style="width: 775px;"> 
  
									<table width="100%" border="0" cellspacing="1" cellpadding="1">

									</table>

									<!--날짜 네비게이션  -->

									<table width="100%" border="0" cellspacing="1" cellpadding="1"
										id="KOO" bgcolor="#F3F9D7" style="border: 1px solid #CED99C">



										<tr>

											<td height="60">



												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">

													<tr>

														<td height="10"></td>

													</tr>



													<tr>

														<td align="center"><a
															href="<c:url value='adProg.jsp' />?bname=<%=bname %>&year=<%=year - 1%>&amp;month=<%=month%>"
															target="_self"> <b>&lt;&lt;</b>
															<!-- 이전해 -->

														</a> <%
															 	if (month > 0) {
															 %> <a
															href="<c:url value='adProg.jsp' />?bname=<%=bname %>&year=<%=year%>&amp;month=<%=month - 1%>"
															target="_self"> <b>&lt;</b>
															<!-- 이전달 -->

														</a> <% 
															 	} else {
															 %> <b|#3#|>&lt;</b> <%
															 	}
															 %> &nbsp;&nbsp; <%=year%>년



															<%=month + 1%>월</span> &nbsp;&nbsp; <%
															 	if (month < 11) {
															 %> <a
															href="<c:url value='adProg.jsp' />?bname=<%=bname %>&year=<%=year%>&amp;month=<%=month + 1%>"
															target="_self"> <!-- 다음달 -->
																<b>&gt;</b>

														</a> <%
															 	} else {
															 %> <b|#3#|>&gt;</b> <%
															 	}
															 %> <a
															href="<c:url value='adProg.jsp' />?bname=<%=bname %>&year=<%=year + 1%>&amp;month=<%=month%>"
															target="_self"> <!-- 다음해 -->
																<b>&gt;&gt;</b>

														</a></td>

													</tr>

												</table>



											</td>

										</tr>

									</table>

									<br>

									<table border="0" cellspacing="1" cellpadding="1"
										bgcolor="#FFFFFF" >

										<THEAD>

											<TR bgcolor="#CECECE">

												<TD width='130px'>

													<DIV align="center">
														<font color="red">일</font>
													</DIV>

												</TD>

												<TD width='130px'>

													<DIV align="center">월</DIV>

												</TD>

												<TD width='130px'>

													<DIV align="center">화</DIV>

												</TD>

												<TD width='130px'>

													<DIV align="center">수</DIV>

												</TD>

												<TD width='130px'>

													<DIV align="center">목</DIV>

												</TD>

												<TD width='130px'>

													<DIV align="center">금</DIV>

												</TD>
 
												<TD width='130px'>

													<DIV align="center">
														<font color="#529dbc">토</font>
													</DIV>

												</TD>

											</TR>

										</THEAD>

										<TBODY>

											<TR>

												<%
													//처음 빈공란 표시

													for (int index = 1; index < startDay; index++)

													{

														out.println("<TD>&nbsp;</TD>");

														newLine++;

													}

													for (int index = 1; index <= endDay; index++)

													{

														String color = "";

														if (newLine == 0) {
															color = "RED";

														} else if (newLine == 6) {
															color = "#529dbc";

														} else {
															color = "BLACK";
														}
														;

														String sUseDate = Integer.toString(year);

														sUseDate += Integer.toString(month + 1).length() == 1 ? "0" + Integer.toString(month + 1)
																: Integer.toString(month + 1);
														
														sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index)
																: Integer.toString(index);

														int iUseDate = Integer.parseInt(sUseDate);

														String backColor = "#EFEFEF";

														if (iUseDate == intToday) {

															backColor = "#c9c9c9";

														}

														out.println("<TD valign='top' align='left'height='92px' bgcolor='" + backColor + "' nowrap>");
												%>

												<font color='<%=color%>'> <%=index%>

												</font>

												<%
												
														List<BoardDTO> bbs = dao.progSelect(sUseDate);
														if (bbs.isEmpty()) {
															out.println("<BR>");
												%> 
												<%
															out.println("<BR>");
														} else {
															for (BoardDTO dto : bbs) {
																out.println("<BR>"); 
																out.println("<span>");
																out.println("<a href='adBoardView.jsp?num="+dto.getNum()+"&"+queryStr+"' >"+dto.getTitle()+"</a>");
																out.println("</span>");
															}
														}

														out.println("</TD>"); 

														newLine++;

														if (newLine == 7)

														{

															out.println("</TR>");

															if (index <= endDay)

															{

																out.println("<TR>");

															}

															newLine = 0;

														}

													}

													//마지막 공란 LOOP

													while (newLine > 0 && newLine < 7)

													{

														out.println("<TD>&nbsp;</TD>");

														newLine++;

													}
												%>

											</TR>



										</TBODY>
									</TABLE>
									<div class="row">
											<div class="col text-right">
												<button type="button" class="btn btn-primary"
													onclick="location.href='adBoardWrite.jsp?bname=<%=bname%>';">글쓰기</button>
											</div>
									</div> 
]								</DIV>
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
