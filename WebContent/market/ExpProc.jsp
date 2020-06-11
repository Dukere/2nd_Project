<%@page import="model.ExpDTO"%>
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

String disabled = request.getParameter("disabled");
String disabledtype = request.getParameter("disabledtype");

String equip = request.getParameter("equip");
String equipname = request.getParameter("equipname");

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

String cakeexp = request.getParameter("cakeexp");
String cookieexp = request.getParameter("cookieexp");

String expdate = request.getParameter("expdate");

String receipt = request.getParameter("receipt");

String memo = request.getParameter("memo");

ExpDTO dto = new ExpDTO();

dto.setName(name);
dto.setDisabled(disabled);
dto.setDisabledtype(disabledtype);
dto.setEquip(equip);
dto.setEquipname(equipname);
dto.setTel(tel);
dto.setMobile(mobile);
dto.setEmail(email);
dto.setCakeexp(cakeexp);
dto.setCookieexp(cookieexp);
dto.setId(id);
dto.setExpdate(expdate);
dto.setReceipt(receipt);
dto.setMemo(memo);

requestDAO dao = new requestDAO(application);

int affected = dao.orderExp(dto);

if(tel.equals("")){
	tel = "연락처 없음";
}

SMTPAuth smtp = new SMTPAuth();

Map<String, String> emailContent = new HashMap<String, String>();
emailContent.put("from", "j941223@naver.com");
emailContent.put("to", email);
emailContent.put("subject", "체험학습 신청서");
emailContent.put("content", 
		" 아이디 : "+ id +"<br>" +
		" 고객명/회사명 : "+ name +"<br>" +
		" 장애유무 : "+ disabled +"<br>" +
		" 주요장애유형 : "+ disabledtype +"<br>" +
		" 보장구 사용유무 : "+ equip +"<br>" +
		" 보장구 명 : "+ equipname +"<br>" +
		" 연락처 : "+ tel +"<br>" +
		" 휴대전화 : "+ mobile +"<br>" +
		" 이메일 : "+ email +"<br>" +
		" 케잌체험 : "+ cakeexp +"<br>" +
		" 쿠키체험 : "+ cookieexp +"<br>" +
		" 체험희망날짜 : "+ expdate +"<br>" +
		" 접수 종류 : "+ receipt +"<br>" +
		" 기타특이사항 : "+ memo +"<br>"		
		); 

Map<String, String> emailContent2 = new HashMap<String, String>();
emailContent2.put("from", "j941223@naver.com");
emailContent2.put("to", "j941223@naver.com");
emailContent2.put("subject", "체험학습 신청서");
emailContent2.put("content", 
		" 아이디 : "+ id +"<br>" +
		" 고객명/회사명 : "+ name +"<br>" +
		" 장애유무 : "+ disabled +"<br>" +
		" 주요장애유형 : "+ disabledtype +"<br>" +
		" 보장구 사용유무 : "+ equip +"<br>" +
		" 보장구 명 : "+ equipname +"<br>" +
		" 연락처 : "+ tel +"<br>" +
		" 휴대전화 : "+ mobile +"<br>" +
		" 이메일 : "+ email +"<br>" +
		" 케잌체험 : "+ cakeexp +"<br>" +
		" 쿠키체험 : "+ cookieexp +"<br>" +
		" 체험희망날짜 : "+ expdate +"<br>" +
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

%>