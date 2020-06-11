<%@page import="model.MemDTO"%>
<%@page import="model.MemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String id= request.getParameter("user_id");
   String pw= request.getParameter("user_pw");
   
   MemDAO dao = new MemDAO(application);
   MemDTO memDTO = dao.getMemDTO(id,pw);
   if(memDTO.getId()!=null){
	   session.setAttribute("user_id", memDTO.getId());
	   session.setAttribute("user_pw", memDTO.getPass());
	   session.setAttribute("user_name", memDTO.getName());
	   session.setAttribute("user_auth", memDTO.getAuth());
	   
	   response.sendRedirect("index.jsp");
	   
   }else{
	   request.setAttribute("ERROR_MSG","권한이 없습니다.");
	   request.getRequestDispatcher("adLogin.jsp").forward(request, response);
   }
%>