<%@page import="model.ProductDTO"%>
<%@page import="model.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>

<%

String nowPage = request.getParameter("nowPage");
if (nowPage == null || nowPage.equals(""))
	nowPage = "1";
String queryStr = "nowPage=" + nowPage;

String num = request.getParameter("num");
ProductDAO dao = new ProductDAO(application);

String id = session.getAttribute("user_id").toString();

ProductDTO dto = dao.selectView(num);

String path = "../images/market/"+ dto.getImage();

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
				<div class="market_view_box">
					<div class="market_left">
						<img src="<%=path %>" />
					</div>
					<div class="market_right">
						<p class="m_title"><%=dto.getName() %>
						<ul class="m_list">
							<li>
								<dl>
									<dt>가격</dt>
									<dd class="p_style"><%=dto.getPrice() %></dd>
								</dl>
								<dl>
									<dt>적립금</dt>
									<dd><%=dto.getMileage() %></dd>
								</dl>
								<dl>
									<dt>수량</dt>
									<dd><input type="text" name="" value="1" class="n_box" /></dd>
								</dl>
								<dl style="border-bottom:0px;">
									<dt>주문정보</dt>
									<dd><input type="text" name="" class="n_box" style="width:200px;" /></dd>
								</dl>
								<div style="clear:both;"></div>
							</li>
						</ul>
						<p class="btn_box"><a href=""><img src="../images/market/m_btn01.gif" alt="바로구매" /></a>&nbsp;&nbsp;<a href="basket.jsp"><img src="../images/market/m_btn02.gif" alt="장바구니" /></a></p>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>
