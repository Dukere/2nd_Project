<%@page import="model.MemDAO"%>
<%@page import="model.MemDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

//폼값 전송 받기 
String name = request.getParameter("name");
String id = request.getParameter("id");
String pass = request.getParameter("pass");

String tel1 = request.getParameter("tel1");
String tel2 = request.getParameter("tel2");
String tel3 = request.getParameter("tel3");
String mobile1 = request.getParameter("mobile1");
String mobile2 = request.getParameter("mobile2");
String mobile3 = request.getParameter("mobile3");
String email1 = request.getParameter("email1");
String email2 = request.getParameter("email2");
String openemail = request.getParameter("openemail");
String zip = request.getParameter("zip1");
String addr1 = request.getParameter("addr1"); 
String addr2 = request.getParameter("addr2");
String extraaddr = request.getParameter("extraAddr");

String tel= tel1 + tel2 + tel3;
String mobile= mobile1 + mobile2 + mobile3;
String email= email1 +'@'+ email2;
String addr= addr1 + addr2;

//폼값을 DTO객체에 저장

MemDTO dto = new MemDTO();
dto.setName(name);
dto.setId(id);
dto.setPass(pass);
dto.setTel(tel);
dto.setMobile(mobile);
dto.setEmail(email);
dto.setOpenemail(openemail);
dto.setZip(zip);
dto.setAddr(addr);
dto.setExtraaddr(extraaddr);


//DAO객체 생성시 application내장객체를 인자로 전달
MemDAO dao = new MemDAO(application);
//사용자의 입력값을 DTO객체에 저장후 파라미터로 전달

int affected = dao.insertMemDTO(dto);

if(affected == 1) {
	//글쓰기에 성공했을때.
	%>
	<script>
		alert("회원 가입 성공");
		window.location = '../main/main.jsp';
	</script>
	<% 
	
}else{
	//글쓰기에 샐패했을때...
%>
	<script>
		alert("회원 가입 실패");
		history.go(-1);
	</script>
	
<%
}
%>
