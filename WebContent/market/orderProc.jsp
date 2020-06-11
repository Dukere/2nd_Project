<%@page import="java.util.List"%>
<%@page import="model.OrderDAO"%>
<%@page import="model.OrderDTO"%>
<%@page import="model.BasketDAO"%>
<%@page import="model.BasketDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../common/isLogin.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");

	//폼값 전송 받기 
	String id = session.getAttribute("user_id").toString();

	String oname = request.getParameter("name");
	String otel1 = request.getParameter("tel1");
	String otel2 = request.getParameter("tel2");
	String otel3 = request.getParameter("tel3");
	String omobile1 = request.getParameter("mobile1");
	String omobile2 = request.getParameter("mobile2");
	String omobile3 = request.getParameter("mobile3");
	String oemail1 = request.getParameter("email1");
	String oemail2 = request.getParameter("email2");
	String ozip = request.getParameter("zip1");
	String oaddr1 = request.getParameter("addr1");
	String oaddr2 = request.getParameter("addr2");
	String oextraaddr = request.getParameter("extraAddr");

	String otel = otel1 + otel2 + otel3;
	String omobile = omobile1 + omobile2 + omobile3;
	String oemail = oemail1 + '@' + oemail2;
	String oaddr = oaddr1 + oaddr2;

	String sname = request.getParameter("name2");
	String stel1 = request.getParameter("tel12");
	String stel2 = request.getParameter("tel22");
	String stel3 = request.getParameter("tel32");
	String smobile1 = request.getParameter("mobile12");
	String smobile2 = request.getParameter("mobile22");
	String smobile3 = request.getParameter("mobile32");
	String semail1 = request.getParameter("email12");
	String semail2 = request.getParameter("email22");
	String szip = request.getParameter("zip12");
	String saddr1 = request.getParameter("addr12");
	String saddr2 = request.getParameter("addr22");
	String sextraaddr = request.getParameter("extraAddr2");

	String stel = otel1 + otel2 + otel3;
	String smobile = omobile1 + omobile2 + omobile3;
	String semail = oemail1 + '@' + oemail2;
	String saddr = oaddr1 + oaddr2;

	String total = request.getParameter("total");
	String payment = request.getParameter("payment");

	String ordering = "";
	BasketDAO dao2 = new BasketDAO(application);

	List<BasketDTO> bbs = dao2.selectList(id);

	for (BasketDTO dto : bbs) {

		ordering += " // 품번 : " + dto.getNum() + ", 가격  : " + dto.getPrice() + ", 갯수 : " + dto.getQty();

	}

	BasketDTO dto2 = new BasketDTO();

	//폼값을 DTO객체에 저장

	OrderDTO dto = new OrderDTO();

	dto.setOname(oname);
	dto.setId(id);
	dto.setOmobile(omobile);
	dto.setOemail(oemail);
	dto.setOzip(ozip);
	dto.setOaddr(oaddr);
	dto.setOextraaddr(oextraaddr);
	dto.setSname(sname);
	dto.setSmobile(smobile);
	dto.setSemail(semail);
	dto.setSzip(szip);
	dto.setSaddr(saddr);
	dto.setSextraaddr(sextraaddr);
	dto.setOrdering(ordering);
	dto.setTotal(total);
	dto.setPayment(payment);

	OrderDAO dao = new OrderDAO(application);

	int affected = dao.insertOrder(dto);

	if (affected == 1) {
		//글쓰기에 성공했을때.
%>
<script>
	alert("구매서 작성 완료");
	
</script>
<%
	} else {
		//글쓰기에 샐패했을때...
%>
<script>
	alert("작성 실패");
	history.go(-1);
</script>

<%
	}
	int affected2 = dao2.deleteBasket(id);
	if (affected2 == 1) {
%>
<script>
	alert("장바구니 비우기 성공");
	window.location = '../market/sub01.jsp';
</script>

<%
	} else {
%>
	<script>
		alert("비우기 실패");
		history.go(-1);
	</script>
<%
	}
%>