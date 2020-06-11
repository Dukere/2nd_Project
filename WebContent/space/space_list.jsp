<%@page import="util.PagingUtil"%>
<%@page import="model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp"%>
<style>
	td{
	overflow:hidden; text-overflow:ellipsis; white-space:nowrap;
	}
</style>
<%@ include file="../common/isFlag.jsp"%>

<%
	BoardDAO dao = new BoardDAO(application);

	Map<String, Object> param = new HashMap<String, Object>();

	param.put("bname", bname);

	String queryStr = ""; // 검색시 페이지번호로 쿼리스트링을 넘겨주기 위한 용도

	queryStr = "bname=" + bname + "&";

	String serachColumn = request.getParameter("searchColumn");
	String searchWord = request.getParameter("searchWord");
	if (searchWord != null) {
		param.put("Column", serachColumn);
		param.put("Word", searchWord);

		queryStr = "searchColumn=" + serachColumn + "&searchWord=" + searchWord + "&";

	}
	int totalRecordCount = dao.getTotalRecordConunt(param);

	int pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
	int blockPage = Integer.parseInt(application.getInitParameter("BLOCK_PAGE"));

	int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);

	int nowPage = (request.getParameter("nowPage") == null || request.getParameter("nowPage").equals("")) ? 1
			: Integer.parseInt(request.getParameter("nowPage"));

	int start = (nowPage - 1) * pageSize; //(1-1)x2 +1 하면안됨  +1을 지워준다  
	int end = pageSize;

	param.put("start", start);
	param.put("end", end);
	List<BoardDTO> bbs = dao.selectListPage(param);

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

						<div class="row text-right"
							style="margin-bottom: 20px; padding-right: 50px;">
							<!-- 검색부분 -->
							<form class="form-inline">
								<div class="form-group">
									<select name="searchColumn" class="form-control">
										<option value="title">제목</option>
										<option value="id">작성자</option>
										<option value="content">내용</option>
									</select>
								</div>
								<div class="input-group">
									<input type="text" name="searchWord" class="form-control" />
									<div class="input-group-btn">
										<button type="submit" class="btn btn-default">
											<i class="glyphicon glyphicon-search"></i>
										</button>
									</div>
								</div>
							</form>
						</div>
						<div class="row">
							<%
								if (bname.equals("pic")) {
							%>
							<%@ include file="space_photo.jsp"%> 
							<%
								} else if (bname.equals("program")) {
							%>
							<%
								} else {
							%>
							<!-- 게시판리스트부분 -->
							<table class="table table-bordered table-hover" style=TABLE-layout:fixed>
								<colgroup>
									<col width="80px" />
									<col width="*" /> 
									<col width="120px" />
									<col width="100px" />
									<col width="60px" />
									<%
										if (bname.equals("info")) {
									%>
									<col width="50px" />
									<%
										}
									%>
								</colgroup>

								<thead>
									<tr class="success">
										<th class="text-center">번호</th>
										<th class="text-left">제목</th>
										<th class="text-center">작성자</th>
										<th class="text-center">작성일</th>
										<th class="text-center">조회수</th>
										<%
											if (bname.equals("info")) {
										%>
										<th class="text-center">첨부</th>
										<%
											}
										%>
									</tr>
								</thead>

								<tbody>
									<!-- 리스트반복 -->
									<%
										//List컬렉션에 입력된 데이터가 없을떄 true를 반환
											if (bbs.isEmpty()) {
												if (bname.equals("info")) {
									%>
									<tr>
										<td colspan="6" align="center" height="100">등록된 게시물이
											없습니다.</td>
									</tr>

									<%
										} else {
									%>
									<tr>
										<td colspan="5" align="center" height="100">등록된 게시물이
											없습니다.</td>
									</tr>
									<%
										}
											} else {
												//게시물의 가상번호로 사용할 변수
												int vNum = 0;
												int countNum = 0;

												/*
												컬렉션에 입력된 데이터가 있다면 저장된 BbsDTO의 객수만큼
												즉, DB가 반환해준 레코드의 갯수만큼 반복하면서 출력한다.
												*/
												for (BoardDTO dto : bbs) {
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
										<td class="text-center"><%=vNum%></td>
										<td class="text-left" style="text-overflow : ellipsis;overflow : hidden;"><a
											href="space_view.jsp?num=<%=dto.getNum()%>&nowPage=<%=nowPage%>&<%=queryStr%>">
												<%=dto.getTitle()%>
										</a></td>
										<td class="text-center"><%=dto.getId()%></td>
										<td class="text-center"><%=dto.getPostdate()%></td>
										<td class="text-center"><%=dto.getVisitcount()%></td>
										<%
											if (bname.equals("info")) {
												if(dto.getOfile()!=null){
										%>
										<td class="text-center"><a
											href="downloadProc.jsp?oname=<%=URLEncoder.encode(dto.getOfile(), "UTF-8")%>&sname=<%=URLEncoder.encode(dto.getSfile(), "UTF-8")%>"><img
												src="../images/disk.png" width="20" alt="" /></a></td>
										<%
												}
											}
										%>

									</tr>
									<!-- 리스트반복 end-->
									<%
										}
											}
									%>
								</tbody>
							</table>
							<%
								}
							%>
						</div>
						<div class="row text-right" style="padding-right: 50px;">
							<!-- 각종 버튼 부분 -->
							<!-- <button type="reset" class="btn">Reset</button> -->
							<%
								if (!bname.equals("notice")) {
							%>
							<button type="button" class="btn btn-default"
								onclick="location.href='space_write.jsp?bname=<%=bname%>';">글쓰기</button>
							<%
								}
							%>
							<!-- <button type="button" class="btn btn-primary">수정하기</button>
							<button type="button" class="btn btn-success">삭제하기</button>
							<button type="button" class="btn btn-info">답글쓰기</button>
							<button type="button" class="btn btn-warning">리스트보기</button>
							<button type="submit" class="btn btn-danger">전송하기</button> -->
						</div>
						<div class="row text-center">
							<!-- 페이지번호 부분 -->
							<ul class="pagination">
								<%=PagingUtil.pagingBS4(totalRecordCount, pageSize, blockPage, nowPage, "space_list.jsp?" + queryStr)%>

								<!-- <li><span class="glyphicon glyphicon-fast-backward"></span></li>
		<li><a href="#">1</a></li>		
		<li class="active"><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>		
		<li><a href="#">5</a></li>
		<li><span class="glyphicon glyphicon-fast-forward"></span></li> -->
							</ul>
						</div>

					</div>
				</div>
			</div>
			<%@ include file="../include/quick.jsp"%>
		</div>


		<%@ include file="../include/footer.jsp"%>
	</center>
</body>
</html>