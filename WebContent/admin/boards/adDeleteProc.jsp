<%@page import="util.JavascriptUtil"%>
<%@page import="model.BoardDAO"%>
<%@page import="model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../adIsLogin.jsp" %>

<%@ include file = "adIsFlag.jsp" %>
<%
	//한글 꺠짐 방지 안해도됌
/* request.setCharacterEncoding("UTF-8"); */

String num = request.getParameter("num");//제목

BoardDTO dto = new BoardDTO();
BoardDAO dao = new BoardDAO(application);
//작성자 보인 확인 위해
dto =dao.selectView(num); 
//세션영역에 저장된 로그인 아이디를 String으로 가져온다.
String session_id = session.getAttribute("user_id").toString();
int affected = 0;
//세션영역과 DB상의 작성자가 동일한지 확인하여true 일떄는 삭제처리
if(session_id.equals(dto.getId())){
	dto.setNum(num);
	affected =dao.delete(dto);
	
}else{
	//false일때는 경고창으로 알림후 뒤로가기 처리
	JavascriptUtil.jsAlertBack("본인만 삭제가능합니다.",out);
	return;
}
if(affected ==1){
	
	JavascriptUtil.jsAlertLocation("삭제되었습니다.","adBoardList.jsp?bname="+bname,out);
}else{
	out.println(JavascriptUtil.jsAlertBack("삭제실패하였습니다."));
}
%>



