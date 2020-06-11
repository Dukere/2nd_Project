<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    
<!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=path %>index.jsp">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3"><%=session.getAttribute("user_id") %>님, 안녕하세요</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="<%=path %>index.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>관리자 페이지</span></a>
      </li>

      <!-- Divider --> 
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        시스템 관리
      </div>

		
		<%
		
		String mem1="", mem2="", blue1="", blue2="", exp1="", exp2="", ord1="", ord2="", a0="", a1="", a2="", a3="", a4="", a5="", b0="", b1="", b2="" ;
		
		if(uri.contains("adMember")){
			mem1="show";
			mem2="active";
		}
		if(uri.contains("adBlue")){
			blue1="show";
			blue2="active";
		}
		if(uri.contains("adExp")){
			exp1="show";
			exp2="active";
		}
		if(uri.contains("adOrd")){
			ord1="show";
			ord2="active";
		}
		
		 if(uri.contains("adBoard")){
	
		switch(bname){
		case "notice":
			a0="show";
			a1="active";
			break;
		case "program":
			a0="show";
			a2="active";
			break;
		case "free":
			a0="show";
			a3="active";
			break;
		case "pic":
			a0="show";
			a4="active";
			break;
		case "info":
			a0="show";
			a5="active";
			break;
		case "emp":
			b0="show";
			b1="active";
			break;
		case "guard":
			b0="show";
			b2="active";
			break;
			}
		} 
		%>
		
      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item <%=mem2 %>">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>회원 관리</span>
        </a>
        <div id="collapseTwo" class="collapse <%=mem1 %>" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">회원 관리</h6>
            <a class="collapse-item <%=mem2 %>" href="<%=path %>boards/adMember.jsp">회원 관리</a>
          </div>
        </div>
      </li>
		
      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item <%=a1 %><%=a2 %><%=a3 %><%=a4 %><%=a5 %>">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>게시판 관리</span> 
        </a>
        <div id="collapseUtilities" class="collapse <%=a0 %>" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">게시판 관리</h6>
            <a class="collapse-item <%=a1 %>" href="<%=path %>boards/adBoardList.jsp?bname=notice">공지사항</a>
            <a class="collapse-item <%=a2 %>" href="<%=path %>boards/adProg.jsp?bname=program">프로그램 일정</a>
            <a class="collapse-item <%=a3 %>" href="<%=path %>boards/adBoardList.jsp?bname=free">자유게시판</a>
            <a class="collapse-item <%=a4 %>" href="<%=path %>boards/adBoardList.jsp?bname=pic">사진게시판</a>
            <a class="collapse-item <%=a5 %>" href="<%=path %>boards/adBoardList.jsp?bname=info">정보자료실</a>
          </div>
        </div>
      </li>
      
      <li class="nav-item <%=b1 %><%=b2 %>">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapse3" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>커뮤니티 관리</span> 
        </a>
        <div id="collapse3" class="collapse <%=b0 %>" aria-labelledby="heading3" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">커뮤니티 관리</h6>
            <a class="collapse-item <%=b1 %>" href="<%=path %>boards/adBoardList.jsp?bname=emp">직원자료실</a>
            <a class="collapse-item <%=b2 %>" href="<%=path %>boards/adBoardList.jsp?bname=guard">보호자 게시판</a>
          </div>
        </div>
      </li>
 
      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        열린 공간
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item <%=blue2 %><%=exp2 %>">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>주문 관리</span>
        </a>
        <div id="collapsePages" class="collapse <%=blue1 %><%=exp1 %><%=ord1 %>" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item <%=blue2 %>" href="<%=path %>boards/adBlue.jsp">블루클리닝</a>
            <a class="collapse-item <%=exp2 %>" href="<%=path %>boards/adExp.jsp">체험학습</a>
            <a class="collapse-item <%=ord2 %>" href="<%=path %>boards/adOrder.jsp">주문 관리</a>
          </div>
        </div>
      </li>
      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>
</ul>