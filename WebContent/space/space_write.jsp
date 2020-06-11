<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp"%>


<%@ include file="../common/isLogin.jsp"%>

<%@ include file="../common/isFlag.jsp"%>

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
						if (bname.equals("info") || bname.equals("pic"))  {
					%>
					<form name="writeFrm" method="post" action="FileProc.jsp"
						onsubmit="return checkValidate(this);"
						enctype="multipart/form-data">
					<%
						} else {
					%>
					<form name="writeFrm" method="post" action="WriteProc.jsp"
						onsubmit="return checkValidate(this);">
					<%
						}
					%>
					<input type="hidden" name="bname" value="<%=bname %>" />
						<table class="table table-bordered">
							<colgroup>
								<col width="20%" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th class="text-center" style="vertical-align: middle;">제목</th>
									<td><input type="text" name="title" class="form-control" />
									</td>
								</tr>
								<tr>
									<th class="text-center" style="vertical-align: middle;">내용</th>
									<td><textarea rows="10" name="content"
											class="form-control"></textarea></td>
								</tr>
								<%
									if (bname.equals("info") || bname.equals("pic")) {
								%>
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
	</center>
</body>
</html>