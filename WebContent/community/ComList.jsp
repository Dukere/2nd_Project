<%@page import="java.net.URLEncoder"%>
<%@page import="util.PagingUtil"%>
<%@page import="model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BoardDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp"%>
<style>
	td{
	overflow:hidden; text-overflow:ellipsis; white-space:nowrap;
	}
</style>
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

						<div class="row text-right"
							style="margin-bottom: 20px; padding-right: 50px;">
							<!-- 검색부분 -->
							<form class="form-inline">
							<input type="hidden" name="bname" value="<%=bname %>" />
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
							<!-- 게시판리스트부분 -->
							<table class="table table-bordered table-hover" style=TABLE-layout:fixed>
								<colgroup>
									<col width="80px" />
									<col width="*" /> 
									<col width="120px" />
									<col width="100px" />
									<col width="60px" />
									<col width="50px" />
								</colgroup>

								<thead>
									<tr class="success">
										<th class="text-center">번호</th>
										<th class="text-left">제목</th>
										<th class="text-center">작성자</th>
										<th class="text-center">작성일</th>
										<th class="text-center">조회수</th>
										<th class="text-center">첨부</th>
									</tr>
								</thead>

								<tbody>
									<c:choose>
										<c:when test="${empty lists }">
											<tr>
												<td colspan="6" align="center" height="100">등록된 게시물이
													없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${lists }" var="row" varStatus="loop"> 
												<tr>
													<td class="text-center">
													${map.totalCount - (((map.nowPage - 1) * map.pageSize) + loop.index) }
													</td>
													<td class="text-left" style="text-overflow : ellipsis;overflow : hidden;"><a
														href="../community/ComView?num=${row.num }&nowPage=${map.nowPage }&${map.queryStr }">
														${row.title } </a> 
													</td>
													<td class="text-center">${row.id }</td> 
													<td class="text-center">${row.postdate }</td>
													<td class="text-center">${row.visitcount }</td>
													<td class="text-center">
														<c:if test="${not empty row.sfile }">
															<a href="./Download?sfile=${row.sfile }&ofile=${row.ofile }&num=${row.num }">
																<img src="../images/disk.png" width="20" />
															</a>
														</c:if>
													</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
						<div class="row text-right" style="padding-right: 50px;">
							<!-- 각종 버튼 부분 -->
							<!-- <button type="reset" class="btn">Reset</button> -->
							<%
							if(session.getAttribute("user_id")!=null){
								if (!(bname.equals("emp")&&session.getAttribute("user_auth").toString().equals("normal"))) {
							%>
							<button type="button" class="btn btn-default"
								onclick="location.href='../community/ComWrite?bname=<%=bname%>';">글쓰기</button>
							<%
								}
							}
							%>
						</div>
						<div class="row text-center">
							<!-- 페이지번호 부분 -->
							<ul class="pagination">
								${map.pagingImg }
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