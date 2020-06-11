<%@page import="util.PagingUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.ProductDAO"%>
<%@page import="model.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>

<%
	ProductDAO dao = new ProductDAO(application);

	Map<String, Object> param = new HashMap<String, Object>();

	int totalRecordCount = dao.getTotalRecordCount();
	
	int pageSize = 5;
	int blockPage = 5;
	
	int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
	
	int nowPage = (request.getParameter("nowPage") == null || request.getParameter("nowPage").equals("")) ? 1
			: Integer.parseInt(request.getParameter("nowPage"));
	
	int start = (nowPage - 1) * pageSize; //(1-1)x2 +1 하면안됨  +1을 지워준다  
	int end = pageSize;
	
	param.put("start", start);
	param.put("end", end);
	List<ProductDTO> bbs = dao.selectListPage(param);
	 
	dao.close();

%>
 <body>
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/market/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				
				<%@ include file = "../include/market_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/market/sub01_title.gif" alt="수아밀 제품 주문" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린장터&nbsp;>&nbsp;수아밀 제품 주문<p>
				</div>
				<table cellpadding="0" cellspacing="0" border="0" class="market_board01">
					<colgroup>
						<col width="5%" />
						<col width="20%" />
						<col width="*" />
						<col width="10%" />
						<col width="10%" />
						<col width="15%" />
					</colgroup>
					<tr>
						<th>번호</th>
						<th>상품이미지</th>
						<th>상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>구매</th>
					</tr>
					
					<%
					
					int vNum = 0;
					int countNum = 0;
					String path="";

					for (ProductDTO dto : bbs) {
						vNum = totalRecordCount - (((nowPage - 1) * pageSize) + countNum++);
						
					path = "../images/market/"+ dto.getImage();

					%>
					<tr> 
						<form action="">
						<input type="hidden" name="num" value="<%=dto.getNum() %>" /> 
						<input type="hidden" name="price" value="<%=dto.getPrice() %>" />
						<input type="hidden" name="mileage" value="<%=dto.getMileage() %>" />
						<td><%=vNum %></td> 
						<td><a href="market_view.jsp?num=<%=dto.getNum() %>"><img src="<%=path %>" width="100" height="100"/></a></td>
						<td class="t_left"><a href="market_view.jsp?num=<%=dto.getNum() %>"><%=dto.getName() %></a></td>
						<td class="p_style"><%=dto.getPrice() %></td>
						<td><input type="number" name="qty" value="0" class="n_box" min="0"/></td>
						<td><input type="image" src="../images/market/btn01.gif" style="margin-bottom:5px;" onclick="this.form.action='basket02.jsp'" /><br /><input type="image" src="../images/market/btn02.gif" onclick="this.form.action='basketProc.jsp'"/></td>
						</form>
					</tr>
					<% } %>
				</table> 
				<div class="row text-center">
							<!-- 페이지번호 부분 -->
							<ul class="pagination">
								<%=PagingUtil.pagingBS4(totalRecordCount, pageSize, blockPage, nowPage, "sub01.jsp?")%>
							</ul>
						</div>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>
