<%@page import="model.BoardDAO"%>
<%@page import="model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 파일명: EditProc.jsp --%>
    
    <%@ include file="../adIsLogin.jsp" %>
    
<!-- 해당 파일 내에서 bname에 대한 폼값을 받고 있음 -->
<%@ include file = "adIsFlag.jsp" %>
    
    <%
        	request.setCharacterEncoding("UTF-8");
                    
                    String num = request.getParameter("num");
                    String title = request.getParameter("title");
                    String content =request.getParameter("content");
                    
                    BoardDTO dto = new BoardDTO();
                    dto.setNum(num);
                    dto.setTitle(title);
                    dto.setContent(content); 
                    dto.setBname(bname);
                    
                    BoardDAO dao = new BoardDAO(application);
                    
                    int affected =dao.updateEdit(dto);
                    if(affected==1){
                    	//정상적으로 수정되었다면 수정된 내용의 확인을 위해 상세보기로 이동
                    	response.sendRedirect("adBoardView.jsp?bname="+bname+"&num="+dto.getNum());
                    	
                    }
                    else{
                    	//수정중 문제가 발생하였다면 수정하기 페이지로 돌아간다.
        %>
   		<script>
   			alert("수정하기에 실패하셨습니다.");
   			history.go(-1);
   			
   		</script>
   		<%
    }
   		%>
    
    