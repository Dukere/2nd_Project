<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("user_id")==null){
%>  		
	<script>
		alert("로그인 후 이용해주십시오.");
		location.href= "../main/main.jsp";
	</script>  	
<%	
	return;
}
%>