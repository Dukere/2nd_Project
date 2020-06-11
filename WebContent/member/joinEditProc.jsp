<%@page import="model.MemDAO"%>
<%@page import="model.MemDTO"%>
<%@page import="model.BoardDAO"%>
<%@page import="model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 파일명: EditProc.jsp --%>
    
    <%@ include file="../common/isLogin.jsp" %>
    
<!-- 해당 파일 내에서 bname에 대한 폼값을 받고 있음 -->
<%@ include file = "../common/isFlag.jsp" %>
    
<%
	request.setCharacterEncoding("UTF-8");
            
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	String tel = request.getParameter("tel");
	String mobile = request.getParameter("mobile");
	String email = request.getParameter("email");
	String openemail = request.getParameter("openemail");
	String auth = request.getParameter("auth");
	String zip = request.getParameter("zip");
	String addr = request.getParameter("addr");
	String extraaddr = request.getParameter("extraaddr");
            
    MemDTO dto = new MemDTO();
    dto.setName(name);
    dto.setId(id);
    dto.setPass(pass);
    dto.setTel(tel);
    dto.setMobile(mobile);
    dto.setEmail(email);
    dto.setOpenemail(openemail);
    dto.setAuth(auth);
    dto.setZip(zip);
    dto.setAddr(addr);
    dto.setExtraaddr(extraaddr);
            
    MemDAO dao = new MemDAO(application);
            
    int affected =dao.updateEdit(dto);
    if(affected==1){
    	//정상적으로 수정되었다면 수정된 내용의 확인을 위해 상세보기로 이동
    	JavascriptUtil.jsAlertLocation("수정되었습니다.","adMemberView.jsp?id="+dto.getId(),out);
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
    
    