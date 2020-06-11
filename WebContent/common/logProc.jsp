<%@page import="model.MemDTO"%>
<%@page import="model.MemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   	String id= request.getParameter("user_id");
   	String pw= request.getParameter("user_pw");
   	
   	String id_save = request.getParameter("id_save");
   	
   	if(id_save == null) {
		//쿠키를 삭제하기 위해 빈 쿠키를 생성한다.
		Cookie ck = new Cookie("user_id", "");
		ck.setPath(request.getContextPath());
		ck.setMaxAge(0);//유효시간이 0이므로 사용할 수 없는 쿠키가 된다.
		response.addCookie(ck);
	}   	
   	else {
		//사용자가 입력한 아이디로 쿠키를 생성한다.
		Cookie ck = new Cookie("user_id", id);
		System.out.println(request.getContextPath());
		ck.setPath(request.getContextPath());
		//시간지정
		ck.setMaxAge(60*30);
		response.addCookie(ck);
	}
   	
   	MemDAO dao = new MemDAO(application);
   	MemDTO memDTO = dao.getMemDTO(id,pw);
   	
   	if(memDTO.getId()!=null){
	   session.setAttribute("user_id", memDTO.getId());
	   session.setAttribute("user_pw", memDTO.getPass());
	   session.setAttribute("user_name", memDTO.getName());
	   session.setAttribute("user_auth", memDTO.getAuth());
	   
	   response.sendRedirect("../main/main.jsp");
	   
   	}else{
   		%>
		<script>
		alert("회원 정보가 없거나 비밀번호가 일치하지 않습니다.");
		history.go(-1);
		</script>
		<%
   	}
%>