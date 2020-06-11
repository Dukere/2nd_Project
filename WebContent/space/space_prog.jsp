<%@page import="java.net.URLEncoder"%>
<%@page import="util.PagingUtil"%>
<%@page import="model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp"%>

<%@ include file="../common/isFlag.jsp"%>

<%
request.setCharacterEncoding("UTF-8");

BoardDAO dao = new BoardDAO(application);

String queryStr = ""; // 검색시 페이지번호로 쿼리스트링을 넘겨주기 위한 용도

queryStr = "bname=" + bname + "&";

dao.close(); 
%>

<body>
	<center>
		<div id="wrap">
			<%@ include file="../include/top.jsp"%>

			<img src="../images/space/sub_image.jpg" id="main_visual" />

			<div class="contents_box">
				<div class="left_contents">
					<%@ include file="../include/space_leftmenu.jsp"%>
				</div>
				<div class="right_contents">
					<div class="top_title">

						<p>
							<img src="../images/space/sub02_title.gif" alt="프로그램일정"
								class="con_title" />
						<p class="location">
							<img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;프로그램일정

						
					</div>
					<div>
						<div class="row">

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

							<style TYPE="text/css">
body {
	scrollbar-face-color: #F6F6F6;
	scrollbar-highlight-color: #bbbbbb;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #bbbbbb;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #bbbbbb;
	margin-left: "0px";
	margin-right: "0px";
	margin-top: "0px";
	margin-bottom: "0px";
}

td {
	font-family: "돋움";
	font-size: 9pt;
	color: #595959;
}

th {
	font-family: "돋움";
	font-size: 9pt;
	color: #000000;
}

select {
	font-family: "돋움";
	font-size: 9pt;
	color: #595959;
}

.divDotText {
	overflow: hidden;
	text-overflow: ellipsis;
}

A:link {
	font-size: 9pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

A:visited {
	font-size: 9pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

A:active {
	font-size: 9pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}

A:hover {
	font-size: 9pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}
</style>
							<script src="../common/jquery/jquery-3.5.1.js"></script>
							<form name="calendarFrm" id="calendarFrm" action="" method="post">

								<DIV id="content" style="width: 775px;">

									<table width="100%" border="0" cellspacing="1" cellpadding="1">

										<tr>

											<td align="right"><input type="button"
												onclick="javascript:location.href='<c:url value='/CalendarExam2.jsp' />'"
												value="오늘" /></td>



										</tr>

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
															href="<c:url value='space_prog.jsp' />?bname=<%=bname%>&year=<%=year - 1%>&amp;month=<%=month%>"
															target="_self"> <b>&lt;&lt;</b> <!-- 이전해 -->

														</a> <%
 	if (month > 0) {
 %> <a
															href="<c:url value='space_prog.jsp' />?bname=<%=bname%>&year=<%=year%>&amp;month=<%=month - 1%>"
															target="_self"> <b>&lt;</b> <!-- 이전달 -->

														</a> <%
 	} else {
 %> <b|#3#|>&lt;</b> <%
 	}
 %> &nbsp;&nbsp; <%=year%>년 <%=month + 1%>월</span> &nbsp;&nbsp;
															<%
																if (month < 11) {
															%> <a
															href="<c:url value='space_prog.jsp' />?bname=<%=bname%>&year=<%=year%>&amp;month=<%=month + 1%>"
															target="_self"> <!-- 다음달 --> <b>&gt;</b>

														</a> <%
 	} else {
 %> <b|#3#|>&gt;</b> <%
 	}
 %> <a
															href="<c:url value='space_prog.jsp' />?bname=<%=bname%>&year=<%=year + 1%>&amp;month=<%=month%>"
															target="_self"> <!-- 다음해 --> <b>&gt;&gt;</b>

														</a></td>

													</tr>

												</table>



											</td>

										</tr>

									</table>

									<br>

									<table border="0" cellspacing="1" cellpadding="1"
										bgcolor="#FFFFFF">

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
																out.println("<a href='space_view.jsp?num=" + dto.getNum() + "&" + queryStr + "' >"
																		+ dto.getTitle() + "</a>");
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

								</DIV>

							</form>
						</div>
						<div class="row text-right" style="padding-right: 50px;"></div>
						<div class="row text-center"></div>

					</div>
				</div>
			</div>
			<%@ include file="../include/quick.jsp"%>
		</div>


		<%@ include file="../include/footer.jsp"%>
	</center>
</body>
</html>