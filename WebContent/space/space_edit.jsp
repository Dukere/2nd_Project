<%@page import="model.BoardDTO"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp"%>


<%@ include file="../common/isLogin.jsp"%>

<%@ include file="../common/isFlag.jsp"%>

<%
	//폼값받기  - 파라미터로 전달된 게시물의 일련번호
	String num = request.getParameter("num");

	String queryStr = request.getParameter("queryStr");
	BoardDAO dao = new BoardDAO(application);

	String id = session.getAttribute("user_id").toString();
	//게시물을 가져와서 DTO객체로 변환
	BoardDTO dto = dao.selectView(num); 

	if(!id.equals(dto.getId())){
		%>
		<script>
		alert("본인의 글만 수정할 수 있습니다.");
		history.go(-1);
		</script>
		<%
	}
	
	dao.close();
%>

<body>
	<div id="wrap">
		<%@ include file="../include/top.jsp"%>

		<img src="../images/space/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<%@ include file="../include/space_leftmenu.jsp"%>
			</div>
			<div class="right_contents">
				<div class="top_title">
				<% switch(bname){
					case "notice":					
				%>
					<img src="../images/space/sub01_title.gif" alt="공지사항" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;공지사항<p>
				<%
					break;
					case "program":
				%>
					<img src="../images/space/sub02_title.gif" alt="프로그램일정" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;프로그램일정<p>
				<%
					break;
					case "free":
				%>
					<img src="../images/space/sub03_title.gif" alt="자유게시판" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;자유게시판<p>
				
				<%
					break;
					case "pic":
				%>
					<img src="../images/space/sub04_title.gif" alt="사진게시판" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;사진게시판<p>
				<%
					break;
					case "info":
				%>
					<img src="../images/space/sub05_title.gif" alt="정보자료실" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;정보자료실<p>
				<%
					break;
				}
				%>
				</div>
				<div>
					<%
						if (bname.equals("info")) {
					%>
					<form name="writeFrm" method="post" action="FileEditProc.jsp"
						onsubmit="return checkValidate(this);"
						enctype="multipart/form-data">
					<%
						} else {
					%>
					<form name="writeFrm" method="post" action="EditProc.jsp"
						onsubmit="return checkValidate(this);">
					<%
						}
					%>
					<input type="hidden" name="bname" value="<%=bname %>" />
					<input type="hidden" name="num" value="<%=dto.getNum()%>" />
						<table class="table table-bordered">
							<colgroup>
								<col width="20%" />
								<col width="*" /> 
							</colgroup>
							<tbody>
								<tr>
									<th class="text-center" style="vertical-align: middle;">제목</th>
									<td><input type="text" name="title" class="form-control" value="<%=dto.getTitle()%>" />
									</td>
								</tr>
								<tr>
									<th class="text-center" style="vertical-align: middle;">내용</th>
									<td><textarea rows="10" name="content"
											class="form-control"><%=dto.getContent()%></textarea></td>
								</tr>
								<%
									if (bname.equals("info")) {
										if(dto.getOfile()!=null)  {
										%>
								<tr>
											<th class="text-center" style="vertical-align: middle;">기존파일</th>
											<td><%=dto.getOfile() %></td>
										</tr>
									<% } %>
								<tr>
									<th class="text-center" style="vertical-align: middle;">첨부파일</th>
									<td><input type="file" name="file" class="form-control" />
									</td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
	
						<div class="row text-center" style="">
							<!-- 각종 버튼 부분 -->
	
							<button type="submit" class="btn btn-danger">전송하기</button>
							<button type="reset" class="btn">Reset</button>
							<button type="button" class="btn btn-warning"
								onclick="location.href='space_list.jsp';">리스트보기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<%@ include file="../include/quick.jsp"%>
	</div>


	<%@ include file="../include/footer.jsp"%>
</body>
</html>