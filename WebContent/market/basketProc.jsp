<%@page import="model.BasketDAO"%>
<%@page import="model.BasketDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../common/isLogin.jsp"%>
    
<%

request.setCharacterEncoding("UTF-8");

String id = session.getAttribute("user_id").toString();

String num = request.getParameter("num");

String mileage = request.getParameter("mileage");

String qty1 = request.getParameter("qty");
String price1 = request.getParameter("price");

int qty = Integer.parseInt(qty1);
int price = Integer.parseInt(price1);

int total = qty * price ;

BasketDTO dto = new BasketDTO();

dto.setId(id);
dto.setMileage(mileage);
dto.setNum(num);
dto.setPrice(price);
dto.setQty(qty);
dto.setTotal(total);

BasketDAO dao = new BasketDAO(application);

int affected = dao.insertBasket(dto);

if(affected == 1) {
	//글쓰기에 성공했을때.
%>
	<script>
		alert("담기 완료");
		window.location = '../market/basket.jsp';
	</script>
	<% 
	
}else{
	//글쓰기에 샐패했을때...
%>
	<script>
		alert("담기 실패");
		history.go(-1);
	</script>
	
<%
}
%>