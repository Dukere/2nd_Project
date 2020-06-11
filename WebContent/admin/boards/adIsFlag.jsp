<%@page import="util.JavascriptUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String bname = request.getParameter("bname");
String uri = request.getRequestURI();
String boardTitle="";

if(uri.contains("adMember")){
	boardTitle="회원 관리";
}
else{
if(bname==null || bname.equals("")){
	//만약 bname의 값이 없다면 로그인 화면으로 강제 이동
	JavascriptUtil.jsAlertLocation("필수 파라미터 누락됨", "../index.jsp", out);
	return;
}

 
switch(bname){
case "free":
	boardTitle="자유게시판";
	break;
case "program":
	boardTitle="프로그램 일정";
	break;
case "notice":
	boardTitle="공지사항";
	break;
case "pic":
	boardTitle="사진 게시판";
	break;
case "info":
	boardTitle="정보 자료실";
	break; 
case "emp":
	boardTitle="직원 자료실";
	break;
case "guard":
	boardTitle="보호자 게시판";
	break;
}
}
%>