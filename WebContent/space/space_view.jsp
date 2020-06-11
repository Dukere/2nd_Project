<%@page import="java.net.URLEncoder"%>
<%@page import="model.BoardDTO"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp"%>

<%@ include file="../common/isFlag.jsp"%>
<%@ include file="../common/isLogin.jsp"%>

<%
	String queryStr = "bname=" + bname + "&";
	String searchColumn = request.getParameter("searchColumn");
	String searchWord = request.getParameter("searchWord");
	if (searchWord != null) {
		queryStr += "searchColumn=" + searchColumn + "&searchWord=" + searchWord + "&";
	}
	//3페이지에서 상세보기 했다면 리스트로 돌아갈때도 3페이지로 가야한다.
	String nowPage = request.getParameter("nowPage");
	if (nowPage == null || nowPage.equals(""))
		nowPage = "1";
	queryStr += "&nowPage=" + nowPage;

	//폼값 받기 - 파라미터로 전달된 게시물의 일련번호
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO(application); 

	String id = session.getAttribute("user_id").toString();

	//게시물의 조회수 +1증가
	dao.updateVisitCount(num);

	//게시물을 가져와서 DTO객체로 반환
	BoardDTO dto = dao.selectView(num);

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
						<%
							switch (bname) {
							case "notice":
						%>
						<img src="../images/space/sub01_title.gif" alt="공지사항"
							class="con_title" />
						<p class="location">
							<img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;공지사항
						<p>
							<%
								break;
								case "program":
							%>
							<img src="../images/space/sub02_title.gif" alt="프로그램일정"
								class="con_title" />
						<p class="location">
							<img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;프로그램일정
						<p>
							<%
								break;
								case "free":
							%>
							<img src="../images/space/sub03_title.gif" alt="자유게시판"
								class="con_title" />
						<p class="location">
							<img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;자유게시판
						<p>

							<%
								break;
								case "pic":
							%>
							<img src="../images/space/sub04_title.gif" alt="사진게시판"
								class="con_title" />
						<p class="location">
							<img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;사진게시판
						<p>
							<%
								break;
								case "info":
							%>
							<img src="../images/space/sub05_title.gif" alt="정보자료실"
								class="con_title" />
						<p class="location">
							<img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;정보자료실
						<p>
							<%
								break;
								}
							%>
						
					</div>
					<div>

						<form enctype="multipart/form-data">
							<table class="table table-bordered">
								<colgroup>
									<col width="20%" />
									<col width="30%" />
									<col width="20%" />
									<col width="*" />
								</colgroup>
								<tbody>
									<tr>
										<th class="text-center" style="vertical-align: middle;">작성자</th>
										<td><%=dto.getName()%></td>
										<th class="text-center" style="vertical-align: middle;">작성일</th>
										<td><%=dto.getPostdate()%></td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align: middle;">이메일</th>
										<td><%=dto.getEmail()%></td>
										<th class="text-center" style="vertical-align: middle;">조회수</th>
										<td><%=dto.getVisitcount()%></td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align: middle;">제목</th>
										<td colspan="3"><%=dto.getTitle()%>.</td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align: middle;">내용</th>
										<td colspan="3" class="align-middle" style="height: 200px;">
											<%=dto.getContent().replace("\r\n", "<br>")%>
										</td>
									</tr>
									<%
										if (bname.equals("info")) {
									%>
									<tr>
										<th class="text-center" style="vertical-align: middle;">첨부파일</th>
										<td colspan="3"><a
											href="downloadProc.jsp?oname=<%=URLEncoder.encode(dto.getOfile(), "UTF-8")%>&sname=<%=URLEncoder.encode(dto.getSfile(), "UTF-8")%>"><%=dto.getOfile()%></a>
										</td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>

							<div class="row text-center" style="">
								<!-- 각종 버튼 부분 -->
								<%
									if (id.equals(dto.getId())) {
								%>
								<button type="button" class="btn btn-primary"
									onclick="location.href='space_edit.jsp?<%=queryStr%>';">수정하기</button>
								<button type="button" class="btn btn-success"
									onclick="location.href='DeleteProc.jsp?<%=queryStr%>';">삭제하기</button>
								<%
									}
								%>
								<button type="button" class="btn btn-warning"
									onclick="location.href='space_list.jsp?<%=queryStr%>';">리스트보기</button>
							</div>
						</form>

					</div>
				</div>
			</div>
			<%@ include file="../include/quick.jsp"%>
		</div>


		<%@ include file="../include/footer.jsp"%>
	</center>
</body>
</html>