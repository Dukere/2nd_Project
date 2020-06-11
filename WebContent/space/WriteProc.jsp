<%@page import="model.BoardDAO"%>
<%@page import="model.BoardDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../common/isFlag.jsp" %>

<%

//폼값 전송 받기 
String title = request.getParameter("title");//제목
String content = request.getParameter("content");//제목

//폼값을 DTO객체에 저장
BoardDTO dto = new BoardDTO();
dto.setTitle(title);
dto.setContent(content);
dto.setBname(bname);

//세션 영역에 저장된 회원인증정보를 가져와서 저장.
dto.setId(session.getAttribute("user_id").toString());

//DAO객체 생성시 application내장객체를 인자로 전달
BoardDAO dao = new BoardDAO(application);
//사용자의 입력값을 DTO객체에 저장후 파라미터로 전달
/* int affected =0;
for(int i=1; i<=50; i++){
	dto.setTitle(title+i+"번째 게시물 ");
	affected =dao.insertWrite(dto);
} */
int affected = dao.insertWrite(dto); 

if(affected == 1) {
	//글쓰기에 성공했을때.
	response.sendRedirect("space_list.jsp?bname="+bname);
	
}else{
	//글쓰기에 샐패했을때...
%>
	<script>
		alert("글쓰기에 실패하였습니다.");
		history.go(-1);
	</script>
	
<%
}

%>
