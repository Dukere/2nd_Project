<%@page import="java.net.URLEncoder"%>
<%@page import="model.BoardDTO"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../common/isFlag.jsp"%>
<%@ include file="../common/isLogin.jsp"%>

<%
	String id = session.getAttribute("user_id").toString();
%>

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
										<td>${dto.name }</td>
										<th class="text-center" style="vertical-align: middle;">작성일</th>
										<td>${dto.postdate }</td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align: middle;">이메일</th>
										<td>${dto.email }</td>
										<th class="text-center" style="vertical-align: middle;">조회수</th>
										<td>${dto.visitcount }</td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align: middle;">제목</th>
										<td colspan="3">${dto.title }</td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align: middle;">내용</th>
										<td colspan="3" class="align-middle" style="height: 200px;">
											${dto.content } 
										</td>
									</tr>
									<tr>
										<th class="text-center" style="vertical-align: middle;">첨부파일</th>
										<td colspan="3">
										<c:if test="${not empty dto.ofile }">
					                        ${dto.ofile }
					                        <a href="./Download?sfile=${dto.sfile }&ofile=${dto.ofile }&num=${dto.num}">
					                           [다운로드]
					                        </a>
					                     </c:if>
										</td>
									</tr>
								</tbody>
							</table>

							<div class="row text-center" style="">
								<c:set var="id" value='<%=session.getAttribute("user_id").toString() %>' />
								<c:if test="${dto.id eq id}">
								<button type="button" class="btn btn-primary" onclick="location.href='../community/ComEdit?bname=<%=bname%>&num=${dto.num }';">수정하기</button>
								<button type="button" class="btn btn-success"
									data-toggle="modal" data-target="#deleteModal"
									onclick="">삭제하기</button>
								</c:if>
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
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">삭제 하기</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        	<div id="result" class="modal-body"> 삭제하시겠습니까?</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
          <a class="btn btn-primary" href="ComDelete?bname=<%=bname %>&num=${dto.num }">삭제</a>
        </div>
      </div>
    </div>
 	</div>
</html>