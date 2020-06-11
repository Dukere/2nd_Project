<%@page import="model.BasketDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.BasketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@ include file="../common/isLogin.jsp"%>
<%
String id = session.getAttribute("user_id").toString();

BasketDAO dao = new BasketDAO(application);

List<BasketDTO> bbs = dao.selectList(id); 
 
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
				<table cellpadding="0" cellspacing="0" border="0" class="basket_list">
					<colgroup>
						<col width="20%" />
						<col width="*" />
						<col width="20%" />
						<col width="15%" />
						<col width="10%" />
						<col width="15%" />
					</colgroup>
					<thead>
						<tr>
							<th>이미지</th>
							<th>상품명</th>
							<th>판매가</th>
							<th>적립금</th>
							<th>수량</th>
							<th>합계</th>
						</tr>
					</thead>
					<tbody>
					<%
					
					String path="";
					int allTotal = 0;

					for (BasketDTO dto : bbs) {
						
						allTotal += dto.getTotal();
						
						path = "../images/market/"+ dto.getImage();

					%>
						<tr>
							<td><img src="<%=path %>" width="50" height="50"/></td>
							<td><%=dto.getName() %></td>
							<td><%=dto.getPrice() %>원</td>
							<td><img src="../images/market/j_icon.gif" />&nbsp;<%=dto.getMileage() %></td>
							<td><input type="number" name="qty" value="<%=dto.getQty() %>" class="basket_num" readonly/></td>
							<td><span><%=dto.getTotal() %><span></td>
						</tr>
					<% } %>
					</tbody>
				</table>
				<p class="basket_text">총액 : <span class="money"><%=allTotal %></span><br /><br /><a href="sub01.jsp"><img src="../images/market/basket_btn01.gif" /></a>&nbsp;<a href="basket02.jsp"><img src="../images/market/basket_btn02.gif" /></a></p>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>
