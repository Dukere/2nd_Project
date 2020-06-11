<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	session.removeAttribute("user_id");
	session.removeAttribute("user_pw");
	session.removeAttribute("user_name");
	session.removeAttribute("user_auth");
	
	session.invalidate();
	
	response.sendRedirect("adLogin.jsp");
%>
