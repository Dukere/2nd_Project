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
				<%@ include file="../include/community_leftmenu.jsp"%>
			</div> 
			<div class="right_contents">
				<div class="top_title">
						<%
							switch (bname) {
							case "emp":
						%>
						<img src="../images/community/sub01_title.gif" alt="직원자료실" class="con_title" />
						<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;커뮤니티&nbsp;>&nbsp;직원자료실<p>
							<%
								break;
								case "guard":
							%>
						<img src="../images/community/sub02_title.gif" alt="보호자 게시판" class="con_title" />
						<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;커뮤니티&nbsp;>&nbsp;보호자 게시판<p>
							<%
								break;
								}
							%>
				</div>
				<div>
					<form name="writeFrm" method="post" action="../community/ComWrite"
						onsubmit="return checkValidate(this);"
						enctype="multipart/form-data">
					<input type="hidden" name="bname" value="<%=bname %>" />
					<input type="hidden" name="id" value="<%=session.getAttribute("user_id").toString() %>" />
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
								<tr>
									<th class="text-center" style="vertical-align: middle;">첨부파일</th>
									<td><input type="file" name="file" class="form-control" />
									</td>
								</tr>
							</tbody>
						</table>
	
						<div class="row text-center" style="">
							<!-- 각종 버튼 부분 -->
	
							<button type="submit" class="btn btn-danger">전송하기</button>
							<button type="reset" class="btn">Reset</button>
							<button type="button" class="btn btn-warning"
								onclick="location.href='./ComList';">리스트보기</button>
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