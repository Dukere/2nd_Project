<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="smtp.SMTPAuth"%>
<%@page import="model.requestDAO"%>
<%@page import="model.blueDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../common/isLogin.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");

String name = request.getParameter("name");

String addr = request.getParameter("addr");

String tel1 = request.getParameter("tel1");
String tel2 = request.getParameter("tel2");
String tel3 = request.getParameter("tel3");
String tel = tel1 + tel2 + tel3;

String mobile1 = request.getParameter("mobile1");
String mobile2 = request.getParameter("mobile2");
String mobile3 = request.getParameter("mobile3");
String mobile = mobile1 + mobile2 + mobile3;

String email1 = request.getParameter("email1");
String email2 = request.getParameter("email2");
String email = email1 + "@" + email2;

String cleantype = request.getParameter("cleantype");

String area = request.getParameter("area");

String cleandate = request.getParameter("cleandate");

String receipt = request.getParameter("receipt");

String memo = request.getParameter("memo");

blueDTO dto = new blueDTO();

dto.setId(id);
dto.setName(name);
dto.setAddr(addr);
dto.setTel(tel);
dto.setMobile(mobile);
dto.setEmail(email);
dto.setCleantype(cleantype);
dto.setArea(area);
dto.setCleandate(cleandate);
dto.setReceipt(receipt);
dto.setMemo(memo);

requestDAO dao = new requestDAO(application);

int affected = dao.orderBlue(dto);

if(tel.equals("")){
	tel = "연락처 없음";
}

SMTPAuth smtp = new SMTPAuth();

Map<String, String> emailContent = new HashMap<String, String>();
emailContent.put("from", "j941223@naver.com");
emailContent.put("to", email);
emailContent.put("subject", "블루클리닝 신청서");
emailContent.put("content", 
		" 아이디 : "+ id +"<br>" +
		" 고객명/회사명 : "+ name +"<br>" +
		" 청소할 곳 주소 : "+ addr +"<br>" +
		" 연락처 : "+ tel +"<br>" +
		" 휴대전화 : "+ mobile +"<br>" +
		" 이메일 : "+ email +"<br>" +
		" 청소종류 : "+ cleantype +"<br>" +
		" 분양평수/등기평수 : "+ area +"<br>" +
		" 청소희망날짜 : "+ cleandate +"<br>" +
		" 접수 종류 : "+ receipt +"<br>" +
		" 기타특이사항 : "+ memo +"<br>"		
		);

Map<String, String> emailContent2 = new HashMap<String, String>();
emailContent2.put("from", "j941223@naver.com");
emailContent2.put("to", "j941223@naver.com");
emailContent2.put("subject", "블루클리닝 신청서");
emailContent2.put("content", 
		" 아이디 : "+ id +"<br>" +
		" 고객명/회사명 : "+ name +"<br>" +
		" 청소할 곳 주소 : "+ addr +"<br>" +
		" 연락처 : "+ tel +"<br>" +
		" 휴대전화 : "+ mobile +"<br>" +
		" 이메일 : "+ email +"<br>" +
		" 청소종류 : "+ cleantype +"<br>" +
		" 분양평수/등기평수 : "+ area +"<br>" +
		" 청소희망날짜 : "+ cleandate +"<br>" +
		" 접수 종류 : "+ receipt +"<br>" +
		" 기타특이사항 : "+ memo +"<br>"		
		);

boolean emailResult = smtp.emailSending(emailContent);
if(emailResult == true){
	System.out.print("메일1발송성공");
}
else{
	System.out.print("메일1발송실패");
}

boolean emailResult2 = smtp.emailSending(emailContent2);
if(emailResult2 == true){
	System.out.print("메일1발송성공");
}
else{
	System.out.print("메일1발송실패");
}


if(affected == 1) {
	//글쓰기에 성공했을때.
%>
	<script>
		alert("신청 완료");
		window.location = '../main/main.jsp';
	</script>
	<% 
	
}else{
	//글쓰기에 샐패했을때...
%>
	<script>
		alert("신청 실패");
		history.go(-1);
	</script>
	
<%
}
%>

