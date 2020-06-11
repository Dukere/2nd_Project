<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="smtp.SMTPAuth"%>
<%@page import="model.MemDTO"%>
<%@page import="model.MemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
   	페이지상단에 불필요한 공백을 재거하기 위해 사용하는
   	디렉티브로 안드로이드에서 서버와 통신할떄 가끔 공백떄문에 
  	오류가 발생하는 경우가 있으므로 반드시 제거시켜주는것이 
  	좋다.
--%>
      
<%@ page trimDirectiveWhitespaces="true" %>
<%
request.setCharacterEncoding("UTF-8");


String id =request.getParameter("id");
String name =request.getParameter("name");
String email =request.getParameter("email");

if(email==null){

	MemDAO dao = new MemDAO(application);
	MemDTO memDTO = dao.getMemDTO(id);
	
	//중복 시
	if(memDTO.getId()!=null){
		out.print(1);
	//안 중복 시	
	}else{
		out.print(0);
	}
}
else if(id==null){
	MemDAO dao = new MemDAO(application);
	id = dao.getId(name, email);
	
	if(id==null){
		out.print(0);
	//안 중복 시	
	}else{
		out.print(id);
	}
}
else {
	
	MemDAO dao = new MemDAO(application);
	String pass = dao.getPass(id, name, email);

	if(pass==null){
		out.print(0);
	}else{
		
		request.setCharacterEncoding("UTF-8");
		SMTPAuth smtp = new SMTPAuth();

		Map<String, String> emailContent = new HashMap<String, String>();
		emailContent.put("from", "j941223@naver.com");
		emailContent.put("to", email);
		emailContent.put("subject", "요청하신 비밀번호입니다.");
		emailContent.put("content", "요청하신 비밀번호는 '"+ pass +"' 입니다.");

		
		boolean emailResult = smtp.emailSending(emailContent);
		if(emailResult == true){
			System.out.print("메일발송성공");
		}
		else{
			System.out.print("메일발송실패");
		}
			
		out.print(pass);
	}
}
%>